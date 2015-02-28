
float ramas;
void setup()
{
  smooth();
  size(700,500);
  background(255);
  ramas= radians(30);
  translate(width /4,height);
  stroke(142,93,44);
  strokeWeight(40);
  line(160,160,160,-50);
  stroke(142,93,44);
  strokeWeight(30);
  line(160,160,160,-100);
  translate(160,-100);
  noStroke();
  arbol(150,20);
  hojas(150);
  
}

void arbol(float h,float s)
{

  h *=0.7;
  s *=0.6;
 
  if(h>1 && s>0)
  {
    
    pushMatrix();
    stroke(142,93,44);
    strokeWeight(s*0.5);
    rotate(-ramas);
    line(0,0,0,-h);
    translate(0,-h);
    arbol(h,s);
    popMatrix();
    
    pushMatrix();
    strokeWeight(s*0.6);
    rotate(ramas);
    line(0,0,0,-h-10);
    translate(0,-h-10);
    arbol(h,s);
    popMatrix();
       
  }
}

void hojas(float h)
{

  h *=0.7;
 
  if(h > 1)
  {
    pushMatrix();
    rotate(-ramas);
    fill(96,160,82);
    translate(0,-h);
    ellipse(0,0,2,2);
    hojas(h);
    popMatrix();
    
    pushMatrix();
    rotate(ramas);
    line(0,0,2,-h-10);
    translate(0,-h-10);
    hojas(h);
    popMatrix();
       
  }
}



