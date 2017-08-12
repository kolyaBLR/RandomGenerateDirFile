#путь
#глубина
#максимальный размер файлов
#максимальное кол-во итераций (файлов и папок)


#максимальная длинна имени 8 символов

def generate_text(size = 8)
  syms = ['a'..'z','A'..'Z'].map{ |range| range.to_a }.flatten
  (0...size.to_i).map{ syms[ rand(syms.size) ] }.join
end

def filling_file(path, size)
  File.open("#{path}", "w"){|file| file.write generate_text rand size}
end

def create_dir_file(path, depth, max_size, max_iteration, index = 0)
  if index < depth.to_i
    dir_name = generate_text
    Dir.mkdir("#{path}/#{dir_name}")
    i = 0
    while (max_iteration / depth - 1).to_i > i
      file_name = "#{generate_text}.#{generate_text(3)}"
      File.new("#{path}/#{dir_name}/#{file_name}", "w")
      filling_file("#{path}/#{dir_name}/#{file_name}", max_size)
      i += 1
    end
    create_dir_file("#{path}/#{dir_name}", depth, max_size, max_iteration, index + 1)
  end
end

create_dir_file(ARGV[0], ARGV[1].to_i, ARGV[2].to_i, ARGV[3].to_i)