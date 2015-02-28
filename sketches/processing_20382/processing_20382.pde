
//Geoff Matheson
//2011
//Credit to Neil Burdick http://openprocessing.org/visuals/?visualID=19098
//this is a modified version of the ZenCircles script. the additional element is not fully functioning yet. 

int N1; //the number of rings
int N2; //timer
int N3; //timer 2
int pX; //last mouseX position
int pY; //last mouse Y position
int mX; //mX is current mouseX position
int mY; //mY is current mouseY position
int difX; //difference between mX and pX
int difY; // difference between mY and pY
int Dist; // distance between mX and pX
int Dstep; // the increment at which the diameter will increase
int Astep; // the increment and which alpha will decrease
int Alp; //alpha value
int Dia; //diameter value

void setup() {
  size(700,300);
  colorMode(HSB,100);
  background(10);
  noFill();
  strokeWeight(2);
  smooth();
  
  N1 = 0;
  N2 = 0;
  N3 = 0;
  Alp = 100;
  Dia = 10;
}

// When the mouse is clicked, save the last mouse position as variable p, and save
//the current mouse poistion as variable m. Run math function.

void mouseClicked() {
  N1 = 10;
  pX = mX;
  pY = mY;
  mX = mouseX;
  mY = mouseY;
  Math();
  Reset();
}

void draw() {
  if (N2 < N1) {
    println("drawing Ellipse");
    Ellipse();
  } else if (N3 < N1) {
    println("drawing EllipseR");
    pX = mX;
    pY = mY;
    mX = pX + int(random(-5,5));
    mY = pY + int(random (-5,5));
    Math();
    EllipseR();
  } else {
    println("finished");
}
}

//calculates the distance between the last mouse position and the current mouse position
//and determines the increase in diamater.
void Math() {
  difX = abs(pX-mX);
  difY = abs(pY-mY);
  Dist = 2*int(sqrt((difX*difX) + (difY*difY)));
  Dstep = Dist/N1;
  Astep = 100/N1;
}

void Ellipse() {
  stroke(50,100,100,Alp);
  ellipse(mX,mY,Dia,Dia);
  Dia=Dia+Dstep;
  Alp=Alp-Astep;
  N2=N2+1;
  println("N2:"+N2);
}

void EllipseR() {
  stroke(50,100,100,Alp);
  ellipse(mX,mY,Dia,Dia);
  Dia=Dia+Dstep;
  Alp=Alp-Astep;
  N3=N3+1;
}

void Reset() {
  Dia = 10;
  Alp = 100;
  N2=0;
  N3=0;
}

