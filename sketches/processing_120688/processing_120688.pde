
int numBalls = 12;
float spring = 0.2;
float gravity = 0.05;
float friction = -0.6;
Ball[] balls = new Ball[numBalls];
int activeIndex = 0;

int numSegments = 20;
float[] segX = new float[numSegments];
float[] segY = new float[numSegments];
float[] segDiameter = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 35;
float targetX, targetY;
float timer = 0;

void setup() {
  size(800, 800);

  segX[segX.length-1] = width;     
  segY[segY.length-1] = height/2;
  
  for (int i = 0; i < numSegments; i++)
  {
    segDiameter[i] = (i+20)*2;
  }
 
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(width/2, 1100, 50, i, balls);
  }

  
  noStroke();
  fill(255, 204);
  
}

void draw() {
  background(0);
  fill(255);
  textSize(25);
  text("GRAVITY: " + gravity,20,20);
  text("SPRING: " + spring,20,50);
  
  strokeWeight(1.0);
  stroke(0, 0, 255);
  reachSegment(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=segX.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<segX.length; i++) {
    segment(segX[i], segY[i], angle[i], (i+1)*2); 
  }
  
  // COLLISION DEBUG DRAWING
  /*for(int i=0; i<segX.length; i++) {
    fill(0, 255, 0);
    noStroke();
    ellipse(segX[i], segY[i], segDiameter[i], segDiameter[i]); 
  }*/
  

  timer += 0.0167;
  if (timer > 2)
  {
    int even = activeIndex % 2;
  balls[activeIndex].active = true;
  balls[activeIndex].y = 900;
  balls[activeIndex].vx = random(-5,5);
  balls[activeIndex].vy = random(-20,-30);
    balls[activeIndex].fillColor = color(random(0,255),random(0,255),random(0,255));
  activeIndex += 1;
  timer = 0;
  
  if (activeIndex == numBalls)
  {
    activeIndex = 0;
  }
  
    
  
  }
  

  
  
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].collideTentacle();
    balls[i].move();
    balls[i].display();  
  }
}

void positionSegment(int a, int b) {
  segX[b] = segX[a] + cos(angle[a]) * segLength;
  segY[b] = segY[a] + sin(angle[a]) * segLength; 
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - segX[i];
  float dy = yin - segY[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      gravity += 0.01;
    }
    
    if (keyCode == DOWN)
    {
      gravity -= 0.01;
    }
  
    }
    
    if (key == 'w')
    {
      spring += 0.05;
    }
    
    if (key == 's')
    {
      spring -= 0.05;
    }
  }

 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
  boolean dead = false;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
      
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
         
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);
         
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
        
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
   
     
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
         
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  boolean active = false;
  color fillColor = color(255, 0, 0);
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    if (active == true)
    {
      for (int i = id + 1; i < numBalls; i++) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].diameter/2 + diameter/2;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - others[i].x) * spring;
          float ay = (targetY - others[i].y) * spring;
          vx -= ax;
          vy -= ay;
          others[i].vx += ax;
          others[i].vy += ay;
        }
      } 
    }  
  }
  
  void collideTentacle() {
    if (active == true)
    {
      for (int i = 0; i < numSegments; i++) {
        float dx = segX[i] - this.x;
        float dy = segY[i] - this.y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = segDiameter[i]/2 + diameter/2;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - segX[i]) * spring;
          float ay = (targetY - segY[i]) * spring;
          vx -= ax;
          vy -= ay;
          //x[i].vx += ax;
          //y[i].vy += ay;
        }
      }
    }   
  }
  
  void move() {
    if (active == true)
    {
      vy += gravity;
      x += vx;
      y += vy;
      if (x + diameter/2 > width) {
        x = width - diameter/2;
        vx *= friction; 
      }
      else if (x - diameter/2 < 0) {
        x = diameter/2;
        vx *= friction;
      }
      if (y + diameter/2 > height) {
        y = height - diameter/2;
        vy *= friction; 
      } 
      else if (y - diameter/2 < 0) {
        y = diameter/2;
        vy *= friction;
      }
    }
  }
  
  void display() {
    fill(this.fillColor);
    ellipse(x, y, diameter, diameter);
  }
}



