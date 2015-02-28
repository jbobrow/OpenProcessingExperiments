
float numFaces = 10;
float spacer;
void setup()
{
    size(800, 200);
    smooth(); noLoop();
    colorMode(HSB, 360,100,100);
    spacer = width / numFaces;
}
 
void draw()
{
   background(255, 0,100);
   for(float i=1; i<numFaces; i++)
   {
       float rs = random(20, 120);
       float rh = random(360);
       float rsw = random(0.1, 4);
       smiley(i*spacer,  height/2, rs, color(rh, 100,100), rsw);
   }
}
 
void smiley(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(sw);
   
  pushMatrix();
  translate(x, y);
  ellipse(0,0, s,s);
  ellipse(-(s*0.2), -(s*0.2), (s*0.05), (s*0.05));
  ellipse((s*0.2), -(s*0.2), (s*0.05), (s*0.05));
  arc(0,0, s*0.8,s*0.8, radians(30), radians(160));
  popMatrix(); 
}
 
void mousePressed()
{
   redraw();
}



