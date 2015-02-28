
PImage wood;

void setup()
{
  size(800,300);
  smooth();
  strokeCap(SQUARE);
  noLoop();
  imageMode(CENTER);
  
  wood = loadImage("Brown-wood-plank-texture.jpeg");
}

void draw()
{
  image(wood, width/2, height/2);



  for(int i = -50; i<= width+50; i+=80)
  {  
    float rw = random(0.5,1.5);
    float rh = random(0.5,1.5);
    int rs = int(random(255));
    int rsw = int(random(2,10));
    desk(i, height-20, rw,rh, rs,rsw);
  }
}

void desk(float x, float y, float w, float h, int s, int sw)
{
  pushMatrix();
  translate(x,y);
  scale(w,h);
  stroke(s);
  strokeWeight(sw);

  line(-265, -155, -35, -155);
  line(-200, -155, -200, 0);
  line(-95, -155, -95, 0);
  popMatrix();
}


