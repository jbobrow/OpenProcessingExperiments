
void setup () {
  size(750, 500);
  background(255);
  noStroke();
  fill(0, 255, 0);
  rect(0, 375, width, 125);
}

void draw () {
  noStroke();
  if (mouseY> width/2) {
    fill(0, 0, 128);
    rect(0, 0, width, 375);
    fill(192, 192, 192);
    rect(250, 125, 250, 250);
    fill(128, 128, 128);
    ellipse(25, 25, 125, 125);
  } else {
    fill(0, 128, 255);
    rect(0, 0, width, 375);
    fill(255, 255, 255);
    rect(250, 125, 250, 250);
    fill(255, 255, 128);
    ellipse(25, 25, 125, 125);
  }
  
  strokeWeight(1);
  if (mouseY>width/2) {
    fill(64, 0, 0);
    rect(275, 275, 50, 100);
  } else {
    fill(128, 0, 0);
    rect(275, 275, 50, 100);
  }
  
  if (mouseY>width/2) {
    fill(0, 128, 128, 128);
    rect(300, 175, 50, 50);
  } else {
    fill(0, 255, 255, 128);
    rect(300, 175, 50, 50);
  }
  
  if (mouseY>width/2) {
    fill(0, 128, 128, 128);
    rect(400, 175, 50, 50);
  } else {
    fill(0, 255, 255, 128);
    rect(400, 175, 50, 50);
  }
  
  if (mouseY>width/2) {
    fill(0, 128, 128, 128);
    rect(355, 285, 110, 50);
  } else {
    fill(0, 255, 255, 128);
    rect(355, 285, 110, 50);
  }

  noStroke();
  for (int y=400; y<450; y+=30)
  {
    fill (255, 155);
    rect(y, 285, 4.5, 50);
    fill(255, 155);
    rect(y-37, 285, 1, 50);
  }
  
  for (int z=315; z<320; z+=7)
  {
    fill (255, 155);
    rect(z, 175, 3.5, 50);
    fill(255, 155);
    rect(z-14, 175, 1, 50);
    rect(z+28, 175, 0.5, 50);
  }
  
  for (int z=415; z<425; z+=14)
  {
    fill (255, 155);
    rect(z, 175, 3.5, 50);
    fill(255, 155);
    rect(z-14, 175, 1, 50);
    rect(z+28, 175, 0.5, 50);
  }
  
  if (mouseY>width/2) {
    fill(96);
    ellipse(280, 322, 5, 5);
  } else {
    fill(192);
    ellipse(280, 322, 5, 5);
  }
  
  fill(255, 170);
  ellipse(375, 50, 325, 50);
  ellipse(475, 75, 225, 50);
}
