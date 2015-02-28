
int counter = 0;
PImage img;
PImage bg;
PImage [] images = new PImage [10];
void setup()
{
size(550, 550);
smooth();
    images[0] = loadImage ("lips.jpg");
    images[1] = loadImage ("lips1.jpg");
    images[2] = loadImage ("lips2.jpg");
    images[3] = loadImage ("lips3.jpg");
    img = loadImage("lipbalm2.png");
    noStroke();
}

void mousePressed() {
  if((mouseX > 200 && mouseX < 300 ) && (mouseY  > 200 && mouseY < 300)&&(counter < 9)){
    counter++;
  }
  else {
    counter=0;
  }
}

void draw () {
imageMode(CENTER);
  image(images[counter],275,275);
    imageMode(CORNER);
  image(img, mouseX, mouseY, 182, 237);
  noStroke();
  
}


