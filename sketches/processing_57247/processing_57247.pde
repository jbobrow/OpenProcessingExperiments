
float a = 1;
float aS = 0.0174;
float b = 0.361;
float bS= 0.223;

void setup () {
  size (900,450);
  smooth ();
  colorMode (HSB);
  background (0);
  noFill ();
  stroke (0,200);

}

void draw () {
  translate (width/2, height/2);
  rotate (a*5);
  ellipse (0,0,100+80*tan(b), 100);
  stroke (255*abs(sin(b)),50*abs(cos(b)),255*abs(cos(b)));
  a+=aS;
  b+=bS;
  
}
