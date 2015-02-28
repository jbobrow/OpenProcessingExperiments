
float x, acc, X, Y, C;

void setup() 
{
  size(1200, 900, P3D);
  x=1;
  acc=1;
  background(0);
  X = width/255;
  Y = height/255;
  C=0;
}

void draw() 
{
  background(0);
    ambientLight(mouseX/X, C, 255);
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  x+= 0.1;
  C+=1;
  if (C>255) {
    C=random(100);
  }
  stroke(C, mouseY/Y, mouseX/X- C, 255);
  fill(2*255-mouseX/X-mouseY/Y, C, mouseY/Y-C, C);
  translate(width - mouseX, height - mouseY, mouseX/8-mouseY/2);
  rotateX(x/2 * (mouseX/width+1));
  rotateY(x/3 * (mouseY/height+1));
  rotateZ(x/3);
  scale(mouseX/5);
  beginShape();
  vertex( 2, -1, -4);
  vertex( -1, -6, -1);
  vertex( 0, 1, 1);

  vertex( 5, -1, -2);
  vertex( 1, 0, -1);
  vertex( -1, 3, 1);

  vertex( 3, 1, -1);
  vertex(-1, 1, -1);
  vertex( 0, 0, 1);

  vertex( 2, 1, -1);
  vertex(-1, -3, -4);
  vertex( 0, 0, 1);

  vertex(-1, 4, -1);
  vertex( 2, -1, -1);
  vertex( 0, 0, 1);
  
  vertex(-1, -1, -1);
  vertex( 1,  0, -4);
  vertex( -1, 3, 1);
  
    vertex( 2, -1, -1);
  vertex( 3, 1, -1);
  vertex( 5, 0, 1);

  vertex( 1, 2, -4);
  vertex(-2, 1, -3);
  vertex( 0, 3, 1);

  vertex(-3, 1, -1);
  vertex(-1, -1, -3);
  vertex( 1, 0, 1);

  vertex(-3, 1, -1);
  vertex(-1, -2, -1);
  vertex( 2, 0, 4);
  
  vertex(-5, -1, -1);
  vertex( -3, -2, 0);
  vertex( 0, 1, 1);
  
    vertex(-1, 0, -1);
  vertex( 2, -1, -1);
  vertex( 0, 0, 1);
  
  vertex(-1, -3, -1);
  vertex( 4,  0, -4);
  vertex( 0, 2, 1);
  
  vertex( -1, -1, -1);
  vertex( 3, 1, -1);
  vertex( -6, 0, 1);
  endShape();
}
