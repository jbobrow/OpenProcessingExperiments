
int time_off=200;
int time_on=1000;
int lastTime;
Boolean light = false;
int i;

void setup() {
  size(400, 400);
  noStroke();
  lastTime = millis();
  println(lastTime);
}

void draw() {
  background(0);
  if (light == true) {
  PImage a;
  a=loadImage("left.png");
  image(a,50,200);
  

if (time_on<millis() -lastTime) {
      light = false;
      lastTime = millis();
    }
  }
  
else {
    if (time_off< millis() - lastTime) {
      light = true;
      lastTime = millis()+1000;
      for(int i=0; i<height; i+=50){
       PImage b;
  b=loadImage("right.png");
  image(b,300,i);
      }
    }
  }
}


