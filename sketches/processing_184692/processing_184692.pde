
float cu1;
float cu2;
float cu3;

float alpha;

float s1;
boolean pr = false;

color c1;
color c2;
color c3;

float v1;
float v2;
float v3;
float v31;

int counter = 1;

float posicion1;
float posicion2;
float posicion3;
float posicion31;

void setup() {
  frameRate(90);
  size(600, 600);
  smooth();
  fill(c1);
  background(255);

  posicion1 = 0;
  posicion2 = height;
  posicion3 = width;
  posicion31 = 0;

  s1 = 33;

  v1 = 0.3;
  v2 = -0.5;
  v3 = -0.3;
  v31 = -0.7;
}

void draw () { 
  if (mousePressed) {
    if (pr == false) {
      pr = true;
      cu1 = mouseX/2;
      cu2 = mouseY/2;

      alpha = (cu1+cu2+cu3)/3;

      cu3 = cu1+cu2/4;

      c1 = color(cu1, cu2, cu3, alpha);
      c2 = color(cu2, cu3, cu1, alpha);
      c3 = color(cu3, cu1, cu2, alpha);

      if (posicion1 > width||posicion1 < 0) {
        v1 = v1 * (-1);
      }

      if (posicion2 > height||posicion2 < 0) {
        v2 = v2 * (-1);
      }

      if (posicion3 > width||posicion3 < 0) {
        v3 = v3 * (-1);
      }

      if (posicion31 > height||posicion31 < 0) {
        v31 = v31 * (-1);
      }

      fill(c1);

      posicion1 = posicion1 + v1;
      //noStroke();
      stroke(255);
      strokeWeight(1.75);

      ellipse(posicion1, height/2, s1, cu3);

      fill(c2);

      posicion2 = posicion2 + v2;
      //noStroke();
      ellipse(width/2, posicion2, cu2, s1);

      fill(c3);

      posicion3 = posicion3 + v3;
      posicion31 = posicion31 + v31;
      //noStroke();
      ellipse(posicion3, posicion31, s1, cu1);
    } 
    else {
      pr = false;
    }
  }
}


void mouseClicked() {
  if (counter == 1) {
    s1 = s1+55;
  } 
  else if (counter == 2) {
    s1 = s1+110;
  } 
  else if (counter == 3) {
    s1 = s1*(0.13);
  }
}
void mouseReleased() {
  counter++; // increase the counter
  if (counter == 4) {
    counter = 1;  // loop after 3
  }
  println(counter);
}

