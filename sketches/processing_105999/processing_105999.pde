
//Outer black barrier: one full minute or second. Inner black barrier: one full day.
//Darker violet: hours, middle violet: minutes, lighter violet: seconds

int r;
int x;
int bg = color(255);
int secondMax = 59;
int hourMax = 23;

color sColor = color(0,0,200,50);
color mColor = color(0,0,200,50);
color hColor = color(0,0,200,50);


void setup () {
  size (800,800);
  r = width/2;
  x = 26;
  smooth();
}

void draw () {
  background(bg);

  int ms = millis ();
  int s = second ();
  int m = minute ();
  int h = hour ();

//seconds
 stroke(255);
 strokeWeight(2);
  fill(sColor);
  ellipse(width, height, s*x, s*x);
  fill(mColor);
  ellipse(width, height, m*x, m*x);
  fill(hColor);
  ellipse(width, height, h*x, h*x);
  
//guides

 stroke(000);
 strokeWeight(3);
  ellipse(width, height, secondMax*x, secondMax*x);
  ellipse(width, height, secondMax*x, secondMax*x);
  ellipse(width, height, hourMax*x, hourMax*x);
}
