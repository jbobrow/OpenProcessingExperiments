
 
float max_distance;

void setup() {
  size(600, 600); 
  smooth();
  stroke (random (250), random (250), random (250));
  max_distance = dist(0, 0, width, height);
}

void draw() 
{
  background (40, 0,random(30,200), 90);
//i and j are used for x and y
//you can just replace i and j with x and y 
  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      //distance between mouse and circle that will be drawn 
      float size = dist(mouseX, mouseY, i, j);
      //you can put any number for the 66
      //it was size=size/max_distance * 66;
      size = size/3;
      fill(random(30,200),i, j, 90);
      ellipse(i, j, size, size);
    }
  }
}


