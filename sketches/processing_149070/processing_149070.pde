

float x;
float y;
float easing = 0.01;
 
PImage Back;
PImage fairy;
PImage land;
PImage monster;
PImage skeleton;
  
SpriteObject troll;
SpriteObject boss;
SpriteObject pink;
SpriteObject dead;

Mover[] movers = new Mover[100];  //bug objects
int[] beaconsX = new int[100];    //array of X values of beacons
int[] beaconsY = new int[100];    //array of Y values of beacons
 
int max = 0; // actually means the number of bugs
   
void setup()
{
   size(600, 600);
   land = loadImage("land.jpg");
   fairy = loadImage("uni.png");
   fairy1 = new Fairy(random(width), random(height),4,4);
  
 
  /* making bug objects */
  frameRate(60);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  
  troll = new SpriteObject("fairy.png");
  troll.y = 200;
  troll.speed = 5;
  troll.s = .5;
  troll.directionY = random(4);
  troll.directionX = random(3);
    
  boss = new SpriteObject("monster.png");
  boss.x = x;
  boss.y = y;
  boss.s = .6;
   
  pink = new SpriteObject("fairy.png");
  pink.x = 75;
  pink.y = 150;
  pink.s = .45;
  pink.directionY = random(5);
  pink.directionX = random(5);
  pink.speed = 4;
   
  dead = new SpriteObject("Skeleton.png");
  dead.s = .45;
   
 
   


  
  } 

   
float timer = 0;

void reset() {
  for (int i = 0; i < beaconsX.length; i++) {
    beaconsX[i] = 0;
    beaconsY[i] = 0;
  }
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  max = 0;
}


void draw(){
  image(land, 300,300,600,600); 
  fairy1.move();
  fairy1.draw();
  
 
 
   /* manage key press */
  if (keyPressed) {
    switch (key) {
    case 'r' : //call reset()
      reset();
      break;
    
    }
  }
 
  /* rectangle to dessolve everything */
  fill(0, 30);
  rect(0, 0, width, height);
 
  /* update every movers(bugs) */
  for (int i = 0; i <= max; i++) {
    movers[i].update(i);
    movers[i].checkEdges();
    movers[i].display();
  }

 


  timer += 0.0167;
 
if (timer > 6)
{
  boss.step();
  boss.render();
}
   
  pink.run();
  pink.render();
   
if (timer > 15)
{
  pink.speed = 0;
  dead.x = pink.x;
  dead.y = pink.y;
  dead.render();
}
    
     
  troll.update();
  troll.render();
   
   
  if (boss.isOverlapping(troll) == true)
  {
    troll.s = 0;
    boss.s = .8;
  }
    
  
}
   
 class Predator extends SpriteObject
{
  Predator(String filename) { super(filename);}
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
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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
       
    this.y += random(directionY) * speed;
    this.x += random(directionX) * speed;
      
      
  
  }
   
      void run()
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
       
    this.y += random(directionY) * speed;
    this.x += random(directionX) * speed;
    
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
    
  void step()
  {
    float targetX = troll.x;
    float dx = targetX - x;
     if(abs(dx) > 1)
     {
    x += dx * easing;
  }
    
  float targetY = troll.y;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
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
 
 
}
void mouseClicked() {
 
  if (max < 99) {
 
    /* draw light beacon */
    fill(180, 170, 100);
    ellipse(mouseX, mouseY, 30, 30);
    fill(200, 190, 100);
    ellipse(mouseX, mouseY, 15, 15);
 
    /* set the beacon of index 'max' */
    beaconsX[max] = mouseX;
    beaconsY[max] = mouseY;
    max++;
  }
}
 
 
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  color bugcolor;
  float speed;
 
  /* constructor */
  Mover() {
    location = new PVector (random(width), random(height));
    velocity = new PVector (0, 0);
    bugcolor = color(random(0, 255), random(0, 255), random(0, 255));
  }
 
  void update(int bIndex) {
 
    PVector dirVector;
 
    if (beaconsX[bIndex] != 0) //if there's an beacon for the bug of 'bIndex'
      dirVector = new PVector(beaconsX[bIndex], beaconsY[bIndex]);    //go to the beacon
    else    //if not
      dirVector = new PVector(mouseX, mouseY);    //track the mouse
    PVector dir = PVector.sub(dirVector, location);
    dir.normalize();
    dir.mult(0.3);
    acceleration = dir;
 
    velocity.add(acceleration);
    velocity.limit(4);
    location.add(velocity);
  }
   
  /* draw */
  void display() {
    noStroke();
    fill(bugcolor);
    pushMatrix();
    translate(random(-5, 5), random (-5, 5));
    ellipse(location.x, location.y, random(3, 10), random(3, 10));
    popMatrix();
  }
   
  /* removing edges */
  void checkEdges() {
    if (location.x > width)
      location.x = 0;
    else if (location.x < 0)
      location.x = width;
    if (location.y > height)
      location.y = 0;
    else if (location.y < 0)
      location.y = height;
  }
}
class Fairy{
  float x;
  float y;
  float x_speed;
  float y_speed;
   
  Fairy (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  } 
  
  void draw(){
    image(fairy,x,y);
  }
   
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 150) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;

  }
}


