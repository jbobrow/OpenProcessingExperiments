
void setup ()
{ 
  //la taille ect
  size (500,500);
  smooth();
  background(0);
  //les formes auront juste un contour, pas remplies
  noFill();
}
void draw()
{
    translate(width/2,height/2);
  for (int i=0;i<360;i+=20)
  {
    rotate(radians(20));
    //ellipse1
    stroke(#FF7EFF,50);
    strokeWeight(14);
    ellipse(0,0,50,200);
    //ellipse2
    stroke(#BC1CBA,50);
    strokeWeight(10);
    ellipse(0,0,80,350);

 //ellipse3
 stroke(#FF95FE,50);
 strokeWeight(25);
 ellipse(0,0,100,470);
  
  }
  noLoop();
}

