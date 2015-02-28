
void motif(int i, int j, float largeurCase, float hauteurCase)
{
  fill(0);
  noStroke();
  float dx = mouseX - (i*largeurCase+largeurCase/2);
  float dy = mouseY - (j*hauteurCase+hauteurCase/2);
  float angle = atan2(dy,dx);
  float diagonale = dist(width,height,width/2,height/2);
  float d =  dist(mouseX,mouseY,width/2,height/2)/diagonale;
  pushMatrix();
  translate(largeurCase/2,hauteurCase/2);
  rotate(angle);
  arc (d*largeurCase,d*hauteurCase,largeurCase,hauteurCase,radians(10),radians(360-10));
  popMatrix();  
}

