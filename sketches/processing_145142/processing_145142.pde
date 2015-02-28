
/* @pjs preload="scream.jpg"; */
PImage i;
void setup(){
  i = loadImage("scream.jpg");
  size(470,599);
}
void draw(){
  image(i,0,0);
  noStroke();
  float x = random(50);
  float y = random(50);
  if (second() % 2 == 0){
    rect(420,549,x,y);
  }
  if (second() % 3 == 0){
    float a = random(255);
    float b = random(255);
    float c = random(255);
    tint(a,b,c);
    image(i,0,0);
  }
  if (second() % 4 == 0){
    ellipse(x,x,y,y);
  }
}


