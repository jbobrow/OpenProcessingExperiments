
//Lama Kaddura
//Creative Computing Midterm
//Fall 2012
//Thanks to Abe Pazos

float x= 0; // x-axis
float a = 0; // angles
float colors = 0;
float y = 0;


void setup() {
  background(0);
  colorMode(HSB, 100);// values up to 100
  size(900,600);
  frameRate(120); //speed of dots 
  noStroke();
  smooth();
}

//Motion of curves 
void draw() {
  float sin_a = sin(a);
  float x = map(sin_a*sin_a*sin(a*0.05), -1, 1, 0, width);
  float y = map(sin(a*+1.5)*sin_a*sin_a, -1, 1, 0, height);
  
  float colors = map(sin(a*0.01), -1, 1, 0, 100);// colors also follow curve
  float sizes = map(sin(a*1.7)*sin(a*2.5), -1, 1, 5, 20);
  float bri = map(sin_a*sin(a), -1, 1, 10, 80);

  fill(colors, 120, bri, 80);
  //fill(colors, 80, 90, 80);
  ellipse(x, y, sizes, sizes);

point(x,y);
  x = x + 1; // increases x by much faster
  a = a + 0.03; //frequency
}
