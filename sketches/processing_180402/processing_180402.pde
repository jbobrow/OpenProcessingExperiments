
float offset = 0;

void setup() {
  size(600, 600);
  stroke(200);
  noFill();
  background(0);
}
 
void draw()
{ 
     background(0);
     
     if(offset >= width)
     {
       offset = 0;
     }
     
     stroke(200);
     PVector circle1 = new PVector(0+offset, height/2);
     PVector circle2 = new PVector(width-offset, height/2);
     drawCircle(circle1, 500);
     drawCircle(circle2, 500);
     offset+= 1;
     

}

void drawCircle(PVector pos, float x)
{
  
  if (x>1){
     ellipse(pos.x,pos.y,x,x);
     drawCircle(pos, x-10);
  }
  
}
