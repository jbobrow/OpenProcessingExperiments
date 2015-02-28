
PImage goya;


int a=30;
void setup() {
  size(600, 450);

  goya = loadImage ("goya.jpg");
 
}

void draw() {
 image(goya, 0, 0);

noTint();
  //left-down image
  if (mouseX < width/2 && mouseX>0) {
    if (mouseY > height/2 && mouseY <height) {
      tint(255, 0, 0, 50);
    }
  }
  else {
  }
  

  //right-down image
  if (mouseX > width/2 && mouseX < width) {
    if (mouseY > height/2 && mouseY <height) {
      tint(0, 250, 0, 50);
    }
  }
  else {
  }
  
    

  //right-up image
  if (mouseX > width/2) {
    if (mouseY > 0 && mouseY < height/2) {
      tint(0, 0, 250, 50);
    }
  }
  else {
  }

  //left-up image
  if (mouseX< width/2) {
    if (mouseY > 0 && mouseY < height/2) {
      tint(200, 100, 250, 50);
    }
  }
  else {
  }
}


