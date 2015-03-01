
// The next line is needed if running in JavaScript Mode with Processing.js
@pjs preload= "processing2-logo.jpg";

PImage img;
PFont f;
PointArray PA;
int imgX,imgY;

void setup() {
  size(600,400);
  frameRate(60);
  img = loadImage("processing2-logo.jpg"); // you can import whatever image but increasing size corresponds with increasing lag
  PA = new PointArray();
  f = createFont("Arial" , 18,true);
}

void draw () {
  background(5);
  PA.run();
  
  //text(frameRate,10,10); // debuging stuff
  //text("X:Y- " + PA.mouse.x + " : " + PA.mouse.y, 10,20); 
}

// class with 2D arrays containing all pixels
class PointArray
{
  //ArrayList ppoints;
  Point[][] ppoints;
  PVector mouse;
  color pcol;
  
  PointArray()
  {
   //ppoints = new ArrayList();
   mouse = new PVector();
   ppoints = new Point[img.width][img.height];
   PointArray();
  }
  
  void run()
  {
    ShowPoints(); 
    MouseCheck();
  }

  void PointArray()
  {
    for (int i = 0; i < img.width; i++) {
      for (int j = 0; j < img.height; j++) {
         // img.loadPixels();
        pcol = img.get(i,j);
        ppoints[i][j] = new Point(new PVector(i+width/2-img.width/2, j+height/2-img.height/2), pcol);
        //img.updatePixels();
      }
    }
  }
  
  void ShowPoints()
  {
   for (int i = 0; i < ppoints.length; i++) {
     for (int j = 0; j < ppoints[i].length; j++) {
       Point p = (Point) ppoints[i][j];
       p.run(mouse);
     }
   } 
  }
  
  void MouseCheck()
  {
   mouse.set(mouseX, mouseY);
  }
 
}

// point class
class Point
{
  PVector dpos;
  PVector pos;
  PVector vel;
  PVector acc;
  
  color col;
  
  float maxSpeed;
  float distance;
  float MouseDist;
  float minMouseDist;
  float maxDist;
  
  Point(PVector p, color col_)
  {
    pos = p;
    acc = new PVector();
    vel = new PVector();  // comment out this line instead of the next one to see explosion in slo-mo
    //vel = new PVector(random(-0.2,0.2),random(-0.2,0.2));
    dpos = p;
    col = col_;
    maxDist = 20.0f;
    minMouseDist = 10.0f;
    maxSpeed = 2.0f;
  }
  
  void run(PVector mouse)
  {
    show();
    accel(mouse);
    update();
  }
  
  void show()
  {
    noSmooth();
    noFill();
    stroke(col);
    point(pos.x,pos.y);
  }
  
  void accel(PVector mouse)
  {
   MouseDist = pos.dist(pos,mouse);
   if (MouseDist <= minMouseDist) acc.sub(rot(mouse));
  
   //acc.add(rot(mouse));
   acc.div(MouseDist*10);
  }
  
  void update()
  {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.set(0,0,0);
  }
  
  PVector rot(PVector target)
  {
      PVector rot;
      PVector desire = target.sub(target,pos); // vector that points to the target
      boolean slow = false;
      
      distance = pos.dist(pos,dpos);
      if (distance >= maxDist) slow = true;
      
      float d = desire.mag();
      
      if ((d > 0))
      {
        desire.normalize();
        
      if (slow) desire.mult(maxSpeed * (d/100));
      
      else desire.mult(maxSpeed);
      
      rot = target.sub(desire,vel);
      
      rot.limit(maxSpeed);
      }
      else rot = new PVector(0,0);
      
      return rot;
  }
}
  



