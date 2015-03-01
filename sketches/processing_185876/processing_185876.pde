
float bola = 1;
void setup () {
  size(800, 800);
}

void draw( ) {
  bola = bola+1;
  if (mouseY<height/2) {
    if (mouseX<height/2) {
      background(0);
    } 
    else {
      background (22,180,179);
    }

    ellipse(bola, 300, 10, 70);
    if (bola >70) {
      ellipse(bola, 310, 10, 30);
    }
    if (bola >50) {
      ellipse(bola, 320, 10, 10);
    }
    if (bola >70) {
      ellipse(bola, 330, 10, 10);
    }
    if (bola >90) {
      ellipse(bola, 330, 10, 10);
    }
    if (bola >110) {
      ellipse(bola, 340, 10, 10);
    }
    if (bola >120) {
      ellipse(bola, 350, 10, 10);
    }
    if (bola >130) {
      ellipse(bola, 360, 10, 10);
    }
    if (bola >140) {
      ellipse(bola, 370, 10, 10);
    }
    if (bola >150) {
      ellipse(bola, 380, 10, 10);
    }
    if (bola >160) {
      ellipse(bola, 390, 10, 10);
    }
    if (bola >170) {
      ellipse(bola, 400, 10, 10);
    }
    if (bola >180) {
      ellipse(bola, 410, 10, 10);
    }
    if (bola >190) {
      ellipse(bola, 420, 10, 10);
    }
    if (bola >200) {
      ellipse(bola, 430, 10, 10);
    }
    if (bola >210) {
      ellipse(bola, 440, 10, 10);
    }
    fill(143, 330, 67);
    if (bola >220) {
      ellipse(bola, 450, 10, 10);
    }
    if (bola >230) {
      ellipse(bola, 410, 10, 10);
    }
    if (bola >240) {
      ellipse(bola, 420, 10, 10);
    }
    if (bola >250) {
      ellipse(bola, 430, 670, 10);
    }
    if (bola >260) {
      ellipse(bola, 440, 120, 140);
    }
    if (bola >280) {
      ellipse(bola, 450, 500, 100);
    }
    if (bola >290) {
      ellipse(bola, 450, 10, 60);
    }
    if (bola >300) {
      ellipse(bola, 410, 10, 400);
    }
    if (bola >400) {
      ellipse(bola, 420, 10, 10);
    }
    if (bola >500) {
      ellipse(bola, 430, 10, 10);
    }
    if (bola >600) {
      ellipse(bola, 440, 10, 10);
    }
    if (bola >700) {
      ellipse(bola, 450, 100, 100);
    }
  }
}

