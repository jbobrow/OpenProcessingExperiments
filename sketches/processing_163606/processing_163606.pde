
float max_distance;
PImage photo;
PImage photo2;

void setup() {
  size(600, 600); 
  smooth();
  noStroke();
  max_distance = dist(0, 0, width, height);
  photo = loadImage("http://www.designzzz.com/wp-content/uploads/2010/02/nature_stars_II_by_tangleduptight.jpg");
  photo2 = loadImage("http://www.tabletmix.com/files/Abstract-Nature-iPad-2-Wallpaper-01-600x600.jpg");
  
}

void draw() 
{
  //background(51);

image(photo, 0, 0);

  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= width; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 66;
      image(photo2, i, j, size, size);
      //ellipse(i, j,size, size);
    }
  }
}
