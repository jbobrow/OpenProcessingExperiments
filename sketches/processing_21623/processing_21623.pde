
int num = 7;
 
Rectangle[] myRect = new Rectangle[num];
color[] Colors = new color[6];
 
void setup() {
  size(400,400);
  noStroke();
  smooth();
 
  Colors[0] = color(255,0,0,50);
  Colors[1] = color(0,255,0,50);
  Colors[2] = color(0,0,255,50);
  Colors[3] = color(0,255,255,50);
  Colors[4] = color(255,255,0,50);
  Colors[5] = color(255,0,255,50);
 
  for(int i=0;i<myRect.length;i++) {
    myRect[i] = new Rectangle();
  }
}
 
void draw() {
  background(255);
 
  for(int i=0; i < myRect.length; i++) {
    myRect[i].update();
    myRect[i].draw();
  }
}
 
class Rectangle {
  float x = random(0,width);
  float y = random(0,height);
  float Size = random(100);
  color mycolor = Colors[floor(random(0,5))];
 
 
  Rectangle () {
  }
 
  void update() {
    Size++;
    if(this.Size > 3*height/4) {
      this.Size = 0;
      x = random(0,width);
      y = random(0,height);
    }
  }
 
  void draw() {
    rectMode(CENTER);
    fill(mycolor);
    rect(x,y,Size,Size);
  }
}

