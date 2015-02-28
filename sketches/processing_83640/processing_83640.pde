
void setup ()
{
  size(500,500);
  smooth();
  
  
}

void draw()
{
  background(0);
  noStroke();
  fill(255,35);
  
  //largeur de l'ellipse
  int L=120;
  
  translate(width/2,height/2);
  ellipse(0,0,200,L);

  rotate(PI/10);
  ellipse(0,0,200,L);
  
  rotate(PI/9);
  ellipse(0,0,200,L);
  
  rotate(PI/8);
  ellipse(0,0,200,L);
  
  rotate(PI/7);
  ellipse(0,0,200,L);
  
  rotate(PI/6);
  ellipse(0,0,200,L);
  
  rotate(PI/5);
  ellipse(0,0,200,L);
  
    rotate(PI/4);
  ellipse(0,0,200,L);
  
   rotate(PI/3);
  ellipse(0,0,200,L);
  
   rotate(PI/2);
  ellipse(0,0,200,L);
  
  noLoop();
}


