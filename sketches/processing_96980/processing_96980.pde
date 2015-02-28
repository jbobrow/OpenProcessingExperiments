
//declaració de les diferents variables
int x;
int posX, posY, velX, velY;
color colorMarietaR,colorMarietaG,colorMarietaB,colorMarieta;

//inicialització de les variables
void setup()
{
  x=0;
  size(500, 600);
  background (124,209,250);
  noCursor();
  posX=width/2;
  posY=height/2;
  velX=3;
  velY=1;
  colorMarietaR=255; //per tal que la marieta sigui vermella a l'inici
  colorMarietaG=0;
  colorMarietaB=0;
}

void draw()
{
  background(124,209,250);
  //tija de la flor
  stroke(44,203,31);
  strokeWeight(7);
  line(2*width/5,height/2,2*width/5,11*height/12);
  //terra
  fill(44,203,31);
  rect(0,width,width,height);
  //petals del fons
  pushMatrix();
  translate(2*width/5,height/2);
  for(int i=0; i<80; i++){
    rotate(PI/6);
    fill(255);
    noStroke();
    ellipse(0,height/40,2*width/25,4*height/15);
  }
  popMatrix();
  //cercle del mig
  noStroke();
  fill(255,255,0);
  ellipse(2*width/5,height/2,4*width/25,2*height/15);
  
  //actualitzo posicions
  posX=posX+velX;
  posY=posY+velY;

  //marieta en moviment
  stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(posX,posY-33,width/25,height/30);//el cap de la marieta
  //antenes marieta
  line(posX-13,posY-50,posX,posY-30);
  ellipse(posX-13,posY-50,width/95,height/95);
  line(posX+13,posY-50,posX,posY-30);
  ellipse(posX+13,posY-50,width/95,height/95);
  //potes Esquerra
  noFill();
  arc(posX-40, posY+15, 4*width/25, 2*height/15, PI+HALF_PI, TWO_PI);
  arc(posX-25, posY+35, 4*width/25, 2*height/15, PI+PI/3, PI+HALF_PI);
  arc(posX-10, posY+60, 4*width/25, 2*height/15, PI+QUARTER_PI, PI+HALF_PI);
  //potes Dreta
  arc(posX+40, posY+15, 4*width/25, 2*height/15, PI, PI+HALF_PI);
  arc(posX+25, posY+35, 4*width/25, 2*height/15, PI+HALF_PI, PI+HALF_PI+PI/6);
  arc(posX+10, posY+60, 4*width/25, 2*height/15, PI+HALF_PI, PI+HALF_PI+QUARTER_PI);
  //cos vermell de la marieta
  fill(colorMarietaR,colorMarietaG,colorMarietaB); //defineixo el color de la marieta en 3 variables RGB, per tal que després al fer la funció MousePressed() canvïn les 3 variables en tots els colors
  ellipse(posX, posY, 3*width/25, 7*height/60);
  line(posX,posY+35,posX,posY-35);
  fill(0,posX/2,0); //punts negres Esquerra de la marieta respecte el cursor
  ellipse(posX-10,posY-18,2*width/125,height/75);
  ellipse(posX-18,posY,2*width/125,height/75);
  ellipse(posX-10,posY+18,2*width/125,height/75);
  //punts negres Dreta de la marieta respecte el cursor
  ellipse(posX+10,posY-18,2*width/125,height/75);
  ellipse(posX+18,posY,2*width/125,height/75);
  ellipse(posX+10,posY+18,2*width/125,height/75);
  
  //comprovo posició X perquè reboti correctament
  if((posX<width/25+25)||(posX>width-45)){
    velX=-velX;
  }
  
  //comprovo posició Y perquè reboti correctament
  if((posY<height/30+35)||(posY>height-140)){
    velY=-velY;
  }
  
  //canvia les antenes de rodo a quadrat segons els quatre quadrants de la pantalla
  if((posX<width/2)&&(posY<height/2)){
  ellipse(posX-13,posY-50,width/95,height/95);
  ellipse(posX+13,posY-50,width/95,height/95);
  } 
  if((posX>width/2)&&(posY<height/2)){
  rect(posX-17,posY-54,2*width/125,height/75);
  rect(posX+9,posY-54,2*width/125,height/75);
  }
  if((posX<width/2)&&(posY>height/2)){
  rect(posX-17,posY-54,2*width/125,height/75);
  rect(posX+9,posY-54,2*width/125,height/75);
  }
  if((posX>width/2)&&(posY>height/2)){
  ellipse(posX-13,posY-50,width/95,height/95);
  ellipse(posX+13,posY-50,width/95,height/95);
  }
  
}
  
//quan apretes el mouse, la marieta canvia de color aleatoriament
void mousePressed() {
  if (colorMarieta == 0) {
    colorMarietaR = int(random(0,255)); //Com que els valors que defineixen els colors són enters, el que fem es transofrmar els valors que ens podria donar el rang especificat en el random (que poden ser també decimals) en enters.
    colorMarietaG = int(random(0,255));  
    colorMarietaB = int(random(0,255));
  } else {
    colorMarietaR = 255;
    colorMarietaG = 0;
    colorMarietaB = 0;
  }
}



