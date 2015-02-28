
PImage b;
int x=150;
int y=100;
void setup()
{
  size(600,600);
  b=loadImage("earth-clip-art-3.jpg");
}
void draw()
{
    background(0);
  image(b,x,y,300,300);
  if(keyPressed){  
    x=x+int(random(-8,8));
    y=y+int(random(-2,2));

  }  

  if(!mousePressed){  


  }  

} 




