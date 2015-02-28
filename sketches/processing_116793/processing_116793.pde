

void setup() {

  rectMode(CENTER);

  size(800, 800);
}
//spinning rectangle

void draw() {

  background(255);

  float r= random(5, 255);
  translate(width/2, height/2);
  int howMany= 300;
  for (int i = howMany; i>0; i--) {
    //pushMatrix();
    rotate(PI/howMany);
    stroke(90, 10, 200, 100);
    strokeWeight(2);
    fill(0, 150, 100, 1);
    rect(0, 0, i*5-mouseX, i*3-mouseY);

    // if (mousePressed==true) {} 
    //popMatrix();
  }
}



