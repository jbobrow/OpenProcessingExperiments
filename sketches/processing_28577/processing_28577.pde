
PImage underwater;
PImage [] mario;
PImage [] luigi;
Mario [] marios;

void setup() {
  size (500, 500);
  mario = new PImage[4];
  luigi= new PImage[3];
  marios = new Mario[100];
  
  
  for(int dbag = 0; dbag < marios.length; dbag++) {
  marios[dbag] = new Mario(random(100, 400), random(100, 400));
  }
  

  for(int i = 0; i<mario.length; i++) {
    mario[i] = loadImage("Mario Swim"+ (i+1) +".png");
  }
  for(int j = 0; j<luigi.length; j++) {
    luigi[j] = loadImage("Luigi Swim"+ (j+1) +".png");
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
  boolean marioPick;
  
  Mario (float xpos, float ypos) {  
    x = xpos; 
    y = ypos;
    speedFrame = int(random(2, 25));
    destinX = x;
    destinY = y;
    marioPick = boolean(int(random(2)));
  } 
  void update() { 
    
    pushMatrix();
    translate(x, y);

    if(counter%100 ==0) {
      destinX =int(random(-100, 600));
    }
    if(counter%60 ==0) {
      destinY =int(random(-100, 600));
    }
    x += (destinX-x)*0.01;
    y += (destinY-y)*0.01;
    if(counter%speedFrame==0) {
      frame++;
    } 
    if(frame > 2) frame= 0;
    if(marioPick==true) {
      image(mario[frame], -50, -50, 100, 100);
    }else{
      image(luigi[frame], -50, -50, 100, 100);
    }
    popMatrix();
    counter++;
  }
}









