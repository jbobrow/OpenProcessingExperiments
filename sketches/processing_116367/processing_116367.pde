
//Lamp

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
   background(random(255),random(255),random(255));
   for(float i=1; i<numFaces; i++)
   {
       float rs = (60);
       float rh = random(360);
       float rsw = random(0.1, 4);
       smiley(i*spacer,  height/2, rs, color(rh, 100,100));
   }
}
  
void smiley(float x, float y, float s, color c)
{
  fill(c);

    
  pushMatrix();
  translate(x, y);
  rect(-5,0,10,s);
  ellipse(0,50, s,s);
  quad(-30,10, -15,-70, 15,-70, 30,10);
  
  popMatrix();
}
  
void mousePressed()
{
   redraw();
}



