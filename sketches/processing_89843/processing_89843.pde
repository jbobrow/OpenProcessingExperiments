
int x=0;
int speedX=1;

void setup(){
size(100,100);
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
  fill(0,255,0);
}

