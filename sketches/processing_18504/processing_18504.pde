
void setup(){
  size (300,300);
  frameRate (20);
  fill (0,250,0);
  rect (0,200,300,100);
  smooth();
}


void draw(){
  //background
  background (255-.263*mouseX,248-.08*mouseX,220+.033*mouseX);
 
  //sun
  fill (255,215,0);
  ellipse(50+.333*mouseX,200-.666*mouseX,100,100);
  
  //Tree
  fill (139,69,19);
  rect (195,100,10,120);
  //leaves
  fill (255-.683*mouseX,228-.077*mouseX,225-.583*mouseX);
  ellipse (170,80,75,50);
  ellipse (220,70,75,50);
  ellipse (200,95,75,50);
  
  //ground
  fill (255-.683*mouseX,228-.077*mouseX,225-.583*mouseX);
  //fill (50,205,50) (-205,-23,-175)
  rect (0,200,300,100);
  
}




