

float tileCount = 1;
color circleColor = color(255);
int circleAlpha = 100;
int actRandomSeed = 0;

void setup(){
  size(350, 350);

}

void draw() {
   PImage img;
  img = loadImage("contacts1.png"); 
  image(img, 0, 0);

  translate(120, 110);
  
  smooth();
  fill(147,202,156);
  


  stroke(circleColor, circleAlpha);
  strokeWeight(30);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = 20;
      float posY = 20;

      float shiftX = random(-mouseX, mouseX)/20;
      float shiftY = random(-mouseX, mouseX)/20;

      ellipse(posX+shiftX, posY+shiftY, 50, 50);
    }
  }

}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}







