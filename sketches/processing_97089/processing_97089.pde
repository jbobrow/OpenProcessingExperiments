
/*JÚLIA DUCAT HINOJOSA
Pràctica 3b:Condicionals
INFORMÀTICA
grup 02
2n GEDI 2012-2013
*/

//Declaració de variables
int posX, posY, velX,velY;
int xur=10;
int pern=6;
int oliv=7;
int oliv2=2;

int posullX;
int posullY;
int velullX;
int velullY;

color colorXY;
color color1;

void setup(){//Configuració de la pàgina
  size(400,400);//dimensions de pantalla
  
  //Inicialització de les variables
  posX=width/2;
  posY=height/2;
  posullX=width/2;
  posullY=height/2;
  
  velX=int (random(2,4));//velocitat aleatòria
  velY=int (random(2,4));
  noStroke();
  }

void draw(){ //Configuració dibuix
  color1=color(152,232,161);//definició color de fons de pantalla
  background(color1);
  
  //POU
  colorXY=color(mouseX-5,mouseY-255,100);
  fill(colorXY);
  bezier(60,310,150,150,200,0,340,310);
  ellipse(99,320,80,80);
  ellipse(301,320,80,80);
  rect(99,240,202,120);
  
    
  //format ulls
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse((width/2)-20,height/2,40,45);
  ellipse((width/2)+20,height/2,40,45);
  

  //ninetes
  fill(0);
  ellipse(175+mouseX/28,195+mouseY/28,10,10);
  ellipse(215+mouseX/28,195+mouseY/28,10,10);
  noFill();
  
 
  //boca
  if(mousePressed==true) {
     fill(121,16,16);
     bezier(150,285,180,320,220,330,250,285);
     bezier(150,285,190,215,220,220,250,285);
  } else {
  bezier(140,245,139,255,130,300,170,280);
  }
 
  //actualitzem posicions
  posX=posX+velX;
  posY=posY+velY;
  
  //tros pizza
  noStroke();
  fill(183,129,63);//pà
  triangle(posX,posY,posX+50,posY+50,posX-50,posY+30);
  fill(227,221,160);//motzzarella
  triangle(posX+6,posY+6,posX+50,posY+50,posX-38,posY+32);
  fill(196,49,49);//xuriço
  ellipse(posX-2,posY+30,xur,xur);
  ellipse(posX+20,posY+30,xur,xur);
  ellipse(posX+8,posY+18,xur,xur);
  fill(224,147,201);//pernil
  rect(posX-20,posY+25,pern,pern);
  rect(posX+27,posY+38,pern,pern);
  fill(0);//olives
  ellipse(posX+11,posY+35,oliv,oliv);
  ellipse(posX-3,posY+16,oliv,oliv);
  fill(227,221,160);
  ellipse(posX+11,posY+35,oliv2,oliv2);
  ellipse(posX-3,posY+16,oliv2,oliv2);


  //comrovem la posició de la x (rebot)
  if((posX<50)||(posX>width-50)){
    velX=-velX;
  }
  //comprvem la posició de la Y (rebot)
  if((posY<0)||(posY>height-50)){
    velY=-velY;
  }
}


