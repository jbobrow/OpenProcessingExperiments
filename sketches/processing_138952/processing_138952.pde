
PImage l;
int c,i,p=780,q=820;
 
void setup()
{
  background(240);
  size(600,600);
  smooth();
  
}
 
void draw()
{
  
  l=get();
  c++;
   
   translate(width/2,height/2);
   rotate(c*.001);
    for(i=0;i<4;i++)
    {
        rotate(c*0.001);
        stroke(18,134,243);
        rect(-p,-p,q,q);
        image(l,-p,-p,q,q);
    }
  
  p = mouseX-20;
  q = mouseY+20;
  
}
