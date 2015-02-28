
PImage banana;



void setup() {
  size(640, 480);
  smooth();
  noCursor(); //hides curser
  banana=loadImage("banana.gif"); //way to reference file
  ice=loadImage("ice.jpg"); //way to reference file

  frameRate(1);

}

void draw(){

image(banana,0,0);
float x = random(width/2);
float y = random(height/2);
float d = random(300,200);
image(banana, x+10, y-60, d,d);

}




