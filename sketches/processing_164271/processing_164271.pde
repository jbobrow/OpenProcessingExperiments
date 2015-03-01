
//VARIABLES

float PosX, VelX; //x
float PosY, VelY; //y
float S = 20; //Tamaño mosca


void setup()
{
  size (800, 800);
  smooth();
  frameRate (120);
  PosX = width/1.2;
  PosY = height/1.2;
  VelX = 10;
  VelY = 10;
  
}


void draw()
{
  
  fill (250, 240, 80, 3); //Destello de fondo
  rect (0, 0, width, height);
  
  
  
  //RANA
  //Cuerpo
  strokeWeight(2);
  fill(#3BCB29);
  
  beginShape(); //pierna izquierda
  curveVertex(300, 450); 
  curveVertex(300, 450);
  curveVertex(180, 450);
  curveVertex(300, 650);
  curveVertex(300, 650);
  endShape();
  
  beginShape(); //pierna derecha
  curveVertex(490, 450); 
  curveVertex(490, 450);
  curveVertex(610, 450);
  curveVertex(490, 650);
  curveVertex(490, 650);
  endShape();
  
  ellipse (300, 630, 120, 90); //patas
  ellipse (490, 630, 120, 90);

  ellipse (395, 490, 300, 240); //barriga
  fill (#91F71E);
  ellipse (395, 490, 200, 220); //centro barriga
  fill (#3BCB29);
  ellipse (395, 300, 300, 200); //cabeza
 
  strokeWeight (5); //nariz
  point (383, 270);
  point (394, 270);
 
  strokeWeight(3); //boca
  noFill();
  curve (395, 100, 320, 320, 455, 320, 395, 100);
  
  if (mouseX >= 320 && mouseX <= 455 && mouseY >= 300 && mouseY <= 400) //cuando se acerca a la boca
  {
   fill(#AD0A51);
   curve (395, 100, 320, 320, 455, 320, 395, 100);
   curve (395, 500, 320, 320, 455, 320, 395, 500);
  }
  
  
  
  
  //Ojos
  strokeWeight (2);
  fill (255);
  ellipse (320, 200, 100, 100);
  ellipse (455, 200, 100, 100);

  //Variables movimiento ojos
  float a=atan2 (mouseY-200, mouseX-320);
  float b=atan2 (mouseY-200, mouseX-455);

  pushMatrix (); //Ojo izquierdo
  translate (320, 200);
  rotate (a);
  fill (0);
  ellipse (18, 0, 50, 50);
  fill(0);
  fill (255);
  ellipse (20, 0, 20, 20);
  popMatrix ();

  pushMatrix (); //Ojo derecho
  translate (455, 200);
  rotate (b);
  fill (0);
  ellipse (18, 0, 50, 50);
  fill (255);
  ellipse (20, 0, 20, 20);
  popMatrix ();
  
  
  
  
  //MOSCA:
  pushMatrix();
  float DistX = mouseX-PosX; //Cálculo distancia entre ejes X, Y y la mosca respectivamente
  float DistY = mouseY-PosY;

  PosX = PosX + DistX/VelX;
  PosY = PosY + DistY/VelY;

  fill (0, 16);
  ellipse (PosX, PosY, S, S);
  ellipse (PosX, PosY, S/2, 2*S);
  popMatrix (); 
  
}
