

//Nematode

float radius;
float thickness;
float x, y, z, t;
float amp;
float angle;
int i;

void setup(){
  size(700,500);
  colorMode(HSB, width, 100, 100, 100);
  strokeWeight(0.2);
  noFill();
  smooth();
  background(width);

  frameRate(100);

  radius = 10;
  thickness = 0.5;
  x = 2;
  y = height/2;
  z = height/2;
  t = height/2;
  amp = 5;
  angle = 0;
  i = 0;

}

void draw(){
  if(x<width) {
    stroke(x, 100, 100,100);
    ellipse(x, height/2+y+t, radius, radius*1.25);  

    stroke(width - x, 100, 100,100);
    ellipse(x, height/2+z-t, radius, radius*0.75);  

    y = sin(radians(angle)) * amp;
    z = cos(radians(angle)) * amp;
    t = sin(radians(angle)) * 10;
    x++;
    angle+=5;
    radius +=thickness;
    if(x == width/2) thickness*=-1;
  }
}

void mousePressed(){

  setup();
}







