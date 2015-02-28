
/* Trabalho I - Algoritmos - Prof. Silvia 
Autora: Ana Flávia Yanaze Muranobu 
Data: 29/04/2014
O trabalho foi inspirado na letra da música de Gilberto Gil, 
“Pela Internet”. Foram utilizados elementos e formatos geométricos
básicos em 2D do Processing.  A montanha seria o Monte Fuji (com vários códigos em binários com objetivo de representação dos “programas” na música), 
uma das mais famosas referências ao Japão – que está com seus programas  sendo atacados por um vírus. O Sol vermelho atrás faz também, para deixar mais claro, referência à bandeira do País.
(“Um hacker mafioso acaba de soltar/Um vírus ara atacar os programas no Japão”) Também, no trabalho, vê-se um envelope que, 
representando um e-mail, como um “barco que veleje nesse infomar”. Ele é enviado do oriente (Japão) para o Brasil, 
fazendo a conexão entre lugares de longas distâncias tão claramente citada pelo cantor na letra. 

*/


size(700,400);
background(141,209,230);

//E-mail
fill(255);
rect(26, 23, 146, 102);
triangle(93, 71, 26, 23, 170, 23);
fill(0);
line(26, 124, 160, 165);
line(173, 24, 257, 66);
line(173, 125, 217, 143);
      // Bandeira
      fill(#24a80e);
      noStroke();
      rect(45, 84, 48, 33);
      fill(#fff600);
      quad(66, 87, 49, 99, 66, 112, 86, 98);
      fill(#0c00ff);
      ellipse(67, 99, 15, 15);

fill(255,0,0);
noStroke();
ellipse(345, 221, 200, 200);

// Montanha
fill(125, 91, 91);
noStroke();
triangle(338, 180, 1, 400, 700, 400);
textSize(16);
fill(0);
text("0110010101011101010110010", 214, 273);
text("0101110010101001011101010100101101", 169, 299);
text("01100101010111010101100100101110101001010", 140, 322);
text("01011100101010010111010101001011011101010010111010", 99, 360);
text("01011100101010010111010101001011011101010010111", 115, 342);
text("010111001010100101110101010010110111010100101110100110100", 60, 378);
text("01010110011010100100111010101100101101011010100101110100101011", 40, 395);

    //Neve
    fill(255);
    ellipse(260, 264, 60, 40);
    ellipse(300, 264, 60, 40);
    ellipse(340, 264, 60, 40);
    ellipse(380, 264, 60, 40);
    ellipse(420, 264, 60, 40);
    triangle(338, 180, 210, 264, 477, 264);
    
    
//Vírus
fill(#5110a2);
 rect(537, 130, 8, 25);
 rect(537, 152, 75, 57);
 rect(530, 154, 10, 24);
 rect(525, 164, 13, 13);
 rect(523, 175, 7, 21);
 rect(537, 207, 13, 8);
 rect(542, 214, 17, 10);
 rect(600, 207, 13, 6);
 rect(592, 212, 16, 11);
 rect(605, 129, 8, 23);
 rect(612, 155, 6, 11);
 rect(611, 165, 10, 11);
 rect(616, 175, 8, 21);
 fill(141, 209, 230);
 rect(547, 162, 10, 9);
 rect(590, 162, 10, 9);

