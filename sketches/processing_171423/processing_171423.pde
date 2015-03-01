
// Project The last leaf

PImage img;
float x=568, y=100, Nnum1=0, Nnum2=0, strW=10, d=0;
float lx=16.4, ly=2;
boolean sw=false;

void setup() {
  size(600, 600);
  background(255, 255, 222);
  img=loadImage("lastleaf.png");
}

void draw() {
  // draw tree
  if (sw==false) {
    if (strW>0) {
      image(img, 0, 0);
      strokeWeight(strW);
      point(x, y);

      noiseSeed(2);
      randomSeed(10);
      x-=noise(Nnum1);
      y+=noise(Nnum2);
      Nnum1+=0.02;
      Nnum2+=random(-100, 0.01);
      strW-=0.05;
    } else sw=true;
  } else {
    // draw the last leaf

    // if press key 'w': salrang salrang
    if (keyPressed) {
      if (key=='w' || key=='W') {
        background(255, 255, 222);
        image(img, 0, 0);
        x=568;
        y=100;
        for (strW=10; strW>0; strW-=0.05) {
          strokeWeight(strW);
          point(x, y);
          noiseSeed(2);
          randomSeed(10);
          x-=noise(Nnum1);
          y+=noise(Nnum2);
          Nnum1+=0.02;
          Nnum2+=random(-100, 0.01);
        }
      }
    }

    scale(1);
    fill(214, 60, 37);
    pushMatrix();
    translate(x-lx, y-ly);
    beginShape();
    vertex(16.433832, 0.17345478);
    bezierVertex(22.336336, 0.43439588, -23.793833, -2.6926968, 16.433832, 0.17345478);
    bezierVertex(56.66149, 3.0396063, 15.007537, 64.592026, 16.433832, 65.97713);
    bezierVertex(17.860134, 67.362236, -20.402924, 5.3838825, 16.057343, 1.9412671E-4);
    endShape();
    popMatrix();
  }



  // if press key 'space': bye bye
  if (keyPressed) {
    if (key==32) {
      background(255, 255, 222);
      image(img, 0, 0);

      x=568;
      y=100;
      for (strW=10; strW>0; strW-=0.05) {
        strokeWeight(strW);
        point(x, y);
        noiseSeed(2);
        randomSeed(10);
        x-=noise(Nnum1);
        y+=noise(Nnum2);
        Nnum1+=0.02;
        Nnum2+=random(-100, 0.01);
      }

      scale(1);
      fill(214, 60, 37);
      pushMatrix();
      translate(x-lx, y-ly);
      beginShape();
      vertex(16.433832, 0.17345478);
      bezierVertex(22.336336, 0.43439588, -23.793833, -2.6926968, 16.433832, 0.17345478);
      bezierVertex(56.66149, 3.0396063, 15.007537, 64.592026, 16.433832, 65.97713);
      bezierVertex(17.860134, 67.362236, -20.402924, 5.3838825, 16.057343, 1.9412671E-4);
      endShape();
      popMatrix();
      if (ly <= height) {
        lx+=5;
        ly-=10;
      }
    }
  }
}


