
float counter = 0;

void setup()
{
  size(400,400);
  colorMode(HSB,360,100,100);
}

void draw()
{
 background(250,50,5);
 translate(width/2, height/2);

 for (int i=0; i<15; i++)
 {
 pushMatrix();
 translate(cos(counter+i/3)*100, sin(counter+i)*100);

 float h = map(sin(counter),-1,1,250,360);
 noFill();
 stroke(h,100,80);
 strokeWeight(2);
 ellipse(0,0,60,60);
 popMatrix();
 
 counter += 0.6;
 }
}
