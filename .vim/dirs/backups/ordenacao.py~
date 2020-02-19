"""
Exemplo de Uso do bubble
>>> import ordenacao                                                            
>>> alunos = []                                                                 
>>> alunos.append({'nome':'Rogerio', 'idade':35})                               
>>> alunos.append({'nome':'Aline', 'idade':45})                                 

>>> alunos                                                                      
[{'nome': 'Rogerio', 'idade': 35}, {'nome': 'Aline', 'idade': 45}]

>>> ordenacao.bubble(alunos, 'nome', False)                                     
>>> alunos                                                                      
[{'nome': 'Aline', 'idade': 45}, {'nome': 'Rogerio', 'idade': 35}]

>>> ordenacao.bubble(alunos, 'idade', False)                                    
>>> alunos                                                                      
[{'nome': 'Rogerio', 'idade': 35}, {'nome': 'Aline', 'idade': 45}]


>>> ordenacao.bubble(alunos, 'idade', True)                                     
>>> alunos                                                                      
[{'nome': 'Aline', 'idade': 45}, {'nome': 'Rogerio', 'idade': 35}]
"""


def bubble(colecao, atributo, inverso):
    for i in range(len(colecao)):
        for j in range(len(colecao)-i-1):
            if inverso:
                if colecao[j][atributo] < colecao[j+1][atributo]:
                    x = colecao[j]
                    colecao[j] = colecao[j+1]
                    colecao[j+1] = x
            else:
                if colecao[j][atributo] > colecao[j+1][atributo]:
                    x = colecao[j]
                    colecao[j] = colecao[j+1]
                    colecao[j+1] = x
