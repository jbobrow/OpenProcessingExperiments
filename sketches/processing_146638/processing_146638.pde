
/*
  Autor: Matheus de Oliveira Nunes
  Data: 28.04.2014
  Descrição/Explicação: O trabalho consiste em um retrato do que Gilberto Gil fala em sua música "Pela Internet", uma vez que se trata de um website de notícias,
  representando um mundo globalizado, que, com a ajuda da internet, bombardeia o usuário de informações vindas de toda parte. Cabe ao usuário filtrar as informações, selecionando aquelas
  que são de seu agrado. Com o advento da internet, o mundo ficou mais interligado e rapidamente as informações chegam em todas as partes, o que faz parte da globalização. Aqueles 
  que têm acesso a rede podem facilmente trocar informações com semelhantes de qualquer parte do mundo. Gilberto Gil demonstra em sua música tanto o lado bom, quanto o lado ruim da 
  rede mundial, uma vez que cita um "hacker mafioso" e expõe sua vontade em participar da "web".
*/
size(1000,600);
background(250);
fill(240,165,70);
rect(1,-3,80,20,3); //Barra "navegador"
fill(0);
textSize(11);
text("Navegador",8,12);
fill(255);
triangle(71,5,77,5,74,10); //Setinha da Barra "navegador"
fill(200,215,225);
rect(89,0,180,30,3); //Aba do navegador
fill(15,40,115);
rect(95,4,17,17); //Icone do website
fill(255);
textSize(13);
text("i",102,17);
fill(0);
textSize(12);
text("Portal de notícias",120,17); //Nome do website na aba do navegador
textSize(9);
text("x",258,10);
fill(255);
rect(30,25,950,23); //Barra de URL
fill(240,250,250);
ellipse(20,37,35,35);//Circulo da barra de URL
fill(80);
triangle(24,43,24,31,11,37);//Seta "Página anterior"
fill(0);
strokeWeight(1);
textSize(13);
text("http://www.noticias.com.br", 40, 42); //URL do website fictício
fill(255,0,0);
rect(0,70,1000,45); //Barra vermelha
fill(0);
textSize(25);
text("HOJE",450,100); //Texto da barra vermelha
fill(0);
rect(20,130,200,150); //Retângulo: Vírus no Japão
fill(255,0,0);
text("PERIGO",80,215);
fill(0);
textSize(25);
text("Vírus acomete",230,165); 
text("computadores",230,200);
text("no Japão",230,235);
fill(0,110,30);
rect(20,310,200,100); //Retângulo: Marco Civil
fill(255,210,5);
textSize(25);
text("MARCO",40,350);  
text("CIVIL",120,390);
textSize(25);
fill(0);
text("Participe do",230,340);
text("debate",230,375);
fill(0);
rect(20,440,200,120); //Retângulo: Jogos de azar
text("PF investiga",230,465);
text("jogos de azar",230,500);
text("no Rio de Janeiro",230,535);
fill(255,210,5);
rect(40,440,35,120); //Listra 1
rect(100,440,35,120); //Listra 2
rect(160,440,35,120); //Listra 3
fill(255,0,0);
triangle(47,510,67,510,57,490); //Maquina caça niquel 1-2
triangle(168,560,187,560,177,545); //Maquina caça niquel 3-3
rect(47,440,20,10); //Maquina caça niquel 1-1
rect(107,550,20,10); //Máquina caça niquel 2-3
fill(0,255,0);
triangle(107,510,127,510,117,490); //Maquina caça niquel 2-2
rect(168,490,20,20); //Maquina caça niquel 3-2
rect(47,550,20,10); // Maquina caça niquel 1-3
rect(106,440,20,10); // Maquina caça niquel 2-1
quad(168,450,188,450,183,440,173,440); // Maquina caça niquel 3-1
fill(255,0,0); 
fill(0);
rect(810,140,190,30); //Barra de Esportes
rect(810,200,190,30); //Barra de Entretenimento
rect(810,260,190,30); //Barra de Economia
rect(810,320,190,30); //Barra de Tecnologia
fill(255);
textSize(20);
text("ESPORTES",817,163);
text("ENTRETENIMENTO",817,223);
text("ECONOMIA",817,283);
text("TECNOLOGIA",817,343);

