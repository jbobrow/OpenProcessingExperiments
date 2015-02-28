
PImage dog;
PImage dog2;
PImage lion;
PImage lion2;
PImage monkey;
PImage monkey2;

void setup()
{
  size(400,400);
  dog = loadImage ("zebra2.png");
  dog2 = loadImage ("zebra.png");
  lion = loadImage ("lion.png");
  lion2 = loadImage ("lion2.png");
  monkey = loadImage ("monkey.png");
  monkey2 = loadImage ("monkey2.png");
}
void draw()
{
  image (dog,0,0,200,200);
  image (lion,200,200,200,200);
  image (monkey,0,200,200,200);
if(mouseX<200 && mouseY<200) {image(dog2,0,0,200,200);}
if(mouseX>200 && mouseY>200) {image(lion2,200,200,200,200);}
if(mouseX<200 && mouseY>200) {image(monkey2,0,200,200,200);}
}


