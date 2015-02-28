
Brush[] myBrushs;

int brushCounter = 0;
color c;
float dotX;
float dotY;

void setup() {
  size (600, 600);
  myBrushs = new Brush[500];

}

void draw() {
 fill(c,50);
 for (int i=0; i<brushCounter; i = i+1) {
   myBrushs[i].update();
   myBrushs[i].display();
 }
 fill(c,50);
 ellipse(0, 0, width, height);
 ellipse(dotX, dotY, 15, 15);
}

void mousePressed() {
  
 
   if (key == '1') {
      c = color(#D3EAC9,50);
    } 
   if (key == '2') {
      c= color(#FEFFBF,50);
    } 
   if (key == '3') {
     c= color(#FFBFC8,50);
    } 
    
    if (brushCounter < 500) {
      myBrushs[brushCounter] = new Brush(c);
      dotX = myBrushs[brushCounter].x;
      dotY = myBrushs[brushCounter].y;
    
    brushCounter = brushCounter + 1;
  }
   
}
class Brush {
  float x = 10;
  float y = 10;
  float xSpeed;
  float ySpeed;
  float circleX;
  float circleY;
  float angle;
  float radius = 5;
  color fillColor;
   
  Brush(color theColor) {
    fillColor = theColor;
    x = random(15,15);
    y = random(15,15);
    xSpeed = random(0,5);
    ySpeed = random(0,5);
  }
  void update() {
    x= x + random (-1, 1) + xSpeed;
    y= y + random (-1, 1) + ySpeed;
    //circleX = cos(angle)* radius;
    //circleY = sin(angle)* radius;
    //println(circleX);
  }
  void display () {
    //noStroke();
    fill(fillColor);
    ellipse (x, y, 15, 15);
  }
}  


