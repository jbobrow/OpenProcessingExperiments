
int ballNum = 100;
int p = 500;
ball[] b = new ball[ballNum];

void setup(){
  size(500, 500);
  background(255);
  smooth();
  
  for(int i=0;i<ballNum;i++){
    b[i] = new ball(random(0,width), random(0, height), random(10,30));
    b[i].vx = p*random(-1,1);
    b[i].vy = p*random(-1,1);
    b[i].r = random(0, 255);
    b[i].g = random(0, 255);
    b[i].b = random(0, 255);
  }
}

void draw(){
  fadeToWrite();
  for(int i=0;i<ballNum;i++){
    b[i].update();
  }
}

void mouseReleased(){
  for(int i=0;i<ballNum;i++){
    b[i].mouse();
  }
}

void fadeToWrite(){
  noStroke();
  fill(255,40);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
  
class ball{
  float x, y, s;
  float vx = 0, vy = 0;
  float r, g, b;
  
 ball(float _x, float _y, float _s){
   x = _x;
   y = _y;
   s = _s;
 }
 
 void update(){
   x = (mouseX+x*50)/51;
   y = (mouseY+y*50)/51;
   noStroke();
   fill(r, g, b, 50);
   ellipse(x, y, s, s);
 }
 
 void mouse(){
   x += vx;
   y += vy;
   
   if(x < 0){
     vx = -vx;
   }
   if(x > width){
     vx = -vx;
   }
   if(y < 0){
     vy = -vy;
   }
   if (y > height){
     vy = -vy;
   }
 }
}




