
ClassWayne wayne1, wayne2, wayne3;


void setup(){
size(1000,1000);

wayne1 = new ClassWayne(20,40,80);
wayne2 = new ClassWayne(300,120,160);
wayne3 = new ClassWayne(500,300, 80);



}
void draw(){
  background(90);
  
  wayne1.hat();
  wayne1.moveMouth();
  wayne1.display();
  wayne2.hat();
  wayne2.moveMouth();
  wayne2.display();
  wayne3.hat();
  wayne3.moveMouth();
  wayne3.display();
  wayne1.grass();
  
}
class ClassWayne {
  int p = 50; //pupil
  int w = 255; // white
  int b = 0; //black
  int h = 145; // start of hat height
  int g = height; // grass
  int m; //80
  float x;
  float y;

  ClassWayne(float tempX, float tempY, int tempM) {
    x = tempX;
    y = tempY;
    m = tempM;
  }

  void moveMouth() {
    if (m < 130) {
      m  = m + 1;
    }
    if (m >= 130) {
      m = - m - 1;
    }
  }

  void grass() {
    

    // grows grass
    if (keyPressed == true) {
      g = g - 1;
    }
    // grass shrinks
    else {
      g = g + 1;
      if (g >= height) {
        g = height;
      }
    }
    //Draw Grass
    for (int x = 0; x<= width; x += 10) {
      strokeWeight(5);
      stroke(0, 128, 0);
      line(x, height, x, g);
      noStroke();
    }
  }
  void hat() {
    if (mousePressed == true) {
        h = h - 1;
    }
    //else{      lowers hat BUT DOESNT STOP
    //  h = h+1;
    // }
  }
  void display() {
    pushMatrix();
    translate(x, y);
    stroke(0, 0, 0);
    strokeWeight(1);
    //Body and fill(picks random colors)
    fill(50, 130, 20);
    ellipse(300, 300, 200, 250);

    //Mouth and fill(black)
    fill(b, b, b);
    ellipse(300, 320, m, 50);

    //Eyes and fill(white)
    fill(255, 255, 255);
    ellipse(277, 250, 40, 60);
    ellipse(317, 250, 40, 60);

    //Pupils and fill(random)
    fill(random(p), random(p), random(p), random(p));
    ellipse(277, 258, 30, 35);
    ellipse(317, 258, 30, 35);

    //pot and fill(brown)
    fill(160, 82, 45);
    quad(200, 395, 400, 395, 360, 550, 240, 550);
    noFill();

    //Hat and fill (black)
    rectMode(CORNERS);  
    fill(0, 0, 0);
    rect(245, 165, 355, h);
    rectMode(CORNER);
    rect(200, 180, 200, 20);
    noFill();

    //Stripe and fill(red)
    fill(0, 0, 205);
    rect(245, 165, 110, 15);
    noFill();
    popMatrix();
  }
}



