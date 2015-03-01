
//This is an example we went over in the dorkShop on Saturday this past weekend. 
//The math to make this fractal came from http://paulbourke.net/fractals/
//I modified the code to have less numPoints to run faster and to see the colors more 
//clearly. Also by making the space in 2D rather than in 3D, you get a cool kind
//of effect that I like and it feels really fun and cartoony. 

float red, blue, green;

void setup() {
  size(700, 700);
}


void draw() {

  background(255);
  translate(width/2, height/2);
  scale(100, 100);  

  float a = 0+sin(millis()*.001);
  float b = -2.3;
  float c = 2.4;
  float d = -2.1;

  float numPoints = 1000;

  float x0 = 0;
  float x1 = 0; 
  float y0 = 0; 
  float y1 = 0;

  for (int i=0; i<numPoints; i++) {
    red = map(noise(i, i), 0, 1, 0, 255);
    blue = map(noise(i*130, i*30), 0, 1, 0, 255);
    green = map(noise(i+230, i+60), 0, 1, 0, 255);

    x1=sin(a*y0)-cos(b*x0);
    y1=sin(c*x0)-cos(d*y0);
    stroke(red, blue, green);
    point(x1, y1);
    x0=x1;
    y0=y1;
  }
}



