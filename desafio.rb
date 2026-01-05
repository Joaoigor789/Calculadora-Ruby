loop do 

puts "\n== Calculadora Ruby ==="

puts "1. Soma"
puts "2. Subtração"
puts "3. Multiplicação"
puts "4. Divisão"
puts "5. Sair"

print "Escolha uma opção (1-5): "

opcao = gets.chomp.to_i


if opcao == 5
    puts "até logo"
    break
end

print "Digite o número: "
num1 = gets.chomp.to_f

print "Digite o segundo número: "
num2 = gets.chomp.to_f

# realiza calculo do 1 e 2 .

case opcao
when 1
    resultado = num1 + num2
    operacao = "+"

when 2
    resultado = num1 - num2
    operacao = "-"

when 3
    resultado = num1 * num2
    operacao = "*"

when 4
    resultado = num1 / num2
    operacao = "/"

else 
    puts "Erro: não é possivel dividir"
    next
end
else
    puts "Opção invalida"
    next
end


puts "\nResultado #{num1} #{operacao} #{num2} = #{resultado}"
end




















end
