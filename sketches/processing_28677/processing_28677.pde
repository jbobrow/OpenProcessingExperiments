
PImage logs;
PImage [] flames;
Fire [] flame;

void setup(){
  size (500,500);
  flames = new PImage[4];
  flame = new Fire[50];
  
  for(int b = 0; b < flame.length; b++) {
  flame[b] = new Fire(random(100, 400), random(100, 400));
  }
  
  for(int i = 0; i<flame.length; i++) {
    flames[i] = loadImage("flame"+ (i+1) +".png");
  }
  logs = loadImage("logs.jpg");
}

void draw() {
 
  image(logs, 0,0, 500, 500);
  for(int i = 0; i<flame.length; i++) {   
  flame[i].update();
  }
   
}

class Fire {
  float sizex;
  float sizey;
  float tsize;
  int frame;
  float x;
  float y;
  float fendx;
  float fendy;
  int counter;
  
  Fire (float xpos, float ypos){
    x = xpos;
    y = ypos;
    fendx = x;
    fendy = y;
  }
  void update(){
    pushMatrix();
  
    translate(x, y-40);
    image(flames[frame], -38, -30, sizex, sizey);
    popMatrix();
  
    if (counter > 5){
    frame ++;
    counter = 0;
    }
    counter ++;
  }
}

