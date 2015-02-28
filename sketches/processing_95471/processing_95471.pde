
int rad = 60;       
float xpos, ypos;      
float xspeed = 2.8; 
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1;  

circle[] circles = new circle[100]; 




void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
 
  xpos = width/2;
  ypos = height/2;
  
  for(int i=0; i < circles.length; i++){
   circles[i] = new circle();  
  }
}

void draw() 
{
  background(102);
  
  for (circle c: circles){
  c.animate(); 
  c.display(); 
  
 }
  
  
  
  

  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  
 
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  
    fill(random(0,255), random(0,255), random(0,255)); 
    
   }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
    fill(random(0,255), random(0,255), random(0,255)); 
    ellipse(xpos, ypos, 15, 15); 
  }
stroke(0); 
strokeWeight(10); 
  ellipse(xpos, ypos, rad, rad); // Draw the shape
 
}
class circle {
  float x;
  float y;
  float dimension;
  float angle;
   float speedX;
  float speedY;

  circle() {
    this.x = random(width);
    this.y = random(height);
    this.angle = random(PI);
    this.dimension = random(30, 60);
  
    this.speedX = random(-1, 1);
    this.speedY = random(-1, 1);  
  }  
  
  void animate() {
    angle += dimension/1000;
  x += speedX;
    y += speedY;
 
}
  
  void display() {
   
    pushMatrix();
    translate(x, y); 
    ellipse(0, 0, dimension, dimension); 
    popMatrix();  
  } 
  
}

//reffered back to code as I didnt remmember how to do everything


