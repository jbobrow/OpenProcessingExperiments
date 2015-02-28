
int x=0;
int speedX=1;

void setup(){
size(200,200);
}
void draw()
{
  fillShape();
drawEllipse(height/2);


}

//
void drawEllipse(int posY)
{
background(255);
ellipse(x,posY-20,10,10);
ellipse(width-x,posY+20,10,10);
x+=speedX;
if(x>width||x<0)speedX=-speedX;
}
//
void fillShape(){
  float r=0,g=255,b=255;
 if(frameCount>100)r=random(255);
 g=frameCount%255;
 
 //2 seconds 
 if(frameCount%frameRate==2)
  b*=0.567;
  float base=width;
  float tran=mouseX/base*255;
  fill(r,g,b,tran);
}

