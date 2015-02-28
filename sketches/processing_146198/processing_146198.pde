
int i;
int numpucca= 15; //Nombre de puccas que apareixeran en total a la pantalla.
float [] posX= new float[numpucca]; //Matriu posició X
float [] posY= new float[numpucca]; //Matriu posició Y
color colorback;

void setup(){
  size(500,500);
  background(colorback);
  for(int i=0; i<numpucca; i++){
    posX[i] = width/2;//Defineixo posició inicial.
    posY[i] = height/2;
  }
}
 
void draw(){
   
  background(colorback);
  for(int i=0; i<numpucca; i++){
    posX[i] += random (-8,8); //No utilitzem una velocitat en concret, amb la opció dl random deixe que el mateix element faci la seva.
    posY[i] += random(-8,8);
    
  //Definim els límits per tal que no se'ns envagi.
  if((posX[i]<width/10)||(posX[i]>width-width/10)){ 
    posX[i] = -posX[i];
  }
  if ((posY[i]<height/11)||(posY[i]>height-height/26)){ 
    posY[i] = -posY[i];
  }
}
  for(int i=0;i<numpucca; i++){
   
  //Elipses que representen els monyetes
  stroke(0);
  fill(0);
  ellipse(posX[i]-36,posY[i]-22,32,32);
  ellipse(posX[i]+36,posY[i]-22,32,32); 
   
  //Elipses que fan de gomes
  stroke(0);
  fill(255,0,0);
  ellipse(posX[i]-24,posY[i]-13,27,27);
  ellipse(posX[i]+24,posY[i]-13,27,27);
  
  //Elipse que representa el cabell.
  stroke(0);
  fill(0);
  ellipse(posX[i],posY[i]-3,70,55);
   
  //Elipse que representa la cara blanca.
  stroke(0);
  strokeWeight(3);
  fill(252,244,222);
  ellipse(posX[i],posY[i],65,50);
   
  //Arcos que representan las cejas
  strokeWeight(2);
  stroke(0);
  fill(252,244,222);
  arc(posX[i]-20,posY[i]-8, 20, 20,PI+8*PI/18, 2*PI-PI/4);
  arc(posX[i]+20,posY[i]-8, 20, 20,PI+PI/4,PI+9*PI/18);
   
  //Lineas que representan los ojos
  line(posX[i]-25,posY[i]-5,posX[i]-10,posY[i]);
  line(posX[i]+25,posY[i]-5,posX[i]+10,posY[i]);
   
  //Arco que hace de boca
  fill(252,244,222);
  arc(posX[i],posY[i]+12,7,7,0,PI);
   
  //Elipses mejillas sonrojadas
  stroke(240,155,155);
  strokeWeight(1);
  fill(240,155,155);
  ellipse(posX[i]-17,posY[i]+11,7,7);
  ellipse(posX[i]+17,posY[i]+11,7,7); 
  }   
}

  void mousePressed(){
  //El color de fondo de pantalla canviarà segons on piquem amb el mouse a la pantalla.
  colorback=color(mouseY,mouseX,0);
  //Quan cliquem amb el cursor en qualsevol lloc de la pantalla ens sortiran allà els elements de nou.
  for(int i = 0; i<numpucca; i++){ 
     posX[i] = mouseX;
     posY[i] = mouseY; 
} 
  }

