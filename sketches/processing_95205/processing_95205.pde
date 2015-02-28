
int numFrames = 5;
int frame = 0;
PImage[] images = new PImage[numFrames];

//button
int rectX, rectY;
int rectLength = 320;
int rectHeight = 120;
boolean rectOver = false;

void setup() {
  size(255, 320);
  frameRate(4);
  images[0] = loadImage("sleep1.jpg");
  images[1] = loadImage("sleep2.jpg");
  images[2] = loadImage("sleep3.jpg");
  images[3] = loadImage("sleep4.jpg");
  images[4] = loadImage("sleep5.jpg");
  
  //button
  rectX = 0;
  rectY = 200;
}

void draw() {
  //button 
  update(mouseX, mouseY);
  rect(rectX, rectY, rectLength, rectHeight);
  fill(255);
  stroke (1);
  
  frame++;
  if(frame == numFrames) {
    frame = 0;
  }
  image(images[frame], 0, 0);
}

void update(int x, int y) {
  if (overRect(rectX, rectY, rectLength, rectHeight)) {
    rectOver = true;
  }
}

void mousePressed() {
 if (rectOver) {int frame = int(random(0, numFrames));
 image(images[frame], 0, 0);
 frameRate(4);
}
}

void mouseReleased() {
  if(rectOver = true) {
    rectOver = false;
  }
}
    
boolean overRect(int x, int y, int rectLenght, int rectHeight)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


