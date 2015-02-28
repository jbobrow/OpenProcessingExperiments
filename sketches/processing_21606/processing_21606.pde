
int num = 40;

Objects[] myObjects = new Objects[num];
color[] Colors = new color[4];
float ellipseWidth = random(150,500);
float ellipseHeight = random(50,250);

void setup(){
  size(200,200);
  stroke(255,30);
  strokeWeight(5);
  smooth();
  frameRate(25);
  
  Colors[0] = color(255,0,0,50);
  Colors[1] = color(0,255,0,50);
  Colors[2] = color(0,0,255,50);
  Colors[3] = color(80,50);
  
  for(int i=0; i<myObjects.length;i++) {
    myObjects[i] = new Objects(ellipseWidth,ellipseHeight);
  }
}

void draw(){
  background(0,25);
  
  for(int i=0; i<myObjects.length; i++){
    myObjects[i] .update();
    myObjects[i] .display();
  }
}

class Objects {
  
  color colorPicker = Colors[floor(random(0,4))];
  float x = random(20,width-20);
  float y = random(20,height-20);
  float speed = random(-5,5);
  
  Objects(float a_, float b_){
    ellipseWidth = a_;
    ellipseHeight = b_;
  }
  
  void update(){
    x = x + speed;
    y = y + sin(10*x);
    if(x > width){
      x = 0;
    }
    if(x < 0){
      x = width;
    }
  }
  
  void display(){
    rectMode(CENTER);
    fill(colorPicker);
    rect(x,y,ellipseHeight,ellipseWidth);
  }
}

