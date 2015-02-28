
void setup()
{
  size(800, 300);
  colorMode(HSB, 360, 100,100);
  smooth();
  noLoop();
}

void draw()
{
  background(255);
  for(int i = 5; i<width; i+=80)
  {
    //customize "smiley"
    float rs = random(10, 100);
    //float rh = random(10, 100);
    color rc = color(random(360), 100,100);
    smiley(i, height/2, rs, rc, 2);
    //int rs = int(random(255));
    float rsw = random(0.01, 4);
    //smiley(i, height/20, rs,rc,rsw);
  }
  
}

//describe everything smiley can do in ()
void smiley(float x, float y, float s, color c, float sw)
{
  //draw the thing
  fill(c);
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  //scale(w,h);
  //stroke(s);
  
  rect(0,0, s,s);
  //rect((0+5),(0+5), (s*0.8),(s*0.8));
  rect((0+25),0,s,s);
  ellipse((0+10),5, 5,5);
  ellipse((0+10),(0+10),3,3);
  line((0+8),(0+15), 20,15);
  line((0+8),(0+20), 20,20);
  line(10,0,-15,-20);
  line(30,-20,10,0);
  ellipse(-15,-20, (s*0.2),(s*0.2));
  ellipse(30,-20, (s*0.2),(s*0.2));
  popMatrix();
}

