
int num =100;
Point[] myPoint = new Point[num];
color[] myColors = new color[6];

void setup() {
  size(400,400);
   background(255);
 myColors[0] = color(146,34,188,random (30,80));
  myColors[1] = color(74,198,116,random(30,80)); 
   myColors[2] = color(108,162,237, random (30,40)); 
    myColors[3] = color(108,162,237,10); 
      myColors[4] = color(74,198,116,15); 
       myColors[5] = color(203,21,170,10);
  
  for(int i=0; i < myPoint.length; i++) {
    myPoint[i] = new Point();
}
  }
  void draw () {
   
    for(int i=0; i < myPoint.length; i++) {
      myPoint[i].update();
      myPoint[i].draw();
    }
  }

  class Point {
     color col = myColors[floor(random(0,6))] ;
  
    float xpos = random(30,370);
    float ypos = random(50,350); 
   
   Point() {
    }
    
    void update() {
      
    xpos = xpos + random (-1,1);
    ypos = ypos + random (-1,1);
    if (xpos < 150);
    if (ypos > height);
    ypos = ypos - 1;
    xpos = xpos + 1;
    if (xpos > width);
    xpos = xpos - random(1,1.1);
    ypos = ypos + 1;
   
    }
    
    void draw() {
      stroke (col);
      
      strokeWeight (random (.5,2));
      point(.3 * PI * xpos,.3 * PI * ypos);
     
    }
  }

