
PFont font;
int score = 0;
float time = 0;
PImage img;
PImage bug;
PImage lady;
 
float bugX = 0;
float bugY = 0;
float bugSize = 40;


 
 
void setup() {
  img = loadImage("zapper.jpg");
  font = loadFont("font.vlw");
  bug = loadImage("fly.jpg");
  lady = loadImage("lady bug.jpg");
  textFont(font, 32);
  size(500, 500);
  background(100);
  image(img, 0 ,0);
}

 
void draw() {
  
  time += 0.015;
  
  if (score >= 10) {
    fill(107,163,234);
    text("YOU WIN!!", width / 2, 100);
   
  }
   
   
  if (time > 0.5) {
    image(img, 0 ,0);
    fill(0);
    bugX = random(0, width - bugSize);
    bugY = random(50, height - bugSize);
    image(bug, bugX, bugY, bugSize, bugSize);
    time = -.2;
  }
  

   

   
  
  fill(45,107,185);
   
  text("Score: " + score, 15, 40);
}
 
void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX < (bugX + bugSize)
      && mouseX > bugX
      && mouseY < (bugY + bugSize)
      && mouseY > bugY)
    {
      score++;
    }
    else {

    }
  }
}



