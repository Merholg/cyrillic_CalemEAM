#!/usr/bin/env python3

import csv
import sys

# data_list = []
# data_dict = dict()
trans_dict = dict()

with open("translated_value.csv", newline='') as csv_file:
    reader = csv.reader(csv_file, delimiter='\t', quoting=csv.QUOTE_NONE)
    try:
        for row in reader:
            # row это list из трех элементов - значений столбцов
            num_string = int(row.pop(0))
            trans_dict[num_string] = row
            # print(row)
        # print(trans_dict)
    except csv.Error as e:
        sys.exit('file {}, line {}: {}'.format("translated_value.csv", reader.line_num, e))

with open("CalemMsg.properties", "r") as input_file:
    with open("CalemMsg_ru.properties", "w") as output_file:
        # Читаем каждую строку из исходного файла и записываем её в целевой файл
        num_string = 0
        for line in input_file:
            strline = line.strip()
            if len(strline) > 0:
                if strline[0] == '#':
                    output_file.write(line)
                else:
                    index = strline.find('=')
                    # Находим индекс первого вхождения '='
                    if index > 0:
                        if len(strline) > (index + 1):
                            value = strline[(index + 1):].strip()
                        else:
                            value = ""
                        # Добавляем ключ и значение в словарь
                        key = strline[:index].strip()
                        # data_dict[key] = value
                        # data_list.append(value)
                        if num_string in trans_dict and trans_dict[num_string][0] == key:
                            # output_file.write("# {key} = {value}\n".format(key=key, value=trans_dict[num_string][1]))
                            # output_file.write("{key} = {value}\n".format(key=key, value=ascii(trans_dict[num_string][1])[1 : -1]))
                            output_file.write("{key} = {value}\n".format(key=key, value=trans_dict[num_string][1]))
                        else:
                            # output_file.write("# {key} = {value}\n".format(key=key, value=value))
                            # output_file.write("{key} = {value}\n".format(key=key, value=value))
                            output_file.write("{key} = {value}\n".format(key=key, value=value))
                    else:
                        output_file.write("#{strline}\n".format(strline=strline))
            else:
                output_file.write('\n')
            num_string += 1
# for key, value in data_dict.items():
#     print(key, value)
# for value in data_list:
#     print(value)
