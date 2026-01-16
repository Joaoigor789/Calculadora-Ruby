require 'json'

def salvar_historico(num1, num2, operacao, resultado)
  historico = File.exist?('historico.json') ? JSON.parse(File.read('historico.json')) : []
  historico << {num1: num1, num2: num2, operacao: operacao, resultado: resultado, data: Time.now.to_s}
  File.write('historico.json', JSON.pretty_generate(historico))
end

def ler_historico
  File.exist?('historico.json') ? JSON.parse(File.read('historico.json')) : []
end


def vermelho(texto); "\e[31m#{texto}\e[0m" end
def verde(texto); "\e[32m#{texto}\e[0m" end
def azul(texto); "\e[34m#{texto}\e[0m" end



loop do 
  puts verde("\n=== Calculadora Ruby ===")
  puts "1. Soma"
  puts "2. Subtração"
  puts "3. Multiplicação"
  puts "4. Divisão"
  puts "5. Histórico"
  puts "6. Sair"
  
  print "Escolha uma opção (1-6): "
  opcao = gets.chomp.to_i

  case opcao
  when 6
    puts "Até logo!"
    break
    
  when 5
    puts "\n=== Histórico ==="
    historico = ler_historico
    
    if historico.empty?
      puts "Nenhum cálculo no histórico."
    else
      historico.each do |calc|
        data_formatada = calc['data'][0..18] if calc['data']
        puts "#{data_formatada}: #{calc['num1']} #{calc['operacao']} #{calc['num2']} = #{calc['resultado']}"
      end
    end
    next
    
  when 1..4
    print "Digite o primeiro número: "
    num1 = gets.chomp.to_f
    
    print "Digite o segundo número: "
    num2 = gets.chomp.to_f
    
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
      if num2 != 0
        resultado = num1 / num2
        operacao = "/"
      else
        puts vermelho("Erro: não é possível dividir por zero")
        next
      end
    end
    
    puts "\nResultado: #{num1} #{operacao} #{num2} = #{resultado}"
    
    salvar_historico(num1, num2, operacao, resultado)
    
  else
    puts "Opção inválida!"
  end
end