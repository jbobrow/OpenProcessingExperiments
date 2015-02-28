
color palette[] = {
  #AB1386, #FE1F5E, #FD9251, #D4E325, #15BDA3
};
color black = #000000;

int randomX;
int randomY;
int alpha;
int randomH;
int randomW;
int triangle;

int pNum = 0;
color activeColor = palette[pNum];

int maxSize = 100;
int minSize = 10;
int shapeSize = minSize;
boolean upSize = true;

int maxWeight = 5;
int minWeight = 1;
int weight = minWeight;

float rotation = 0;

boolean line = true;


void setup() {
  size(800, 600);
  background(black);
}

void draw() {

  if (mousePressed) {   
    stroke(255, alpha);
    strokeWeight(random(0, 4));
    line(400, 300, mouseX, mouseY);

    alpha = int(random(10, 90));

    pushMatrix();
    translate(width - mouseX, height - mouseY);

    stroke(activeColor);
    strokeWeight(weight);
    noFill();
    rectMode(CENTER);
    popMatrix();

    pushMatrix();
    translate(mouseX, mouseY);
    rotate(rotation);

    if (line) {
      line(0, 0, shapeSize, shapeSize);
    } 
    popMatrix();
  }

  rotation = (rotation + 0.1) % 360;

  if (upSize) {
    shapeSize += 2;
    if (shapeSize == maxSize) {
      upSize = false;
    }
  }
  else {
    shapeSize -= 2;
    if (shapeSize == minSize) {
      upSize = true;
    }
  }
}

void keyPressed() {
  line = true;
  print("2:" + line);

  if (keyCode == RIGHT && pNum < 4) {
    pNum += 1;
    activeColor = palette[pNum];
  }
  if (keyCode == LEFT && pNum > 0) {
    pNum -= 1;
    activeColor = palette[pNum];
    print(pNum);
  }
  if (key == DELETE || key == BACKSPACE) {  
    background(0);
  }
  if (key == 's') { 
    saveFrame("Screenshot-####.tif");
    println("Frame saved");
  }
}



