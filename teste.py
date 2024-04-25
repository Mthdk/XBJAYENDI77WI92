import os

def salvar_imagens_nao_encontradas(caminhos_imagens, arquivo_saida):
    imagens_nao_encontradas = []
    for caminho_imagem in caminhos_imagens:
        # Verifica se o caminho corresponde a um arquivo e não a um diretório
        if not os.path.isfile(caminho_imagem):
            imagens_nao_encontradas.append(caminho_imagem)
    
    with open(arquivo_saida, 'w') as arquivo:
        for imagem in imagens_nao_encontradas:
            arquivo.write(imagem + '\n')

# Exemplo de uso
caminhos_imagens = [
    "/caminho/do/seu/servidor/servidor1/diretorio1/imagem1.jpg",
    "/caminho/do/seu/servidor/servidor1/diretorio2/imagem2.jpg",
    "/caminho/do/seu/servidor/servidor2/diretorio3/imagem3.jpg"
]

arquivo_saida = "imagens_nao_encontradas.txt"

salvar_imagens_nao_encontradas(caminhos_imagens, arquivo_saida)

print(f"As imagens não encontradas foram salvas em {arquivo_saida}")
