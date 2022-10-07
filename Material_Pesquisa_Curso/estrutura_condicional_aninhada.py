# Modelo de Estrutura Condiconal Aninhada - If dentro de if .
# Objetivo do codigo é de acordo com a conta e o valor do saque, quais mensagens serão apresentadas.

Tipo_Conta= int(input("Em qual conta deseja sacar?"))
saque = int(input("Qual valor deseja sacar?"))

cheque_especial = 450
saldo = 2000

if Tipo_Conta == 1:
    if saldo >= saque :
        print("Saque realizado com sucesso!")

    elif saque <=(saldo + cheque_especial):
        print("Saque realizado com cheque especial!")
    else:
        print("Saldo insuficiente")
elif Tipo_Conta == 2:
    if saldo >=saque:
        print("Saque realizado com sucesso!")
    else:
        print("Saldo insuficiente!")
