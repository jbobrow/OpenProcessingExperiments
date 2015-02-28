
int xpos;
int ypos;
int velocity;
int c1;
int c2;


void setup(){
  size(500,500);
  xpos=width/10;//weird when I use actual number here
  ypos=height/2;
  velocity=8;
  c1=255;
  c2=0;
}
void draw(){
  background(c1,c2,0);
  fill(c2,c1,0);
  if(xpos>=width-25||xpos<=25){
    velocity=-1*velocity;
    /*it's kind of confusing that 
    why I don't need to discuss the other posibility.
    I actually saw some of the code from Galit. */
    if (c1==0&&c2;==255){
      c1=255;
      c2=0;
    }
    else if(c1==255 && c2==0){
      c1=0;
      c2=255;
    }
   
  }
  
  xpos=xpos+velocity;

  smooth();
  
  ellipse(xpos,ypos,50,50);
  
  }
