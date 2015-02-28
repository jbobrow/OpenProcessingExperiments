
/* Jonas Oliveira
16/11/2013
Representação Museu Oscar Niemeyer,
Curitiba, Paraná, Brasil.*/

  size (400,300);
  float xpontDirOlho = 350;
  float ypontDirOlho = 163;
  float xpontEsqOlho = 255;
  float ypontEsqOlho = 87;
  float xpontSupOlho = 298;
  float ypontSupOlho = 49;
  float xpontInfOlho = 328;
  float ypontInfOlho = 168;
  float xpontFundOlho = 24;
  float ypontFundOlho = 119;

  //cenário
  background(#5e82c0);
  noStroke();
  
  //Céu
    fill(#48599c);
    rect(0,0,400,20);
    fill(#4162a5);
    rect(0,20,400,20);
    fill(#4066a7);
    rect(0,40,400,20);
    fill(#446aab);
    rect(0,60,400,20);
    fill(#496fb0);
    rect(0,80,400,20);
    fill(#4a71b2);
    rect(0,100,400,20);
    fill(#5076b7);
    rect(0,120,400,20);
    fill(#5278b9);
    rect(0,140,400,20);
    fill(#5a80bf);
    rect(0,160,400,20);
    fill(#5e7fba);
    rect(0,180,400,20);  
  
  //nuvens
    fill(#D0D4DB);
    ellipse(45,19,40,15);
    ellipse(38,15,15,10);
    ellipse(54,15,15,10);
  
    ellipse(72,45,50,15);
    ellipse(72,40,20,10);
    ellipse(63,49,20,10);
    ellipse(83,49,20,10);
  
    ellipse(175,18,120,20);
    ellipse(161,13,50,20);
    ellipse(197,13,40,20);
    ellipse(175,25,60,20);
  
    ellipse(361,25,80,20);
    ellipse(355,18,30,10);
    ellipse(370,18,30,10);
    ellipse(364,28,40,20);

  //Sombras e calçadas
    fill(#1F5F1A);
    quad(304,220,400,220,375,238,330,238);
    fill(#246381);
    ellipse(160,260,400,120);
    fill(#626262);
    quad(43,210,75,205,73,230,30,230);
    ellipse(365,290,200,100);
    fill(#1F5F1A);
    quad(0,213,43,210,40,240,0,224);
    fill(#000000);
    ellipse(258,260,200,20);
    triangle(400,220,308,282,400,282);
    triangle(0,224,0,250,62,240);
  

  //Olho do museu
    line(xpontFundOlho, ypontFundOlho, xpontEsqOlho, ypontEsqOlho);
    noStroke();
    fill(#fcfcfc);
    triangle(xpontFundOlho, ypontFundOlho,xpontSupOlho,ypontSupOlho,xpontEsqOlho, ypontEsqOlho);
    fill(#beaca2);
    quad(xpontFundOlho, ypontFundOlho, xpontEsqOlho, ypontEsqOlho,302,171,167,170);
    triangle(xpontEsqOlho, ypontEsqOlho,xpontInfOlho,ypontInfOlho,302,171);
    fill(#0E068E);
    bezier(xpontEsqOlho, ypontEsqOlho,270,60,290,48,xpontSupOlho,ypontSupOlho);
    bezier(xpontSupOlho,ypontSupOlho,311,49,345,120,xpontDirOlho,ypontDirOlho);
    bezier(xpontEsqOlho, ypontEsqOlho,290,145,305,160,xpontInfOlho,ypontInfOlho);
    bezier(xpontInfOlho,ypontInfOlho,336,169,343,167,xpontDirOlho,ypontDirOlho);
    quad(xpontEsqOlho, ypontEsqOlho,xpontSupOlho,ypontSupOlho,xpontDirOlho,ypontDirOlho,xpontInfOlho,ypontInfOlho);
    fill(#fcfcfc);
    bezier(xpontFundOlho, ypontFundOlho,76,86,109,75,xpontSupOlho,ypontSupOlho); 
    fill(#beaca2);
    bezier(167,170,216,175,302,171,xpontInfOlho,ypontInfOlho);
    bezier(xpontFundOlho, ypontFundOlho,82,149,128,167,167,170);
    stroke(#857b7e);
    strokeWeight(3);
    line(45,111,255,80);
  
  // base
     noStroke();
     fill(#d1a905);
     quad(286,163,302,171,307,238,286,237);
     fill(#b69303);
     quad(169,170,289,164,295,253,169,253);  
     fill(#000000);//detalhe da entrada
     quad(216,175,230,174,233,190,215,188);
     triangle(287,170,263,182,253,180);
     quad(263,182,253,180,243,198,248,200);
     bezier(248,200,247,203,246,204,243,205);
     bezier(243,198,241,200,240,201,243,198);
     quad(248,200,243,198,243,198,243,205);
     quad(243,198,243,205,209,209,209,205);
     bezier(207,189,202,180,194,176,180,177);
     bezier(205,189,198,182,188,179,182,180);
     triangle(185,177,185,182,169,173);
     triangle(65,218,71,226,33,223); 
   
   //base da ponte
     quad(113,208,113,213,90,222,90,210);
     quad(76,224,76,213,90,210,90,222);
     fill(#5F5246);
     quad(113,208,125,207,126,228,113,227);
     fill(#242348);
     quad(113,246,126,247,126,259,113,259);
     quad(68,232,88,244,88,258,68,257);
     quad(50,231,50,254,33,253,33,228);
     quad(164,249,179,241,179,258,164,258);
     fill(#0E0D39);
     ellipse(42,251,30,6);//sombra pilar
     ellipse(78,255,30,6);
     ellipse(120,258,20,5);
     stroke(#161531);
     strokeWeight(5);
     line(165,259,400,255);
   
   //ponte
     noStroke();
     fill(#a19ead);
     strokeWeight(4);
     quad(215,188,233,190,233,202,206,200);
     quad(209,201,215,188,150,192,154,205);
     quad(150,192,154,205,79,213,79,201);
     quad(79,213,79,201,75,206,75,216);  
     bezier(75,214,57,219,68,223,114,228);
     quad(65,218,56,214,26,221,34,223);
     triangle(65,218,65,225,114,228);
     strokeWeight(4);
     stroke(#a19ead);
     line(110,229,306,238);   
     noStroke();   
     fill(#7a7b83);        
     quad(26,221,25,235,114,246,114,229);  
     quad(114,229,114,246,291,256,291,240);
     quad(291,256,291,240,400,235,400,256);
     
  
   
  


