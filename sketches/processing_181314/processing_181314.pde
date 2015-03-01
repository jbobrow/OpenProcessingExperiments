
float angolo;
float gigi;

void setup()
{
  size(800,600);
background(255);
angolo = 0;
gigi = 16;
}
  void draw()
{
scale(random(30));
    translate(width/2,height/2);
  // scale();
  strokeWeight(0);
  fill(#FEFF05);
 ellipse(0,0,37,37);
 //  background(0,0,255);
  for(int i=0;i<gigi;i++){
    //scale(1.05);
 fill(255,0,0);
 strokeWeight(3);
 stroke(#FEFF05);
 rotate(TWO_PI/gigi);
// angolo =+ PI/4;
 ellipse(0,75,40,110);
// gigi =+ 12;
 //text("petali",mouseX,mouseY);

 
// pushMatrix();
// translate(700,500);
 // rotate(PI/4);
//  fill(0,255,0);
// ellipse(0,0,80,50);
// angolo += PI/4;
 //pinolo += PI/-159;
// popMatrix();
}
}
