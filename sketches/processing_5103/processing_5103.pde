
float w=371,i,j,x,y,r,t;

void setup(){
  size (371,260);
}
void draw(){
  
  PImage a;
  a=loadImage ("01.jpg");
  
  fill(255,20);
  image (a,0,0);
  
  rect(0,0,w,w);
  for(i=0;i<w;i+=8)
    for(j=0;j<w;j+=8)
    {
      r=6E3/(dist(x=mouseX,y=mouseY,i+2,j+2)+1E2);
      rect(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),10,10);
    }
} 



