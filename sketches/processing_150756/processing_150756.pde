
/*  Psychedlic Pattern 001
    by R Knight 2014-06-06  */

// declare global variables
float r;
color[] c;
float[] rgb;
int dx=10;

void setup() {
  background(0); 
  size(800,600); 
  c=new color[3];
  rgb=new float[3];
  c[0]= color(random(255),random(255),random(255));
  c[1]= color(random(255),random(255),random(255));
  c[2]= color(random(255),random(255),random(255));
  frameRate(60);
} // end of setup()

void draw() {
  background(0);
  r=r+0.001;
  translate(width/2,height/2);
  for (int n=0; n<255; n++) {
    rotate(r);
    stroke(c[0]);
    line( 200-n*2, sin(r)*50, 200-n*2,0 );
    stroke(c[1]);
    line( 220-n*2, cos(r/2)*50, 200-n*2,10 );
    stroke(c[2]);
    line( 240-n*2, cos(r)*50, 200-n*2,20 );
  } // end of for() n
  changeColours();
} // end of draw()

void changeColours() {
  int i=int(random(3));
  int d=int(random(3));
  rgb[0] = red ( c[i] );
  rgb[1] = green ( c[i] );
  rgb[2] = blue ( c[i] );
  rgb[d] = rgb[d] + dx;
  if (rgb[d] < 0 || rgb[d] > 255) {
    dx *= -1;
    c[i] = color(random(255),random(255),random(255));
  } // ind of if()
  c[i]=color ( rgb[0], rgb[1], rgb[2] );
} // end of changeColours()


