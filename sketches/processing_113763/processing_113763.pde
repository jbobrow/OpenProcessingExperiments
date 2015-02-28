
//TP3 - Gelatina- Paula Mallol
//Vatiables
int pX = 0;
int pY = 0;
   
float gZ = 0.0;
float gX;
float gY;
float fr=5;
 
float bZ = 0.0;
float bX;
float bY;
   
color gris = color (127, 100);
color menta = color (179, 239, 188);
color manteca = color (255, 255, 220);
   
void setup() {
  size(500, 500);
  background(255);
}
   
void draw() {
  frameRate (fr);
  //red
  if (pY <=500) {
   strokeWeight (10);//sombra
    stroke(gris);
    line(-25, 25+pY, 450-pX, 500);
    line(0, 500-pY, 500-pX, 0);
    line(0, 0-pY, 500+pX, 500);
    line(25, 525+pY, 525+pX, 25);
  
    strokeWeight (5);//linea menta
    stroke(menta);
    line(-25, 25+pY+5, 450-pX-5, 500);
    line(0, 500-pY-5, 500-pX-5, 0);
    line(0, 0-pY-5, 500+pX+5, 500);
    line(25, 525+pY+5, 525+pX+5, 25);
      
   pX += 50;
   pY += 50;
   }
   else {
       
  gelatina();
   }
}
   
void gelatina () {
  fr=50;
  noStroke();
  fill(124, 209, 234);//cilindro contenedor
  rect(155, 78, 190, 475);
   
  gZ += 0.08;
  noStroke();
  strokeWeight (2);
  gX = gZ;
   
  for (int i = 0; i <= 250; i++) { //cant de puntos
   
    gY = sin(gX)*8; //cuan grande es la onda
   
    fill(244, 136, 137);//gelatina
    rect(gY + height/4+50, i*2+100, 100, 2);
    stroke(243, 119, 120);//espesor
    line(gY + height/4+150, i*2+100, gY + height/4+200, i*2+75);
    noStroke();
    fill(244, 136, 137);//borde
    ellipse(gY + height/4+50, i*2+100, 5, 5);
   
    gX += 0.2;
  }
     
   burbujas();//burbujas dentro del cilindro
   
    //cilindro contenedor
  noStroke();
  fill(255, 60);
  rect(155, 78, 190, 475);
  
  fill(124, 209, 234);
  ellipse(250, 84, 192, 60);
  
  strokeWeight(40);
  stroke(255, 50);
  line(195, 145, 195, 465);
     
     
  }
   
  void burbujas () {
  bZ += 0.012;//velocidad
  noStroke();
  bY = bZ;
  for (int i = 0; i < 2; i++) { //cant de burbujas = 2
    bX = sin(bY)*180; //cuan grande es la onda
    //burbuja
    fill(255, 100);
    ellipse( i+i*50+170, bX + height/4+180, 20, 20);
    fill(255, 200);//brillo
    ellipse( i+i*50+166, +bX + height/4+176, 4, 4);
 
    bY += 5;//movimiento en y
  }
  for (int i = 0; i < 2; i++) { //cant de burbujas = 2
    bX = sin(bY)*180; //cuan grande es la onda
    //burbuja
    fill(255, 100);
    ellipse( i+i*50+270, bX + height/4+180, 20, 20);
    fill(255, 200);//brillo
    ellipse( i+i*50+266, +bX + height/4+176, 4, 4);
 
    bY -= 3;//movimiento en y
  }
}
