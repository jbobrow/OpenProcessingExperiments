
PImage img;

void setup() {
  size(800, 500);
  img = loadImage("01.jpg");
  frameRate(1);
  noStroke();
  smooth();
}

void draw() {
  
  tint(55,55);
  image(img,0,0,800,500);

  fill(random(100), random(100), random(100), random(100));
  rect(0, 0, width, height);
  fill(100);
  ellipse(random(50,width), random(50,height),100,100);
  

}


