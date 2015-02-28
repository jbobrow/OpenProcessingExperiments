
//used a sketch from processing, they had an image of a cat so I 
//replaced it with my own picture of my horse. Then I grabbed another
//sketch from processing using text over a blank background saying
//Merry Christmas and I changed it to "neigh" when you hold down the
//mouse it turns white so it is easier to see
PImage img;
float min_radius, max_radius;

void setup()
{
  img = loadImage("diamond1.jpg");
  //size(img.width,img.height,P2D);
  size(700,470,P2D);
  background(255);
  noStroke();
  smooth();
  min_radius = 2.0;
  max_radius = width/15.0;
}

void draw()
{
  float radius = map(mouseX, 0, width, min_radius, max_radius);
  int opacity = int(map(mouseY, 0, height, 0, 255));
  //Ensure nearly-constant area is drawn each time
  int num_rects = round((5*max_radius*max_radius)/(radius*radius));
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
  {

  if (mousePressed)

    fill(255);

  textSize(24);
  text("neigh", mouseX+width/random(1, 8), mouseY+height/random(3, 7));
}
}
  


