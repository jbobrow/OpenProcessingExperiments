
PImage pati;
PImage pati2;

void setup(){
  size(1000,1000);
  pati = loadImage("Corbis-42-28845927.jpg");
  pati2 = loadImage("Corbis-42-29056614.jpg");
  noStroke();
  image(pati2, 0, 0, width, height);
}

void draw(){
  image(pati2,mouseX,mouseY, 530,350);
}

void mouseDragged(){
  rect(mouseX,mouseY,50,50);
}

