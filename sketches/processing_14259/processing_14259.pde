
/*Starfish Class
By: Caroline Sievers
October 20th, 2010*/
Fish f;
float outerRad;
float x, y;
float speedX, speedY;

void setup(){
  size(400, 400);
  background(0, 100, 255);
  f = new Fish(40, 175);
  translate(width/2, height/2);
  speedX = 0.5; 
  speedY = 0.125;
  outerRad = 40;
  
  //Starfish!
  smooth();
  
  }

void polyStar(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta){
    float px = 100.0;
    float py = 100.0;
    // vertices is 2 times the outer point count, 5 pts
    float vertices = pts*2;
    fill(fillCol);
    stroke(strokeCol);
    strokeWeight(strokeWt);
    beginShape();
    for(int i=0; i<pts; i++){
      // calculate outer radius
      px = x + cos(theta)*outerRad;
      py = y + sin(theta)*outerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;
      // calculate inner radius
      px = x + cos(theta)*innerRad;
      py = y + sin(theta)*innerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;  
    
  }
  endShape(CLOSE);
  //eyes
  fill(0);
  smooth();
  
  fill(0);
  smooth();
  
}

void draw(){
  background(0, 100, 255);
  x += speedX;
  y += speedY;
  polyStar(x, y, 5, 55.0, 30.0, color(240, 240, 0), color(255), 2.0, 100.0);
  ellipse(x, y, 12, 12);
  f.display();
  f.move();
  collide();
}

void collide(){
  if (x > width-outerRad){
    x = width-outerRad;
    speedX *= -1;
  } else if (x < outerRad){
    x = outerRad;
    speedX *= -1;
  }
  
   if (y > height-outerRad){
    y = height-outerRad;
    speedY *= -1;
    
  } else if (y < outerRad){
    y = outerRad;
    speedY *= -1;
  }
}

class Fish{

  PVector sz; 
 
  PVector loc;
  float speedX;
  float speedY;

  Fish(){
    init();
  }
  
  Fish(float w, float h){
    sz = new PVector(w, h);
    init();
  }
  
  Fish (PVector sz){
    this.sz = sz;
    init();
  }
  
  
  void init(){
    loc = new PVector();
    speedX = 0.5; 
    speedY = 0.125;
  }
  
  
  void move(){
    loc.x += speedX;
    loc.y += speedY;
    
  }
  
  void display(){
  }
  
  //setters/getters
  void setSz(PVector sz){
    this.sz = sz;
  }
  
  PVector getSz(){
    return sz;
  }
  
  void setSpeedX(float speedX){
    this.speedX = speedX;
  }
  
  float getSpeedX(){
    return speedX;
  }
}

