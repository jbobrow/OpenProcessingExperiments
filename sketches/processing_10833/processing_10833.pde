
float hojas;
void setup()
{
  smooth();
  size(700,500);
  background(255);
  hojas= radians(30);
  translate(width /4,height);
  strokeWeight(40);
  line(160,160,160,-50);
  strokeWeight(30);
  line(160,160,160,-100);
  translate(160,-100);
  arbol(150,20);
}

void arbol(float h,float s)
{

  h *=0.7;
  s *=0.6;
 
  if(h>1 && s>0 )
  {
    
    
    pushMatrix();
    strokeWeight(s*0.5);
    rotate(-hojas);
    line(0,0,0,-h);
    translate(0,-h);
    arbol(h,s);
    
    popMatrix();
    pushMatrix();
    strokeWeight(s*0.6);
    rotate(hojas);
    line(0,0,0,-h-10);
    translate(0,-h-10);
    arbol(h,s);
    popMatrix();
       
  }
}

