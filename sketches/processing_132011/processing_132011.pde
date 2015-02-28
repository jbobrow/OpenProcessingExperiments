
void setup()
{
  size(400,400);
  background(154,192,205)
  smooth();
}

int x=0;
int y=50;
int z=50;
int speed=5;
void draw()
  {
    frameRate(30);
    background(154,192,205);
    //pacman
    noStroke();
    fill(255,215,0);
    arc(x, 200, 50, 50,PI/6,((11*PI)/6));
   
     //pacman eye
    fill(0);
    ellipse(x,185,7,7);
    x=x+speed;
    
    if (x>=410)
      {
        x=0;
      } 
    
    //cherry stem
    stroke(0,139,69); 
    strokeWeight(4);
    line(y,195,z,170);
    line(y+20,210,z,170);
    z=z+speed; 
    if (z>=410)
      {
        z=0;
      }  
    //cherries 
    noStroke();
    fill(176,23,31);
    ellipse(y,195,15,15);
    ellipse(y+20,210,15,15);
    y=y+speed;
     if (y>=410)
      {
        y=0;
      }
 
  }
  
