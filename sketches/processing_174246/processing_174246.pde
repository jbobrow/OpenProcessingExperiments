
void setup()
{
  size(900,900);
  background(0,147,255);
}
 
void draw()
{
  line(300,900,300,400);
  line(300,600,300,400);
 
    stroke(255,152,0);
    strokeWeight(2);
 
  drawTree(300,600,150,90,6);
}
 
 
   
   
void drawTree(float sx, float sy, float r,float d,int num){
 
   
 
  float tx=r*cos(radians(d));
  float ty=r*sin(radians(d));
  stroke(255,152,0);
  strokeWeight(2);
  line(sx,sy,sx-tx,sy-ty);
  
 
  if(num>1){
    r/=2.5;
    num--;
 
     drawTree(sx-tx,sy-ty,r,d+70,num);
     drawTree(sx-tx,sy-ty,r,d-70,num);
     drawTree(sx-tx,sy-ty,r,d,num);
      
      
         
  }
}
  
