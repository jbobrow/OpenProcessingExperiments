
void setup()
{
  size(600,600);
  rectMode(CENTER);
}

void draw()
{
background(127,127,0);
 fill(100,100,255,80);
 noFill();
 stroke(255);
 
 for(int x = 0; x <=width;x+=100)
 {
   for(int y = 0; y <=height;y+=100)
   {
 pushMatrix();
 translate(x,y);
 
 

 for(int i = 100;i > 0;i-=10)
 {
   float rot_offset  = dist(width/2,height/2,x,y)*.03;
 rotate(radians(frameCount*.125+rot_offset));
 rect(0,0,i,i); 
 }
  popMatrix();
 }
 }
}
