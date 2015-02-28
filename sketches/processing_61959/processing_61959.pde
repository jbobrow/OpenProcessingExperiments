
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  noCursor();
  frameRate(3);
} 
void draw() 
{
  //image(loadImage("logo.ping"),0,0);
  //background(255, 255, 255);
  fill(255, 255, 255, 30); 

  fill(random(255), random(255), random( 255));
  ellipse(random(400), random(600), 30, 30 );
  fill(0);
  //background(255,255,255);
  // textAlign(CENTER);
  textSize(20);
  text("SENIORS 2012!!!!!!", random(width), random( height));
}
