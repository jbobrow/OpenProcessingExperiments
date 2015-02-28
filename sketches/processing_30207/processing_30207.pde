
//intergers
//floats
//booleans (true of false)
 

int NUMBER_OF_BALLS = 10;
BallClass[] balls;
//float x, xspeed, y, yspeed;

void setup(){
 size(500,500); 
 smooth();  
  balls = new BallClass[NUMBER_OF_BALLS];
  for(int i=0; i<NUMBER_OF_BALLS; i++) {
    balls[i] = new BallClass();
  }
}

void draw(){
    fill(0,25);
    rect(0,0,width,height);
    
    for(int i=0; i<NUMBER_OF_BALLS; i++) {
    //balls[i].moveIt();
    balls[i].drawIt();
  }
  // 
     
    }
    
class BallClass {
  float x=50.0;
  float xspeed;
  float y=50.0;
  float yspeed;
  float r=random(25,100);
  float a=random(25,75);


  BallClass() {
    xspeed = 3+random(-3,3);
    yspeed = 5+random(-3,3);
  }

  void drawIt() {
    noStroke();
    fill(255,a);
    x=x+xspeed;
    y=y+yspeed;
    
    if (x > width-50){
      xspeed = xspeed*-1;
    } else if(x < 50){
      xspeed = xspeed*-1;
    }
    
    if (y > width-50){
      yspeed = yspeed*-1;
    } else if(y < 50){
      yspeed = yspeed*-1;
    }
    ellipse(x,y,r,r);
    
  }
 // println(x);
}


