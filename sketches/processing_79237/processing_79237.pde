
void setup ()
{
  size (600,600);
  smooth ();
  
}

void draw ()
{
  
  //INT
  
  int tch1;
  tch1 = 75;
  int tcv1;
  tcv1 = 75;
  int scin;
  scin = 125;
  int aur1;
  aur1 = 3;
  int aur2;
  aur2 = 6;
  int limitaur;
  limitaur = 100;
  
  
  
  background (255,random (215+mouseX/15,215+mouseX/5), random (90+mouseX/15,90+mouseX/5));
  
  noStroke ();
  
  fill (255,random (235+mouseX/25,235+mouseX/15), random (175+mouseX/25,175+mouseX/15));
  
  ellipse (width/2,height/2,random (tch1-mouseX/aur1,tch1+mouseX/aur1)-limitaur,random (tcv1-mouseX/aur1,tcv1+mouseX/aur1)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur1,tch1+mouseX/aur1)-limitaur,random (tcv1-mouseX/aur1,tcv1+mouseX/aur1)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur1,tch1+mouseX/aur1)-limitaur,random (tcv1-mouseX/aur1,tcv1+mouseX/aur1)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur1,tch1+mouseX/aur1)-limitaur,random (tcv1-mouseX/aur1,tcv1+mouseX/aur1)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur1,tch1+mouseX/aur1)-limitaur,random (tcv1-mouseX/aur1,tcv1+mouseX/aur1)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur2,tch1+mouseX/aur2)-limitaur,random (tcv1-mouseX/aur2,tcv1+mouseX/aur2)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur2,tch1+mouseX/aur2)-limitaur,random (tcv1-mouseX/aur2,tcv1+mouseX/aur2)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur2,tch1+mouseX/aur2)-limitaur,random (tcv1-mouseX/aur2,tcv1+mouseX/aur2)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur2,tch1+mouseX/aur2)-limitaur,random (tcv1-mouseX/aur2,tcv1+mouseX/aur2)-limitaur);
  ellipse (width/2,height/2,random (tch1-mouseX/aur2,tch1+mouseX/aur2)-limitaur,random (tcv1-mouseX/aur2,tcv1+mouseX/aur2)-limitaur);
  
  noFill ();
  stroke (255,random (235+mouseX/15,235+mouseX/5), random (175+mouseX/15,175+mouseX/5));
  
  ellipse (width/2,height/2,random (tch1-mouseX/2,tch1+mouseX)-scin,random (tcv1-mouseX/2,tcv1+mouseX)-scin);
  ellipse (width/2,height/2,random (tch1-mouseX/2,tch1+mouseX)-scin,random (tcv1-mouseX/2,tcv1+mouseX)-scin);
  ellipse (width/2,height/2,random (tch1-mouseX/2,tch1+mouseX)-scin,random (tcv1-mouseX/2,tcv1+mouseX)-scin);
  
  noStroke ();
  fill (255,random (250+mouseX/15,250+mouseX/5), random (225+mouseX/15,225+mouseX/5));
  
  ellipse (width/2,height/2,random (tch1-mouseX/15,tch1+mouseX/15),random (tcv1-mouseX/15,tcv1+mouseX/15));
  
}


