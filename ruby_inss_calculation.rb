profissional_salary = 5000

tabela1 = {
  [0, 1045] => 7.5,
  [1045.01, 2089.69] => 9.0,
  [2089.61, 3134.40] => 12.0,
  [3134.41, 6101.06] => 14.0,
}

aliquota_inss = 0

tabela1.keys.each_with_index do |key, index|

  puts "ALIQUOTA #{aliquota_inss}"
  puts "PROFISSIONAL SALARY #{profissional_salary}"
  puts "ESTA DENTRO DA FAIXA? #{key[0] < profissional_salary && profissional_salary < key[1]}"
  
  puts "KEY0 #{key[0]}"
  puts "KEY1 #{key[1]}"

  if key[0] < profissional_salary && profissional_salary < key[1] 
    puts "É O ULTIMO RANGE? #{key == tabela1.keys[-1]}"
    if key == tabela1.keys[-1]
      puts "VALOR INICIAL #{key[0]}"
      percentage_by_range = ((profissional_salary - key[0]) * (tabela1[key] / 100)).round(2)
      puts "PORCENATGEM DO RANGE É #{percentage_by_range}"
      aliquota_inss += percentage_by_range
    else
      percentage_by_range = ((key[1] - key[0]) * (tabela1[key] / 100)).round(2)
      puts "PORCENATGEM DO RANGE É #{percentage_by_range}"
      aliquota_inss += percentage_by_range
    end
  elsif profissional_salary > key[1]
    percentage_by_range = ((key[1] - key[0]) * (tabela1[key] / 100)).round(2)
    puts "PORCENATGEM DO RANGE É #{percentage_by_range}"
    aliquota_inss += percentage_by_range
  end

  puts "FECHOU RANGE COM ALIQUOTA DE #{aliquota_inss}"
  puts "    "
end

puts aliquota_inss.round(2)
