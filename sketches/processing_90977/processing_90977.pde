
float posX;
float posY;
float Xl;
float Yl;
float CS;
float j;
float k;
color a;
color b;

//------------------------------
void setup() {
  size(500, 500);
  colorMode(HSB, 360, height, height, height);
  smooth();
  
  a = 0;
  b = 320;
  posX = width/2; 
  posY = height/2;
  Xl = 0;
  Yl = posY-5;
  CS = 120;
  j = 1;
  k = 1;
}

//------------------------------
void draw() {
  //background
  noStroke();
  fill(150, height, height, 90); 
  rect(0, 0, width, height);
  
  //line
  stroke(0, 0, 280, 180);
  strokeWeight(1.7);
  line(width/2, 0, Xl+CS/2, posY);
  
  //ellipse
  noStroke();
  fill(a, height, height);
  ellipseMode(CORNER);
  ellipse(Xl, Yl, CS, CS);
  
  /*
  Para posicionar tuve que ordenar la declaración de los variables y los 
  valores conforme se iban usando porque de lo contario causaban conflicto.
  */
  
  //movimiento
  
  Xl = (Xl + j);
  
  if (Xl > width-CS) {
    j = j * -1;
    a = b;
  }
  if (Xl < 0) { 
    j = abs(j);
    a = 0;
    
  }
  
  
  

  
 println("Xl =" + Xl);
 println("Yl =" + Yl);
}




