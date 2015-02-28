
void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  smooth();
  noFill();
  //noLoop();
  frameRate(1);
translate(200,300);
}

int i = 0;

void draw() {
  
  if (i < 12) {
    background(0);
    drzewob(width/2, height, height*0.4, i);
    i++;
  }
}

void drzewob(float X, float Y, float D, int ilRek)
{
  pushMatrix();
  translate(X,Y);
  rotate(-PI/2);
  drzewobr(D, ilRek);
  popMatrix();
}

void drzewobr(float D, int ilRek)
{
  if (ilRek > 0)
  {
    ilRek--;    
  //pushMatrix();
  line(0,0,D,0);
  translate(D,0);
  pushMatrix();
  rotate(HALF_PI/2);
  drzewobr(D*0.6, ilRek);
  popMatrix();
  pushMatrix();
  rotate(-HALF_PI/2);
  drzewobr(D*0.6, ilRek);
  popMatrix();
  }  
}




