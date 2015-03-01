
void setup() {
  size(500, 600); 
  background(#E3E0C3);
  noFill();
}

void draw() {

  float s;
  s= random(-1, 1);



  for (int i=1; i<5; i++) {

    strokeWeight(random(3));
    pushMatrix();

    translate(250, 300);
    rotate(frameCount*s);
    stroke( random(150,255), random(150,255),0, 50);
    line(i+s-random(80), i+s-random(80), i+random(20)-s, i+random(20)-s);
    popMatrix();


    pushMatrix();
    translate(250, 100);
    rotate(frameCount*s);
    stroke(random(200), random(100), 0, 50);
    line(i+s-random(80), i+s-random(80), i+random(20)-s, i+random(20)-s);
    popMatrix();

    pushMatrix();
    translate(250, 500);
    rotate(frameCount*s);
    stroke(random(100), random(200), 0, 50);
    line(i+s-random(80), i+s-random(80), i+random(20)-s, i+random(20)-s);
    popMatrix();
  }
}



