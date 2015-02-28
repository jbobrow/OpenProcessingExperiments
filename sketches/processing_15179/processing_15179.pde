
PImage boy;
PImage boy2;
PImage girl;
PImage girl2;;
PImage space;
PImage apple;
PImage orange;
PImage cherry;
PImage bannana;

void setup() {
  size(792,792);
  boy = loadImage("boy1.png");
  boy2 = loadImage("boy2.png");
  space = loadImage("space.png");

  girl = loadImage("girl1.png");
  girl2 = loadImage("girl2.png");
  apple = loadImage("apple.png");
  orange = loadImage("orange.png");
  cherry = loadImage("cherry.png");
  bannana = loadImage("ban.png");
}

void draw() {
    background (space);
 image(boy, 0, 0);
 image(boy2, 300, 20);
 image(girl, -200, 20);
 image(girl2, 400, 20);
 image(orange, 80, 60);
  image(apple, 60, 60);
 image(girl2, 550, 20);
 image(girl2, -140, 370);
 image(boy, -50, 370);
 image(boy, 60, 370);
 image(girl, 300, 370);
 image(boy, 500, 370);
 image(cherry, 300,550);
 image(bannana, 400,500);
 //image(bannana, mouseX, mouseY);

if(key == 'a'){
  image(apple, mouseX, mouseY);
}else if(key =='o')
  image(orange, mouseX, mouseY);
if(key == 'b'){
  image(bannana, mouseX, mouseY);
}else if(key =='c')
  image(cherry, mouseX, mouseY);
if (key == 'm'){
  image(boy, mouseX, mouseY);
}else if (key == 'w'){
  image (girl, mouseX, mouseY);
}
}

