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
![repo-settings-image](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/images/Vivado.PNG)


## Circuito Digital Gerado
![repo-settings-image](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/images/Schem.PNG)

## Placa com o código rodando


![repo-settings-image](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/images/IMG_20201116_214607844.jpg)
Apenas RGB azul ligado, enquanto os leds normais alternam.

![repo-settings-image](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/images/IMG_20201116_214643995.jpg)
Apenas RGB vermelho ligado, enquanto os leds normais alternam.


![repo-settings-image](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/images/IMG_20201116_214707031.jpg)
Apenas RGB verde ligado, enquanto os leds normais alternam


![repo-settings-image](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/images/IMG_20201116_210423955.jpg)
2 cores ligadas dando a cor azul fraca no RGB, enquanto os leds normais alternam.

## Links para o código:
#### Main VHDL:
[GitHub Pages](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/Projeto/Trabalho_1_MicroII.srcs/sources_1/new/Trabalho_1.vhd)


#### XDC:
[GitHub Pages](https://github.com/FabLJ/Led_RGB_VHDL/blob/master/Projeto/Trabalho_1_MicroII.srcs/constrs_1/new/Trabalho_1.xdc)



