
//inserting the variables

PImage img;
PImage fish;
PImage fish2;


//setting up the page and loading up images

void setup() {
  img = loadImage("fish.jpg");
  fish = loadImage("littlefish.png");
  fish2 = loadImage("fish.png");
  size(700, 525, P2D);
  image(img, 0, 0);
  noStroke();
  smooth();
  frameRate(60);

}
//the cursor displays the fish
  void draw() {
    cursor(fish, 0, 0);


  }
//once you move your mouse, there will be bubbles that will pop up
void mouseMoved() {
      fill(255, 50);
    ellipse(mouseX, mouseY, random(20), random(20));
    

}



