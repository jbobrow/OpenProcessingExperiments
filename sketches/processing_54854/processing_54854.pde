
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
  background(0);
  if (i < 6) {

    ppkocha(width/2, height/2, width*0.7, i);
    i++;
  }
}

void ppkocha(float X, float Y, float D, int ilRek)
{
  pushMatrix();
  translate(X,Y);
  translate(-D/2,D/3*sin(PI/3));
  pkocha(D, ilRek);
  translate(D,0);
  rotate(-2*PI/3);
  pkocha(D, ilRek);
  translate(D,0);
  rotate(-2*PI/3);
  pkocha(D, ilRek);
  popMatrix();
  
}

void pkocha(float X, int ilRek)
{
  if (ilRek > 0)
  {
    ilRek--;    
    pkocha(X/3, ilRek);
    pushMatrix();
    translate(X/3,0);
    rotate(PI/3);
    pkocha(X/3, ilRek);
    translate(X/3,0);
    rotate(-2*PI/3);
    pkocha(X/3, ilRek);
    translate(X/3,0);
    rotate(PI/3);
    pkocha(X/3, ilRek);
    popMatrix();
  }
  else
  {
    beginShape();
    vertex(0, 0);
    vertex(X/3, 0);
    vertex(X/2, X/3*sin(PI/3));
    vertex(2*X/3, 0);
    vertex(X, 0);
    endShape();
    }
  }


