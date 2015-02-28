
PGraphics buffer;    // Framebuffer datatype
ArrayList balls;    
boolean reflectionSurface;
float t = 0;

void setup(){
  size(500,500);    // P3D renderer 2x faster
  fill(0);
  noStroke();
  buffer = createGraphics(width/2, height/2);  //Framebuffer constructor
  reflectionSurface = false;
  balls = new ArrayList();
  createBalls();
}

void draw(){
  t = t + .02;
  fill(0);
  rect(0, 0, width, height);
  preDraw();      // Call this before drawing
  //-Your drawing calls go here-
  
  buffer.background(0);
  drawBalls();
  //Just make sure you prefix it with buffer so that it draws to the framebuffer
 
  postDraw();    // Call this after drawing
 
 if (reflectionSurface == true) {
   fill(255, 40);
   rect(0,height/2,width,height);
 }
}

void preDraw(){        
  buffer.beginDraw();
}

void postDraw(){      // Does all the fancy reflections
  buffer.endDraw();
  pushMatrix();
  scale(1);
  image(buffer, 0, 0);
  popMatrix();        // Resets the coords
  pushMatrix();
  scale(-1,1);
  image(buffer, -width, 0);    // When the scale is negative, the coord is negative
  popMatrix();
  pushMatrix();
  scale(1,-1);
  image(buffer, 0, -height);
  popMatrix();
  pushMatrix();
  scale(-1,-1);
  image(buffer, -width, -height);
  popMatrix();
}

void createBalls(){
 int maxBalls = 12;
 float factor;
 while (balls.size() < maxBalls) {
    factor = random(0,3); 
    balls.add(new Ball(random(0, width), random(0, height), factor));
 }
}

void drawBalls(){
    for (int i = balls.size() - 1; i >= 0; i--) {
        Ball ball = (Ball) balls.get(i);
        ball.update(t);   
        ball.display();
    }  
}


class Ball {
  float x, y;
  float step;
  float step2;
  float factor;
  
  Ball(float x, float y, float f) {
    this.x = x;
    this.y = y; 
    this.factor = f;   
    this.step = random(1.0, 2.0);
    this.step2 = random(2.0, 2.5);
  }
  
  void update(float t) {
    if (this.factor <= 1){
    this.x = sin(step2*t) * 120 + width/2;
    this.y = cos(step*t) * 120 + height/2;
    } else if (this.factor <= 2){
    this.x = sin(step*t) * 120 + width/2;
    this.y = cos(step2*t) * 120 + height/2;
   } else if (this.factor <= 3){
    this.x = sin(step*t) * (110 + sin(.01*t) * 110) + width/2;
    this.y = cos(step*t) * (110 + sin(.01*t) * 110) + height/2;
    }
  }

  void display() {    
    fill(255); 
    buffer.ellipse(this.x, this.y, 30, 30);
  } 
}


