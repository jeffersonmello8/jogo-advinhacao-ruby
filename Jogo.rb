tempoderesposta = 0.5

def inicializacao (tempoderesposta)
    puts "\n\n"
    puts "Bem vindo ao jogo da advinhação!"
    puts "\n\n"
    sleep(tempoderesposta)
    puts "Qual é o seu nome?"
    puts "\n"
    nome = gets.chomp 
    puts "\n"
    sleep(tempoderesposta)
    puts "Começaremos o jogo para você, #{nome}!"
    sleep(tempoderesposta)
    puts "\n"
    return nome 
end 

def defineonivel (tempoderesposta)
    puts "\n"
    sleep(tempoderesposta)
    puts "Em qual nível você deseja jogar?"
    puts "\n"
    puts "(1) Muito fácil | (2) Fácil | (3) Médio | (4) Difícil | 5 (Muito difícil)"
    puts "\n"
    nivel = gets.chomp.to_i
    puts "\n"
    if nivel < 1 || nivel > 5
       puts "Por favor, insira um número entre 1 e 5."
    end 
    case nivel  
        when 1 
            numeromaximo = 20 
        when 2
            numeromaximo = 40
        when 3
            numeromaximo = 60
        when 4
            numeromaximo = 100
        else 
            numeromaximo = 200
    end      
    puts "\n"
    sleep(tempoderesposta)
    return numeromaximo.to_i
end 

def sorteio (tempoderesposta, numeromaximo)
    puts "Escolhendo um número no nível de dificuldade que você escolheu..."
    puts "\n"
    sleep(2.0)
    case numeromaximo.to_i
        when 20
            puts "O número que eu escolhi, está entre 1 e #{numeromaximo}. Está muito fácil, se tu perder, é porquê tu é muito ruim."
        when 40
            puts "O número que eu escolhi, está entre 1 e #{numeromaximo}. Não tá muito difícil não. Vamos ver."
        when 60
            puts "O número que eu escolhi, está entre 1 e #{numeromaximo}. Esse nível é aceitável, boa sorte!"
        when 100
            puts "O número que eu escolhi, está entre 1 e #{numeromaximo}. Se tu acertar, tu merece um almoço. Pode cobrar."
        else  
            puts "O número que eu escolhi, está entre 1 e #{numeromaximo}. Se tu acertar, te pago um almoço no Goya."
        end 
    sleep(tempoderesposta)
    puts "\n"
    numerosecreto = rand (1...numeromaximo)
    sleep(tempoderesposta)
    puts "Você tem 5 tentativas."
    puts "\n"
    sleep(tempoderesposta)
    return numerosecreto
end

def recebeatentativa (chutes, chance, nomedogamer, tempoderesposta)
    puts "--- Lá vai sua chance número #{chance}."
    puts "\n"
    sleep(tempoderesposta)
    if chutes.length > 0
        puts "Você já tentou esses números: #{chutes}."
        puts "\n"
    end
    puts "Digite o número que você acha que eu escolhi, #{nomedogamer}."
    puts "\n"
    chute = gets.chomp
    puts "\n"
    sleep(tempoderesposta)
    chute
end

def verseacertou (chute, numerosecreto, tempoderesposta, pontosateagora, nomedogamer)
    puts "Será que você acertou?"
    puts "\n"
    sleep(tempoderesposta)
    puts "Deixa eu conferir aqui"
    sleep(tempoderesposta)
    puts "\n" 
    acertou = chute.to_i == numerosecreto.to_i 
    if  acertou == true 
        puts "--------------------------------------------------------------------------------------------"
        puts "Você acertou! O número que eu escolhi foi #{numerosecreto}. Tu é foda mesmo #{nomedogamer}. " 
        puts "--------------------------------------------------------------------------------------------"
        puts "\n"
        sleep (tempoderesposta)
        ganhou 
        puts "\n"
    else 
        maior = numerosecreto.to_i > chute.to_i
        if maior == true 
            puts "Você errou!" 
            puts "\n"
            sleep(tempoderesposta)
            puts "---------------------------------------------"
            puts "O número que eu escolhi é maior que #{chute}."
            puts "---------------------------------------------"
            puts "\n" 
            sleep(tempoderesposta)
        else 
            puts "Você errou!" 
            puts "\n"
            sleep(tempoderesposta)
            puts "---------------------------------------------"
            puts "O número que eu escolhi é menor que #{chute}."
            puts "---------------------------------------------" 
            puts "\n" 
            sleep(tempoderesposta)
        end
    end
    acertou
end

def querjogar
    quero = "S"
    puts "Você quer jogar novamente? (S/N)"
    quero = gets.chomp
    return quero.upcase  
end 

def ganhou
    puts   "00000000000000000000000000"
    puts   "00000000__________00000000"
    puts   "00000________________00000"
    puts   "000____________________000"
    puts   "00______00______00______00"
    puts   "0______0000____0000______0"
    puts   "0______0000____0000______0"
    puts   "0_______00______00_______0"
    puts   "0________________________0"
    puts   "0______0__________0______0"
    puts   "00______00______00______00"
    puts   "000_______000000_______000"
    puts   "00000________________00000"
    puts   "00000000___________0000000"
    puts   "00000000000000000000000000"
    puts "\n"
end 

nomedogamer = inicializacao tempoderesposta

loop do 

    numeromaximo = defineonivel tempoderesposta
    numerosecreto = sorteio tempoderesposta, numeromaximo
    pontosateagora = 100
    chutes = []

    for chance in (1..5)
    chute = recebeatentativa chutes, chance, nomedogamer, tempoderesposta
    chutes << chute 
    acertou = verseacertou chute, numerosecreto, tempoderesposta, pontosateagora, nomedogamer
    pontosaperder = (chute.to_i - numerosecreto).abs * 2.0
    pontosateagora -= pontosaperder 
        if acertou == true 
            break
        end 
    end 

    if acertou == false
    puts "Esgotaram-se suas chances, você perdeu. O número secreto é: #{numerosecreto}."
    puts "\n"
    puts "Não desista. Tente mais uma vez."
    puts "\n"
    end

    puts "Você terminou o jogo com #{pontosateagora}." 
    puts "\n"

    quero = querjogar 

    if quero == "N"
        puts "\n"
        puts "Obrigado, até a próxima #{nomedogamer}."
        break 
    end 
end 




