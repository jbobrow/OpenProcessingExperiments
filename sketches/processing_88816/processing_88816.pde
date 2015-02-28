
PImage fox;
PImage field;

void setup() {
  size(480, 480);
  fox = loadImage("foxy.png");
  field = loadImage("field.jpg");
   frameRate(2);
  imageMode(CENTER);
}

  
void draw() {
  background(0);
   
  image(fox, mouseX, mouseY, 500, 500);
  image(field, 0, 0, 1000, 1000);
   
  float x = random(200, width-100);
  float y = random(200, height-100);
  float c = random(200, 200);
  float d = random(220, 220);
  
  image(fox, x, y, c, d);

   
   
}


