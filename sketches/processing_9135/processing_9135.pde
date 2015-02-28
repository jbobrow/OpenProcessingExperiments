
void motif(int i, int j, float largeurCase, float hauteurCase)
{
  //fill(82,178,45);
  fill(245,12,12);
  // fill(random(0),random(255),random(0),random(255));
  noStroke();
  
  float dx = mouseX - (i*largeurCase+largeurCase/2);
  float dy = mouseY - (j*hauteurCase+hauteurCase/2);
  float angle = atan2(dy,dx);
  float diagonale = dist(width,height,width/2,height/2);
  float d =  dist(mouseX,mouseY,width/2,height/2)/diagonale;
  pushMatrix();
  translate(largeurCase/2,hauteurCase/2);
  rotate(angle);
  //arc (d*largeurCase,d*hauteurCase,largeurCase/2,hauteurCase/2,radians(niveauSonore),radians(360-180));
  ellipse(0,0,largeurCase/2,hauteurCase/2);
 fill (random(255),random(0),random(0));
 fill(255,255,255);
ellipse(0,0,largeurCase/6,hauteurCase/6);
  ellipse(30,30,largeurCase/2,hauteurCase/2);
  fill(random(255),random(0),random(0));
  ellipse(100,100,largeurCase/1,hauteurCase/1);
  //void draw()
 // {fill(156,16,227);
  
  
  //ellipse((20,20,100,20);
  //}
  
  popMatrix();  
}

