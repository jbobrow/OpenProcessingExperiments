
int ballnum = 30; 

Ball[] balls = new Ball[ballnum]; 

void setup(){
for(int i = 0; i < ballnum; i++){
  balls[i] = new Ball(int(random(10,30))); 
}

  size(400,400);

}

void draw()
{
  background(0);
  for(int i = 0; i < ballnum; i++){
    balls[0].display();
    balls[0].update();
  }
}

class Ball {
  int bsize; 
  int xpos;
  int ypos; 
  int xspeed;
  int yspeed; 
  
   Ball(int stemp){
    bsize = stemp;
    xpos = (int)random(400);
    ypos = (int)random(400); 
    xspeed = (int)random(1,5); 
    yspeed = (int)random(1,5);  
  }
  
  void display(){
    noStroke();
    smooth();
    ellipse(xpos,ypos,bsize,bsize);
      print("x:");
      println(xpos);
      print("y:");
      println(ypos);
      
    
  }
  
  void update(){
  xpos = xpos + xspeed;
  ypos = ypos + yspeed; 
  
    if(xpos > width || xpos < 0) {
      xspeed = xspeed * -1; 

    }

    if(ypos > height || ypos < 0) {
      yspeed = yspeed * -1; 
      print("y:");
      println(ypos);
    }
  }
  
}


