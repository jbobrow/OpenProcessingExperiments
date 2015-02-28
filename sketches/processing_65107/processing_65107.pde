
PImage left_foot; 
PImage right_foot;
  
void setup() {
  size(600, 600);
  left_foot = loadImage("left_foot.png");
  right_foot = loadImage("right_foot.png");
  frameRate(3);
  imageMode(CENTER);
}
  
void draw() {
  background(255);
  float x = random(width);
  float y = random(height);

  image(left_foot, x/2, y, 180, 377);
  
  image(right_foot,x,y, 180, 377);
}


