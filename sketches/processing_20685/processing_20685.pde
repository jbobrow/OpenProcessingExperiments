
/*****************************************
  Sébastien Belhumeur Leith 
  TP1 - Création d'un monstre interactif
*****************************************/


boolean bouche = true; // variable bouche bulle

float x_shake;   //variable pour faire shaker la bouche en x
float y_shake;   //variable pour faire shaker la bouche en y



void setup() 
{

  size(400,400); // dimension de la scène
  noStroke();
  smooth();
  x_shake = width/2;
  y_shake = height/2;
}

void draw() {

background(157,202,241);  // fond de ma scène
fill(98,199,95);
rect(0,220,400,180);
rect(0,220,400,180);
fill(69,163,66);
ellipse(200,335,290,50);
fill(254,164,6);
ellipse(370,0,160,160);
fill(255,212,38);
ellipse(370,0,150,150);

 fill(61,79,156);
  beginShape();    //manche gauhe
  vertex(100,240);
  vertex(107,253);
  vertex(128,239);
  vertex(112,232);
  endShape(CLOSE);

  beginShape();        //manche droit
  vertex(304,240);
  vertex(289,228);
  vertex(286,245);
  vertex(298,251);
  endShape(CLOSE);

  fill(49,160,255);    
  ellipse(95,250,20,20);  //main gauche
  ellipse(307,247,20,20);  //main droite

  fill(49,160,255);    //pied gauche
  beginShape();
  curveVertex(93,336);
  curveVertex(93,336);
  curveVertex(98,330);
  curveVertex(118,325);
  curveVertex(168,336);
  curveVertex(168,336);
  endShape(CLOSE);
  rect(135,305,32,31);
  beginShape();
  curveVertex(229,336);  //pied droit
  curveVertex(229,336);
  curveVertex(279,325);
  curveVertex(299,330);
  curveVertex(304,336);
  curveVertex(304,336);
  endShape(CLOSE);
  rect(230,305,32,31); 

  fill(163,108,1);          //cheveu brun du coté 
  ellipse(115,160,30,30);
  ellipse(112,180,30,30);
  ellipse(285,160,30,30);
  ellipse(288,180,30,30);
  fill(49,160,255);
  ellipse(200,200,200,200);

  fill(61,79,156);      //culotte pentalon
  beginShape();
  curveVertex(117,256);
  curveVertex(117,256);
  curveVertex(137,278);
  curveVertex(200,302);
  curveVertex(263,278);
  curveVertex(284,256);
  curveVertex(284,256);
  endShape(CLOSE);
  fill(163,108,1);      //Cheveux en dessous du chapeau
  ellipse(144,147,65,15);
  ellipse(200,146,65,15);
  ellipse(260,147,65,15);

  fill(61,79,156);
  beginShape();
  curveVertex(114,145);
  curveVertex(114,145);
  curveVertex(140,110);
  curveVertex(198,87);
  curveVertex(256,110);
  curveVertex(285,145);
  curveVertex(285,145);
  endShape(CLOSE);
  rect(125,257,54,63);   //jambe pentalon gauche
  rect(220,257,54,63);  //jambe pentalon droit

  fill(36,48,100);
  rect(110,142,180,8);
  beginShape();
  curveVertex(180,90);
  curveVertex(180,90);
  curveVertex(197,78);
  curveVertex(215,90);
  curveVertex(215,90);
  endShape(CLOSE);
  fill(36,48,100);        //ceinture bleu
  rect(120,259,161,3);





  fill(200,230,255);      //oeil droit

  beginShape();
  curveVertex(210,195);
  curveVertex(210,195);
  curveVertex(210,175);
  curveVertex(215,162);
  curveVertex(232,155);
  curveVertex(250,162);
  curveVertex(255,175);
  curveVertex(255,195);
  curveVertex(255,195);
  endShape(CLOSE);


  fill(32,32,32);      //pupille oeil droit
  beginShape();     
  curveVertex(215,195);
  curveVertex(215,195);
  curveVertex(215,175);
  curveVertex(220,168);
  curveVertex(230,165);
  curveVertex(238,168);
  curveVertex(245,175);
  curveVertex(245,195);
  curveVertex(245,195);
  endShape(CLOSE);
  
  
  fill(54,130,196);    //nez
  beginShape();
  curveVertex(188,207);
  curveVertex(188,207);
  curveVertex(200,197);
  curveVertex(212,207);
  curveVertex(212,207);
  endShape(CLOSE);
  
  fill(200,230,255);    //bouche

  if  ( bouche == true ) { 

    beginShape();     
    curveVertex(172,225);
    curveVertex(172,225);
    curveVertex(181,241);
    curveVertex(202,250);
    curveVertex(221,241);
    curveVertex(230,225);
    curveVertex(230,225);
    endShape(CLOSE);

    fill(175,0,0);    //langue
    ellipse(200,242,35,15);
    
     fill(200,230,255);      //oeil gauche
  beginShape();
  curveVertex(145,195);
  curveVertex(145,195);
  curveVertex(145,175);
  curveVertex(150,162);
  curveVertex(167,155);
  curveVertex(185,162);
  curveVertex(190,175);
  curveVertex(190,195);
  curveVertex(190,195);
  endShape(CLOSE);


  fill(32,32,32);      //pupille oeil gauche
  beginShape();     
  curveVertex(155,195);
  curveVertex(155,195);
  curveVertex(155,175);
  curveVertex(160,168);
  curveVertex(170,165);
  curveVertex(180,168);
  curveVertex(185,175);
  curveVertex(185,195);
  curveVertex(185,195);
  endShape(CLOSE);
  

  } 

  else { 

    x_shake += random(-0.2, 0.2);

  fill(200,230,255);   
    ellipse(x_shake,238,20,20); //bouche
    
         fill(200,230,255);      //oeil gauche bulle
  beginShape();
  curveVertex(145,195);
  curveVertex(145,195);
  //curveVertex(145,178);
  curveVertex(150,172);
  curveVertex(167,165);
  curveVertex(185,172);
  //curveVertex(190,178);
  curveVertex(190,195);
  curveVertex(190,195);
  endShape(CLOSE);


  fill(32,32,32);      //pupille oeil gauche bulle
  beginShape();     
  curveVertex(155,195);
  curveVertex(155,195);

  curveVertex(160,180);
  curveVertex(170,175);
  curveVertex(180,180);

  curveVertex(185,195);
  curveVertex(185,195);
  endShape(CLOSE);
  
      fill(255);
   ellipse(300,65,160,65);
   ellipse (310,110,20,20);
   ellipse (300,130,15,15);
   fill(32,32,32); 
   text("Oh! C'est toute une moustache!", 240,50,150,100);
  } 

    fill(163,108,1);
     if ((key == '1')) {
  rect(172,208,55,15);
  ellipse(175,215,15,15);
  ellipse(228,215,15,15);
}
if ((key == '2')) {
  triangle(173,221,200,212,227,221);
  //ellipse(175,212,15,15);
  //ellipse(228,212,15,15);
}
if ((key == '3')) {
  rect(175,209,55,10);
  rect(226,215,10,40);
  rect(168,215,10,40);
  ellipse(175,217,15,15);
  ellipse(228,217,15,15);
}
if ((key == '4')) {
  rect(164,215,75,5);
  
}  
if ((key == '5')) {
  triangle(185,252,202,275,220,252);
   rect(171,215,60,8);
}
if ((key == '6')) {
  triangle(185,252,202,275,220,252);
}  
if ((key == '7')) {
  rect(185,208,30,13);
}
if ((key == '8')) {
   fill(163,108,1);
  triangle(155,223,200,212,245,223);
   fill(49,160,255);
  ellipse(200,217,10,15);
}

ellipseMode(CENTER);      //bulle gauche 
 if(mouseX<=400 && mouseY<=50){
   fill(255);
   ellipse(100,55,200,85);
   ellipse (90,110,20,20);
   ellipse (100,130,15,15);
   fill(32,32,32); 
   text("Choisi ma moustache avec les touches 1 à 8 du clavier!", 25,35,150,100);
 }
}


void mousePressed()
{
  
  bouche = !bouche;
  println("Clique: x "+mouseX+" y "+mouseY);
}

