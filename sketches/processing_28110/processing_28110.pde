
PImage img;
float min_shape, max_shape;


void setup()
{

  img = loadImage("1.jpg");
  size(481,363,P2D);
  background(0);
  noStroke();
  smooth();
  min_shape = 0.5;
  max_shape = width/10.0;
}
 
void draw()
{
  float radius = map(mouseY, 0, width, max_shape, min_shape);
  int opacity = int(map(mouseY, 0, height, 0, 255));

  int num_rects = round((5*max_shape*max_shape)/(radius*radius));
  for(int i = 0; i < num_rects; ++i) {
    float theta = random(TWO_PI);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color c = img.get(x,y);
    fill(c, opacity);
    pushMatrix();
      translate(x,y);
      rotate(theta);
      rect( -radius/2.0, -radius/2.0, radius, radius );
    popMatrix();
    
  }
}
 
 void mouseClicked(){
setup();
}

