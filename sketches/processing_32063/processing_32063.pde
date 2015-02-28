
class Particles
{
  public float x=0;
  public float y=height/2;
  public float x1=width/2;
  public float y1=0;
  public float xf=0;
  public float yf=0;
  public void move() {
    int xdir= 1;
    int ydir= 1;
    
    x1+=random(-1, 1);
    y1+=random(-1, 1);
    
    y1*=.95;
    x1*=.95;
    float xspeed=0;
    float yspeed=0;
    if(mouseX<width/2+20 && mouseX>width/2-20 && mouseY<height/2+20 && mouseY>height/2-20){
    xspeed= random(-1, 1);
    yspeed = random(-1, 1);
    
    x=width/2;
    y=height/2;
  }

    x+=x1;
    y+=y1;
    
    xf= x+xspeed;
    yf= y+yspeed;
    
    if(x>w) {
      x=w-20;
      x1*=-1;
   
    }

    if(x<0) {
      x=0;
      x1*=1;
    }

    if(y>h) {
      y= h-20;
      y1*=-1;
    }

    if(y<0) {
      y=0;
      y1*=1;
    }
   
  
    
    
  }

  public void render() {
    noStroke();
    fill(x, y, x1);
    ellipse(xf, yf, 20, 20);
    
  }
}


