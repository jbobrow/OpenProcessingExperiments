
PImage nuke;
PImage fireworks;

float x=0;
float y=0;
float h =1000;
float d =2000;

void setup(){
  size((1920/2),(1080/2));
  nuke = loadImage("Nuke.jpg");
  fireworks = loadImage("Fireworks.jpg");
}

void draw(){
  
  scale(0.5);
  tint(random(x,255),random(x,255),random(x,255));
  image(fireworks,0,0);
  
  fill(255);
  textSize(100);
  text("Click to make the fireworks go boom!", 60, h);
  
  if (mousePressed == true) {
    x=0;
    y=frameCount;
    h=2000;
    d=400;
  } else {
    x =255;
    y=0;
    h=1000;
    d=2000;
  }
  
  tint(255,y);
  image(nuke,0,0);
  
  fill(random(0,255),random(0,255),random(0,255));
  textSize(75);
  text("Happy Independence Day!", 420, d);
}
  


