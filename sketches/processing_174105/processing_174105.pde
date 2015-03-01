
//ejercico realizado por carlos aguirre alumno de la uamex. 

int i= 8;
void setup() {
  size(800, 900);
  background(0);
  noCursor();
  noSmooth();
}
void draw() {
  i= i*100+i;

  stroke(#FFFAFA+i*5);
  fill(#D31A1A+i*3);
  rectMode(CENTER);
  float  x1 = map(mouseX, height/2, width, 0, 900);
  float y1 = map(mouseY, width/2, height, 0, 900 );

   line(height/2,width/2,x1, y1);
  //point(x1,y1);
  //ellipse(x1, y1, 20, 20);
}



