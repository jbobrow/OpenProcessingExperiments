
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
  
  for(int posx=0; posx<=500; posx=posx+5)
  for(int posy=0; posy<=500; posy=posy+5)
  {
  
  //largeur de l'ellipse
  int L=120/4;
  int H=200/4;
  
  translate(posx,posy);
  ellipse(0,0,H,L);

  rotate(PI/10);
  ellipse(0,0,H,L);
  
  rotate(PI/9);
  ellipse(0,0,H,L);
  
  rotate(PI/8);
  ellipse(0,0,H,L);
  
  rotate(PI/7);
  ellipse(0,0,H,L);
  
  rotate(PI/6);
  ellipse(0,0,H,L);
  
  rotate(PI/5);
  ellipse(0,0,H,L);
  
    rotate(PI/4);
  ellipse(0,0,H,L);
  
   rotate(PI/3);
  ellipse(0,0,H,L);
  
   rotate(PI/2);
  ellipse(0,0,H,L);
  
  }
  
  noLoop();
}


