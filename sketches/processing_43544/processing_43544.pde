
//MOVEMENT
boolean Jumping;
boolean MovingLeft;
boolean MovingRight;
boolean noKey;
boolean Ground;
PVector Pos = new PVector(100,40);
int Posx;
int Posy;
int MWidth;
int MHeight;
//MAN
Man doctor;
PImage drL;
PImage drR;
    
//BLOCK
Ground ground;
Block block;

//level1
//Block[] blocks;



void setup() {
  size(700, 700);
  background(50);
  doctor = new Man(new PVector(350, 100),50, 110);
  ground = new Ground(350, 700, 700, 100, #178E2B);
  block = new Block(400, 650, #131E5F);
  drR = loadImage("docRight.png");
  drL = loadImage("docLeft.png");
  
  smooth();
}

void draw() {
  background(200, 200);
  ground.display();
 
  doctor.move();
  doctor.display();
  ground.display();
  block.display();
}

//KEYS
void keyPressed() {
  if ((key == 'a')||(key == 'A')) {
    MovingLeft = true;
  }
  if ((key == 'd')||(key == 'D')) {
    MovingRight = true;
  }
  if (((key == 'w')||(key == 'W'))&&(Ground)) {
    Jumping = true;
    Ground = false;
    
  }else{
    noKey = true;
  }
  
}
 
void keyReleased() {
  if ((key == 'a')||(key == 'A')) {
    MovingLeft = false;
  }
  if ((key == 'd')||(key == 'd')) {
    MovingRight = false;
  }
  

}


  



class Block {
  float x;
  float y;
  float w = 50;
  float h = 50;
  int c;

  Block(float xpos, float ypos, int c1 ) {
    this.x=xpos;
    this.y=ypos;
    this.c=c1;
    
  } 
  public float getX(){
     return  x; 
  }
  public float getY(){
    return y; 
  }
  public float getW(){
    return w; 
  }
  public float getH(){
    return h; 
  }
  void display() {
    rectMode(CENTER);
    fill(c);
    noStroke();
    rect(x, y, w, h);
    
  }
}

class Ground {
  float x;
  float y;
  float w;
  float h;
  int c;

  Ground(float xpos, float ypos, float wi, float he, int c1 ) {
    this.x=xpos;
    this.y=ypos;
    this.c=c1;
    this.w = wi;
    this.h = he;
    
  } 
  public float getX(){
     return  x; 
  }
  public float getY(){
    return y; 
  }
  public float getW(){
    return w; 
  }
  public float getH(){
    return h; 
  }
  void display() {
    rectMode(CENTER);
    fill(c);
    noStroke();
    
    rect(x, y, w, h);
    
  }
}


