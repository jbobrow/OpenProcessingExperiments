
class Area {
  float widthX = 35.7;
  float heightY = 41.6;
  float xPosition, yPosition;
  int id;
  boolean active;

  Area(int i, float xpos, float ypos) {
    id = i;
    xPosition = xpos;
    yPosition = ypos;
  }

  void update() {
    if(dist(xPosition, yPosition, mouseX, mouseY) < 20) {
      //fill(0);
      counter = id;
      active = true;
    }
    else {
      //fill(255);
      active = false;
    }
    //rect(xPosition, yPosition, widthX, heightY);
  }

}
int imageCount = 112;
float x = 35.7;
float y = 41.6;
int counter, prevCounter;

PImage[] picture = new PImage[imageCount];
Area[] area = new Area[imageCount];

void setup() {
  size(500, 333);
  rectMode(CENTER);

  for (int i=0; i<imageCount; i++) {
    float a = (i % floor(width/x)) * x + x/2;
    float b = (i / floor(width/x)) * y + y/2;
    area[i] = new Area(i, a, b);
  }

  counter = 63;
}

void draw() {

  for (int i = 0; i < area.length; i++) {
    area[i].update();
  }

  if (counter != prevCounter) {
    if (picture[counter] != null) {
      image(picture[counter], 0, 0);
    }
    else {
      picture[counter] = loadImage(counter + ".jpg");
      image(picture[counter], 0, 0);
    }
  }
  prevCounter = counter;
}




