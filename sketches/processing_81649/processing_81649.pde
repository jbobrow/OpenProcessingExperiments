
PImage mix;

void setup(){
 size(500, 375);
 mix = loadImage("2mix.jpg");
 rectMode(CENTER);
}

void draw() {
 background(255);
 image(mix, 0, 0); 
 if(mousePressed){a=a+0.01;}
  translate(250,120);
  stroke(255,80);
  for(int i=0;i<500;i=i+9)
  {noFill();
  rotate(a);
  rect(0,0,i,i);}
}

float a=0;

//Original sketch by Sebastian Preuße openprocessing.org/sketch/4465

