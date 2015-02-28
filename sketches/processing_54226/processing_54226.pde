
class Ball{
  float x;
  float y;
  float yMove=random(-5,5);
  float xMove=random(-5,5);
  float s1=random(5,30);
  float rc1 = random(0,255);
  float rc2 = random(0,255);
  float rc3 = random(0,255);
  Ball(){
    x=width/2;
    y=height/2;
  }
  
  void move(){
    y+=yMove;
    x+=xMove;
    if (x>width||x<0){
      xMove*=-1;
    }
    if (y>height||y<0){
      yMove*=-1;
    }
  }
  
  void display(){
    noStroke();
    fill(rc1,rc2,rc3);
    ellipse(x,y,s1,s1);
  }
}

