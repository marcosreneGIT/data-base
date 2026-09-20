import psycopg2

def conectar():
    """
    Função para conectar ao servidor
    """
    try:
        conn = psycopg2.connect(
            database='secao18',
            host='localhost',
            user='marcos',
            password='1234'
        )
        return conn
    except psycopg2.Error as e:
        print(f'Erro ao conectar ao servidor: {e}')
    print('Conectando ao servidor...')

def desconectar(conn):
    """ 
    Função para desconectar do servidor.
    """
    if conn:
        conn.close()
    print('Desconectando do servidor...')


def listar():
    """
    Função para listar os produtos
    """
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM produtos')
    produtos = cursor.fetchall()
    
    if len(produtos) > 0:
        print('Listando produtos: ')
        print('------------------------------------')
        for produto in produtos:
            print(f'ID: {produto[0]}')
            print(f'Nome: {produto[1]}')
            print(f'Preço: {produto[2]}')
            print(f'Quantidade: {produto[3]}')
            print('------------------------------------')
    else:
        print('Nenhum produto encontrado.')
    
    desconectar(conn)  
              
def inserir():
    """
    Função para inserir um produto
    """  
    conn = conectar()
    cursor = conn.cursor()
    
    nome = input('Digite o nome do produto: ')
    preco = float(input('Digite o preço do produto: '))
    quantidade = int(input('Digite a quantidade do produto: '))
    
    cursor.execute('INSERT INTO produtos (nome, preco, estoque) VALUES (%s, %s, %s)', (nome, preco, quantidade))
    conn.commit()
    
    if cursor.rowcount == 1:
        print('Produto inserido com sucesso.')
    else:
        print('Erro ao inserir produto.')
        
    print('Inserindo produto...')
    desconectar(conn)

def atualizar():
    """
    Função para atualizar um produto
    """
    conn = conectar()
    cursor = conn.cursor()
    
    codigo = int(input('Digite o código do produto que deseja atualizar: '))
    nome = input('Digite o novo nome do produto: ')
    preco = float(input('Digite o novo preço do produto: '))
    quantidade = int(input('Digite a nova quantidade do produto: '))
    
    cursor.execute('UPDATE produtos SET nome=%s, preco=%s, estoque=%s WHERE id=%s', (nome, preco, quantidade, codigo))
    conn.commit()

    if cursor.rowcount == 1:
        print('Produto atualizado com sucesso.')
    else:
        print('Erro ao atualizar produto.')

    print('Atualizando produto...')
    print('Produto atualizado com sucesso.')
    desconectar(conn)

def deletar():
    """
    Função para deletar um produto
    """  
    conn = conectar()
    cursor = conn.cursor()
    
    codigo = int(input('Digite o código do produto que deseja deletar: '))
    cursor.execute('DELETE FROM produtos WHERE id=%s', (codigo,))
    conn.commit()
    
    if cursor.rowcount == 1:
        print('Produto deletado com sucesso.')
    else:
        print('Erro ao deletar produto.')

    print('Deletando produto...')
    desconectar(conn)

def menu():
    """
    Função para gerar o menu inicial
    """
    print('=========Gerenciamento de Produtos==============')
    print('Selecione uma opção: ')
    print('1 - Listar produtos.')
    print('2 - Inserir produtos.')
    print('3 - Atualizar produto.')
    print('4 - Deletar produto.')
    opcao = int(input())
    if opcao in [1, 2, 3, 4]:
        if opcao == 1:
            listar()
        elif opcao == 2:
            inserir()
        elif opcao == 3:
            atualizar()
        elif opcao == 4:
            deletar()
        else:
            print('Opção inválida')
    else:
        print('Opção inválida')
