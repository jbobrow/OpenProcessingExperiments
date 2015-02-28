

int r;
int x;
int y;
int bg = color(0);
int secondMax = 59;
int hourMax = 23;
int monthMax = 11; 
int dayMax = 31;
 
color sColor = color(92, 240, 85, 50);
color mColor = color(21, 225, 234, 50);
color hColor = color(52, 21, 234, 50);

 
void setup () {
  size (800,800);
  r = width/2;
  x = 26;
  y = 10;
  smooth();

}
 
void draw () {
  background(bg);
 
  int s = second ();
  int m = minute ();
  int h = hour ();
  int mo = month ();  
  int d = day (); 
  int ye = year ();
  
  String st = String.valueOf(ye);
  text(st, 400, 50);
  st = String.valueOf(s);
  text(st, 400, 350);
  st = String.valueOf(m);
  text(st, 700, 700);
  st = String.valueOf(h);
  text(st, 675, 700);
  st = String.valueOf(d);
  text(st, 170, 170);
  st = String.valueOf(mo);
  text(st, 20, 450);
  
 
 stroke(255);
 strokeWeight(2);
  fill(sColor);
  ellipse(width, height, s*x, s*x);
  fill(mColor);
  ellipse(width, height, m*x, m*x);
  fill(hColor);
  ellipse(width, height, h*x, h*x);
  fill(sColor);
  rect(10, 325, 75, mo*y);
  rect(10, 10, d*y, d*y);

  
 stroke(000);
 strokeWeight(3);
  ellipse(width, height, secondMax*x, secondMax*x);
  ellipse(width, height, secondMax*x, secondMax*x);
  ellipse(width, height, hourMax*x, hourMax*x);
  rect(10, 325, 75, monthMax*y);
  rect(10, 10, dayMax*y, dayMax*y);
   fill(255);
 
 
}



