
PImage tootoo;
PImage beach;
float x,y;
float rot;

void setup(){
  size(300,436);
  tootoo = loadImage("toto char copy.png");
  beach = loadImage("twinchairdemo2.jpg");
  
  x=0;
  y=width/5.0;
  rot=0.0;
}

void draw(){
  imageMode(CENTER);
  background(beach);
  translate(x,y);
  rotate(rot);
  image(tootoo,0,10);
  
  x = 100;
  y= 100;
  rot += 0.01;
  if (x > width/2) {
    x = 0;
  }
  
}

