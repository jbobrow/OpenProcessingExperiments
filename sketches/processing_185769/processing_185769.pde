

int numOfBalls = 200;
ball[] balls = new ball[numOfBalls]; 
// ^creates fixed array size based on numOfBalls that will store ball objects

void setup(){
  size(500, 500);

  for(int i = 0; i < numOfBalls; i++){
    balls[i] = new ball(random(0,500), random(0,500), random(10,50), random(-10,-10), random(-1,1));
    // ^generates balls with random values in the array
  }
}

void draw(){
  background(0);
  for(int i = 0; i < numOfBalls; i++){
    balls[i].a = dist(mouseX, mouseY, balls[i].posX, balls[i].posY)*1.5;
    // ^sets the alpha value for each ball equal to the distance between a ball and the mouse
    //  then multiplied by a modifier to control the fade radius 
    balls[i].draw();
    balls[i].move();
  }
}

class ball{
  float posX;
  float posY;
  float size;
  float a;
  float radi;
  float velocity;
  float offsetX;
  float offsetY;
  
  ball(float POSX, float POSY, float SIZE, float RADI, float VELOCITY){
    posX = POSX;
    posY = POSY;
    size = SIZE;
    radi = RADI;
    velocity = VELOCITY;
  }
  void draw(){
    noStroke();
    fill(255, 255, 255, a);
    ellipse(posX, posY, size, size);
  }
  void move(){
    
    offsetX += velocity;
    //offsetY += velocity;
        
    if(offsetX >= radi) velocity *= -1;
    if(offsetX <= radi*-1) velocity *= -1;
    
    posX += offsetX;
    //posY += offsetY; 
    // ^this was intended to be perfect circular motion 
    //  but I stopped at just using the X.
  }
}




