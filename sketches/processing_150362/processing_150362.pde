
import ddf.minim.*;
Minim minim;
AudioInput input;

float P;

void setup() {


  size(600, 600, P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}
void draw() {
  background(#eeeeee);
  lights();
  ambientLight(255, 3, 3);

  float mic = input.mix.level() * 700;

  P = P*0.8 + mic*0.9;


  for (int i = 100; i < width; i+=100) {
    for (int j = 100; j < width; j+=100) {
      noStroke();
      pushMatrix();
      translate(i, j, -700);
      rotateX(radians(float(mouseX)/3));
      rotateY(radians(P/2));
      box(70, 70, 490);
      popMatrix();
    }
  }

  for (int i =100; i < width; i+=200) {
    pushMatrix();
    translate(i, 650, -300);

    //rotateX(radians(mouseX));
    rotateY(radians(mouseX));
    box(100, 100, 100);
    popMatrix();
  }

  for (int i =100; i < width; i+=200) {
    pushMatrix();
    translate(i, -50, -300);

    //rotateX(radians(mouseX));
    rotateY(radians(mouseX));
    box(70);
    popMatrix();
  }

  for (int i =100; i < width; i+=200) {
    pushMatrix();
    translate(-50, i, -300);

    rotateX(-radians(mouseX));
    //rotateY(radians(mouseX));
    box(100);
    popMatrix();
  }
  for (int i =100; i < width; i+=200) {
    pushMatrix();
    translate(650, i, -300);

    rotateX(-radians(mouseX));
    //rotateY(radians(mouseX));
    box(100, 100, 100);
    popMatrix();
  }
  for (int i = 100; i < width; i+=100) {
    for (int j = 100; j < width; j+=100) {
      noStroke();
      pushMatrix();
      translate(70, 70, 0);
      rotateX(radians(P));
      rotateY(radians(P*2));
      box(50);
      popMatrix();
    }


        noStroke();
        pushMatrix();
        translate(530, 70, 0);
        rotateX(radians(P*2));
        rotateY(radians(P*4));
        box(50);
        popMatrix();
      }
      for (int i = 70; i < width; i+=470) {
    
      noStroke();
        pushMatrix();
        translate(i, 530, 0);
        rotateX(radians(P*4));
        rotateY(radians(P*2));
        box(50);
        popMatrix();
    }
}

