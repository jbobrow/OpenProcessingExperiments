
void setup()
{
  size(900, 900);

}
 
void draw()
{
  background(255);
  noStroke();
   fill(random(255), random(255), random(255));
  smooth();
   
  int layers = 80;
   
  for(int i=layers; i>0; i--)
  {
    if(i%2 == 0)
     fill(random(0), random(0), random(255));

    else
      fill (220, 25, 44);


       
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(0.1 * frameCount*(layers+1-i)));
     
    float delta = 20;
    polygon(3, 0, 0, i*delta);
     
    popMatrix();
  }
}
 
void polygon(int sides, float x, float y, float rad)
{
  beginShape();
  PVector orig = new PVector(x, y);
  for(int i=0; i<sides; i++)
  {
    float angle = i*360.0 / sides;
    PVector newPt = new PVector(orig.x + rad*sin(radians(angle)), orig.y + rad*cos(radians(angle)));
    vertex(newPt.x, newPt.y);
  }
  endShape();
}

