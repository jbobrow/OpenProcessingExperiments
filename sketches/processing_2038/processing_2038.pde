
float diametro;

float cabezaColor;
float cabezaSize;
float cabezaSizePlus;

float giro;
float giroPlus;

void setup(){
  size(500,500);
  diametro=200;
 
  cabezaColor = 0;
  cabezaSize = diametro/2;
  cabezaSizePlus = 0.15;
  giroPlus=0.5;
}

void draw(){



  background(cabezaColor,255,65);
  stroke(255,220);
  strokeWeight(20);
  smooth();

  // RUEDA
  translate(width/2,height);
  fill(cabezaColor,255,65);
  ellipse(0,0,diametro,diametro);

  // CUERPO
  translate(0,-diametro/2);

  line(0,0,0,-diametro);

  noStroke();
  fill(0);
  ellipse(0,0,5,5);

  translate(0,-diametro);
  stroke(255,220);
  strokeWeight(10);

  colorMode(HSB);
  fill(cabezaColor,255,255);
  cabezaColor=(cabezaColor%255)+0.2;
  if (cabezaSize <= diametro/2-15 || cabezaSize >= diametro/2+15){
    cabezaSizePlus = -cabezaSizePlus ;
  }

  cabezaSize=cabezaSize+cabezaSizePlus;
  ellipse(0,0,cabezaSize,cabezaSize);
  
  // Dibujar OJOS
  pushMatrix();
  
  rotate(PI);
  translate(25,0);
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(0,0,15,15);
  noStroke();
  fill(0);
  ellipse(0,0,5,5);
  popMatrix();
  
   pushMatrix();
   rotate(TWO_PI);
  translate(25,0);
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(0,0,15,15);
  noStroke();
  fill(0);
  ellipse(0,0,5,5);
  
  popMatrix();

// Dibujar braço animado
  translate(0,diametro/2);
  
  giro=giro+giroPlus;
  
  dibujaBrazos(giro);
  dibujaBrazos(-giro);
}
  
  void dibujaBrazos (float angulo)
  {
   
  pushMatrix();  
  rotate(radians(angulo));
  stroke(255,220);
  strokeWeight(20);
  line(0,0,0,-diametro/3);
  noStroke();
  ellipse(0,0,5,5);
  
  
  translate(0,-diametro/3);
  rotate(radians(angulo));
  stroke(255,220);
  strokeWeight(20);
  line(0,0,0,-diametro/4);
  noStroke();
  ellipse(0,0,5,5);
  
   translate(0,-diametro/4);
  rotate(radians(angulo));
  stroke(255,220);
  strokeWeight(20);
  line(0,0,0,-diametro/5);
  noStroke();
  ellipse(0,0,5,5);
  
  popMatrix();
}



