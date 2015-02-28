
PImage img, img2;
float min_shape, max_shape;


void setup()
{

  img = loadImage("corner2foreground.png");
  img2 = loadImage("corner2.png");
  size(363,487);
  background(img2);
  noStroke();
  smooth();
  min_shape = 1.5;
  max_shape = width/10.0;
}
 
void draw()
{
  float radius = map(mouseY, 0, width, max_shape, min_shape);
  int opacity = int(map(mouseY, 0, height, 0, 255));

  int num_rects = round((5*max_shape*max_shape)/(radius*radius));
  for(int i = 0; i < num_rects; ++i) {
    int x = int(random(img.width));
    int y = int(random(img.height));
    color c = img.get(x,y);
    fill(c, opacity);
    pushMatrix();
      translate(x,y);
      ellipse( -radius/2.0, -radius/2.0, radius, radius );
    popMatrix();
    
  }
}
 
 void mouseClicked(){
setup();
}

