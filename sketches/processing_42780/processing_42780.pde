
PImage teiera1;
PImage tazza1;
PImage teiera2;
PImage tazza2;

int a=30;


void setup() {
  size(400, 400);

  teiera1 = loadImage("teiera1.png");
  tazza1= loadImage("tazza1.png");
  teiera2 = loadImage("teiera2.png");
  tazza2 = loadImage("tazza2.png");
}

void draw() {
  image(teiera1, 0, 0);
  image(tazza1, 0, 200);
  image (teiera2, 200, 0);
  image(tazza2, 200, 200);
 
  //immagine in alto a sx

  if (mouseX < width/2 && mouseX>0) {
    if (mouseY < height/2 && mouseY >0) {
      for (int i=0; i<width/2; i= i+1) {
        color c =teiera1.get(mouseY, i);
        noStroke();
        fill(c);
        ellipse (i, mouseY, 25, 25);
      }
    }
  }

  //imaggine in basso a sx--cambia tinta

  if (mouseX < width/2 && mouseX>0) {
    if (mouseY > height/2 && mouseY <height) {
      tint(255, 0, 0, 50);
    }
  }
  else {
    noTint();
  }

  //immagine in alto a dx--inverte i colori

  if (mouseX> width/2 && mouseX<width) {
    if (mouseY > 0 && mouseY < height/2) {
      filter(INVERT);
    }
  }
  //immagine in basso a dx--zoom quadrato

  if (mouseX > width/2 && mouseX<width) {
    if (mouseY >height/2 && mouseY < height) {

      noStroke();
      copy(mouseX, mouseY, 40, 40, mouseX, mouseY, 2*a, 2*a);
    }
  }
}


