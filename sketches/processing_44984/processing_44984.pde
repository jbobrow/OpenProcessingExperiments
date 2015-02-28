
PImage s;

void setup()
{
  size(600,600);
  smooth();
  colorMode(HSB);
  shapeMode(CENTER);
  imageMode(CENTER);
  frameRate(15);
  
  
  s = loadImage ("final_logo_orange.png");
}
 
void draw()
{
  background(100,70,200);
  float mv = map(mouseX,0,width,0.5,2.5);
 
  for(int i = 50; i<= width; i+=80)
  { 
    float rw = random(0.5,1.5)*mv;
    float rh = random(0.5,1.5)*mv;
    int rs = int(random(255));
    int rsw = int(random(2,10));
    color rc = color(random(255), 255, 100, 180);
    logo(rs, rh, rw,rh, s, rc);
  }
}
 
void logo(float x, float y, float w, float h, PImage s, color c)
{
  pushMatrix();
  translate(width/2,height/2);
  scale(w, h);
  stroke(h);
  strokeWeight(w);
  tint(c);
  image(s, 0, 0, 250, 250);
  popMatrix();
}

