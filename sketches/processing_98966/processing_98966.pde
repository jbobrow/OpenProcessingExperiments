
PImage tree;
PImage duck;
float x;
float y;
float w  = random(641);
float l = random(541);
float h = random(441);
float o = random(331);
float e = random(221);
float fat;
float tall;
float speed = 2.5;
float t = random(5)+1.5;
float s = random(4)+4;
float u = random(621)+random(21);
float v = random(521)+random(121);
float z = random(421)+random(221);
float a = random(341)+random(321);
float b = random(221)+random(421);
float c = random(121)+random(521);
float d = random(21)+random(621);

void setup() 
{
  size(640, 640);
  tree = loadImage("tree clear.png");
  duck = loadImage("ducky clear.png");
  fat = duck.width/s;
  tall = duck.height/s;
}

void draw() 
{
   background(255);
  move();
  addDuck();
  addDuckW();
   plant();
   crosshair();
   mouseIsCloseToDuck();
   
}

void crosshair() {

    if (mousePressed) 
  {
   x = x + 255;
  }
   else              
  {
   x = 0;
  }
  
  stroke(x, 0, 0);
  line(mouseX, 0, mouseX, 640);
  line(0, mouseY, 640, mouseY);
  noFill();
  stroke(x, 0, 0);
  ellipse(mouseX, mouseY, 30, 30);
  ellipse(mouseX, mouseY, 60, 60);
}

void addDuck()
  {
      
      image(duck, h, y, fat, tall);
      image(duck, o, y, fat, tall);
      image(duck, l, y, fat, tall);
      image(duck, e, y, fat, tall);
      loop();  
  }
void addDuckW()
{
  float v2 = 255;
  float SHOT = abs(w - mouseX);
  float BANG = abs(y - mouseY);
  image(duck, w, y, fat, tall);
  loop();
  
  if (SHOT < fat && BANG < tall && mousePressed)
  {
   background(v2, 0, 0);
  }
}
  
  
boolean mouseIsCloseToDuck()
{
  boolean toReturn = false;
  float diffX = abs(w - mouseX);
  float diffY = abs(y - mouseY);
  if (diffX < fat && diffY < tall && mousePressed)
  {
    fill (255, 0, 0);
    ellipse(mouseX,mouseY,20,20);
    speed = 0;
    toReturn = true;
  }
  return toReturn;
}

void move() {
y = y + speed;
if (y > height) {
  y = 0;
}
}

void plant() {
  image(tree, u, a, tree.width/t, tree.height/t);
  image(tree, b, u, tree.width/t, tree.height/t);
  image(tree, u, c, tree.width/t, tree.height/t);
  image(tree, d, u, tree.width/t, tree.height/t);
  image(tree, u, u, tree.width/t, tree.height/t);
  image(tree, a, v, tree.width/t, tree.height/t);
  image(tree, v, b, tree.width/t, tree.height/t);
  image(tree, c, v, tree.width/t, tree.height/t);
  image(tree, v, d, tree.width/t, tree.height/t);
  image(tree, v, v, tree.width/t, tree.height/t);
  image(tree, z, a, tree.width/t, tree.height/t);
  image(tree, b, z, tree.width/t, tree.height/t);
  image(tree, z, c, tree.width/t, tree.height/t);
  image(tree, d, z, tree.width/t, tree.height/t);
  image(tree, z, z, tree.width/t, tree.height/t);
}




