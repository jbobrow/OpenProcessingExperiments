
PImage img;
float posX, posY, velX, velY;
float mida = 10;

void setup() {
  size(800, 554);
  img = loadImage("Pinball.jpg");
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
}

void draw() {
  image(img, 0, 0);

  posX = posX+velX;
  posY = posY+velY;

  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  ellipse(120, 39, 10, 10);
  ellipse(207, 113, 10, 10);
  ellipse(233, 152, 10, 10);
  ellipse(262, 103, 10, 10);
  ellipse(234, 534, 15, 15);

  fill(random(255), random(255), random(255), 50);
  stroke(random(255), random(255), random(255), 50);
  rect(528, 16, 253, 227);

  fill(0);
  stroke(255);
  ellipse(posX, posY, mida, mida);

  if ((posX<45)||(posX>width/2)) {
    velX = -velX;
  }

  if ((posY<25)||(posY>height-50)) {
    velY = -velY;
  }
}

void mouseDragged() {
  if ((mouseX>45) && (mouseX<width/2) && (mouseY>25) && (mouseY<height-50)) {
    posX = mouseX;
    posY = mouseY;
    velX = 0;
    velY = 0;
  }
}

void mouseReleased() {
  if ((mouseX>45) && (mouseX<width/2) && (mouseY>25) && (mouseY<height-50)) {
    posX = mouseX;
    posY = mouseY;

    velX = pmouseX-mouseX;
    velY = pmouseY-mouseY;
    velX = -velX;
    velY = -velY;
    fill(random(255));
  } else {
  }
}



