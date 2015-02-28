
PImage underwater;
PImage [] mario;
//PImage [] luigi;
Mario [] marios;
 
void setup() {
  size (500, 500);
  mario = new PImage[4];
  //luigi= new PImage[3];
  marios = new Mario[20];
   
   
  for(int dbag = 0; dbag < marios.length; dbag++) {
  marios[dbag] = new Mario(random(100, 400), random(100, 400));
  }
   
 
  for(int i = 0; i<mario.length; i++) {
    mario[i] = loadImage("Mario Swim"+ (i+1) +".png");
  }
  underwater = loadImage("underwater.jpg");
}
 
 
void draw() {
 
  image(underwater, 0,0, 500, 500);
  for(int i = 0; i<marios.length; i++) {
     
  marios[i].update();
  
  }
   
}
 
 
 
 
class Mario {
  float x;
  float y;
  float velY;
  float velX;
  float destinY;
  float destinX;
  int counter;
  int frame;
  int speedFrame;
  int speed=5;
   
  Mario (float xpos, float ypos) { 
    x = xpos;
    y = ypos;
    speedFrame = int(random(2, 25));
    destinX = x;
    destinY = y;
  }
  void update() {
     
    pushMatrix();
    translate(x, y);
    
 
     x += speed;
     y += speed;
  if (x >= 475 || x <= 25){
    speed *= -1;
  }
  if (y >= 475 || y <= 25){
    speed *= -1;
  }
  
    if(counter%speedFrame==0) {
      frame++;
    }
    if(frame > 2) frame= 0;
    
    
    //if(mousePressed){

     // marios= new Mario[5];
    //}
    
     image(mario[frame], -50, -50, 100, 100);
    
    popMatrix();
    counter++;
    speed++;
  }
}


