
int numCircle = 500; 
Circle[] circles = new Circle[numCircle]; 
 
void setup() 
{ 
  size(640, 480); 
  frameRate(10); 
  for(int i=0; i<numCircle; i++) { 
    circles[i] = new Circle(random(width), random(height), random(1, 6)*10); 
  } 
  for(int a=1; a<numCircle;a++) { 
    circles[a] = new Circle(random(width), random(height), random(2, 4)*10); 
  }
  
  ellipseMode(CENTER_RADIUS); 
  background(255); 
} 
 
 
void draw() 

{ 
  for(int i=0; i<numCircle; i++) { 
      circles[i].update();  
  }
  for(int a=0; a<numCircle; a++) { 
      circles[a].update();  
  }
} 
 
class Circle { 
    float x, y, r; 
          Circle( float xp, float yp, float rp) { 
          x = xp; y = yp; r = rp; 
  } 
  
  void update() { 
  /*
  To honaya.
  rect is good sight better than ellipse.
  So, ellipse code been change to this.
  */
    rect(x-1,y-1,r-y/width,r/2); 
  
  fill(random(255),random(255),random(255));
  }
}
                                
