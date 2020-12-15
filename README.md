# Decoder To Decimal VHDL
 
# Switches to 7 segment display

Usando o software Vivado foi programado em VHLD um código para placa Arty 7 que faz a decodificação de um parâmetro alterável por 4 Switches built-in da placa. 

## Descrição do modelo

Cada cada switch representa um bit, e no total é como se fosse um vetor de 4 bits, dessa forma podendo representar valores de 0 até 15. Esse valor é processado e decodificado para o valor ser representado em 2 displays de 7 segmentos no formato decimal. Os displays estão conectados nas portas JC e JD da placa arty a7 como output. O código também usa dos Leds built-in da placa para serem acesos para cada switch ativado.



## Material
-Placa Xilinx Arty Artix-7 35T;
- 2 displays de 7 segmentos externos;

- 4 Switches built-in;

- 4 Leds Comuns built-in;

- Cabo USB micro;

- Software VIVADO;


## Imagem do ambiente de desenvolvimento
![repo-settings-image](https://github.com/FabLJ/decoder_decimal_vhdl/blob/main/Images/ambiente.PNG)


## Circuito Digital Gerado
![repo-settings-image](https://github.com/FabLJ/decoder_decimal_vhdl/blob/main/Images/Circuitogerado.PNG)

## Placa com o código rodando


![repo-settings-image](https://github.com/FabLJ/decoder_decimal_vhdl/blob/main/Images/IMG_20201214_112525163.jpg)
Valor 15(1111) sendo representado nos displays. (foto com flash)

![repo-settings-image](https://github.com/FabLJ/decoder_decimal_vhdl/blob/main/Images/IMG_20201214_112634466.jpg)
Valor 9(1001) sendo representado nos displays. (foto sem flash)


## Link video
https://drive.google.com/file/d/1DbujNn6qlq9A3qRo3TcRF0_5_rzK2dev/view?usp=sharing

## Links para o código:
#### Main VHDL:
[GitHub Pages](https://github.com/FabLJ/decoder_decimal_vhdl/blob/main/project_1.srcs/sources_1/new/decoder.vhd)


#### XDC:
[GitHub Pages](https://github.com/FabLJ/decoder_decimal_vhdl/blob/main/project_1.srcs/constrs_1/new/decoder_pins.xdc)



