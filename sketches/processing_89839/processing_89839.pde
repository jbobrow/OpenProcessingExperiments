
int speed=1;
int x=0,y=0;
void setup(){
size(400,400);

}
void draw(){
drawShapes(width/2,height/2);
}

// parameters x and y is the center point
void drawShapes(int xCenter,int yCenter)
{
  background(255);
if(pmouseX>(xCenter+10)||pmouseX<(xCenter-10)&&pmouseY<(yCenter-10)||pmouseY>(yCenter+10))
{
  fill(0,255,0);  
  rect(x,y,50,50);
  fill(255,0,0);
  noStroke();
  rect(x+20,y,10,50);
  rect(x,y+20,50,10);
  x=x+speed;
  y=y+speed;
  if(x<0||x>width-50)speed=-speed;


}


}

