
import ddf.minim.*;
  
Minim minim;
AudioPlayer song;

void setup() {
  size(500,500);
 background(255);
stroke(255,0,0);
 strokeWeight(1);
 minim = new Minim(this);
  song = minim.loadFile("Sound.mp3");


}
void draw() {
    background(255);
  for (int i = 0 ; i < balls.size(); i++)
  { 
    Ball c = (Ball) balls.get(i);
    c.drawBall();
  }
  
}  
   void mousePressed() {

 }
float g = 0.5;
int nextID  = 0;
class Ball { 
  float vx,vy;
  float x, y;
  color col;
  float r ;
  float eFactor;
  int id;
  Ball(float x,  float y)
  {
    this.id = nextID;
    nextID += 1;
    this.x = x;
    this.y = y;
    this.vx = 0;
    this.vy = 0;
    print("new Ball");
    eFactor  = 1;
    r = 50;

  }
  void drawBall()
  {
      x = x + vx;
      y = y + vy;
          
  if( x <= r/2 || x >= width - r/2)
  { 
    vx = -vx;
  
     
  }
    if( y >= height - r/2)
    {
      float d = y - (height - r/2);
       song.play();
  song.rewind();
      y =  height - r/2 - d;
      vy = -vy * eFactor;
      if(abs(vy) < 2) {
          vy = 0;
           y =  height - r/2 ;
           
      }
    }
      fill(255,0,0);
      ellipseMode(CENTER);
      ellipse(x, y, r, r);
      vy = vy + g;
  }
}
ArrayList balls = new ArrayList(); ;
void mouseReleased() {
  Ball b = new Ball(mouseX, mouseY);
  balls.add(b);
}





