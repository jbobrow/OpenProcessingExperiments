
int axisNum = 20;
float a=0.3;
float b=0.5;
float c=0.01;
float d=0.1;
float e=0.2;
PImage img1;


void setup(){
  frameRate(20);
  size(500,500);
  colorMode(HSB);;
    background(0);
    noStroke();
    smooth();
    img1 = loadImage("pattern.jpg");
}

void draw(){
  translate(width/2,height/2);
  for(int i=0;i<=axisNum;i++){
  pushMatrix();
rotate(i*radians(360/axisNum));
pattern();
popMatrix();
}
a+=0.3;
b+=0.02;
c+=0.01;
d+=0.015;
e+=0.013;
}

void pattern(){
  rotate(sin(radians(noise(a))));
  image(img1,(200*noise(a))-100,(200*noise(b))-100,(200*noise(d)),(200*noise(e)));
}


