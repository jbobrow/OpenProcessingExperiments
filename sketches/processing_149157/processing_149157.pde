
PImage bird;
PImage tree;
PImage pig;
PImage bluebird;

void setup()
{
  frameRate(3);
  background(100,180,255);
  size(700,500);
  bird = loadImage("angry-bird-icon.png");
  tree = loadImage("Forest_Tree_PNG_Clipart.png");
  pig = loadImage("pig.gif");
  bluebird = loadImage("angry-bird-blue-icon.png");
}
void draw()
{
  fill(100,180,255, 200);  //background color for fade effect
  rect(0,0,width,height);  //rect for fade effect
  
image(tree, 50,200, 270,300);  //tree for background
image(tree, 400,160, 290,340);  //tree for background

image(pig, random(700),445, 70,70);  //pig and pig movement
  image(pig, random(700),445, 70,70);  //pig and pig movement
 // image(pig, random(700),445, 70,70);  //pig and pig movement
  
   image(bird,mouseX,mouseY,70,70);  //red angry bird
  
  fill(255,0,0,200);
  //image(woodmallet, mouseX,mouseY, 60,60);
}

void mouseClicked() {
  if(mouseY==435) {
  mouseY=255;
} else {
  mouseY=435;
}
 // if(mouseX==635) {
 //   mouseX=255;
 // } else {
   // mouseX=635;
 /// }
}




