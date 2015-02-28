
String cat = "vuffalo";
String[] words = {"cat", "true", "man", "hotdog sammy" };
int counter = 0;
float angle = 0;
int x = 0;
int speed = 2;
int opacity = 0;
int opacitySpeed = 1;

void setup()
{
  size(200,200);
  textFont(createFont("Times New Roman",64));

}

void draw()
{
  counter = counter + 1;
  
  if (x > 200 - (textWidth("wheel") / 2)) {
   speed = -2;
}
  if (x < 0 + (textWidth("wheel") / 2)) {
   speed = 2;
  }
  
  x = x + speed;
angle += 0.1;
  background(255);
  String t = "Hello";
  float tw = textWidth("wheel");
  opacity = opacity + opacitySpeed;
  
  if (opacity >= 255) {
      opacitySpeed = -1;
  }
  if (opacity <= 0) {
      opacitySpeed = 1;
  }
  
  
  pushMatrix();
  fill(random(255), random(255), random(255), opacity);
  translate(x, 100);
  //rotate(angle);
  textAlign(CENTER);
  //textSize(counter);
  text("wheel", 0, 0);
  popMatrix();
}

void mouseReleased() {
    if (mouseButton == LEFT) {
        println("cat");
    }
    
}
