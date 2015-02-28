
void setup() {
  size(700, 700);
  background(255);
  translate(width/2, height/2);
  noStroke(); 
  fill(255, 0, 0);
  ellipse(0, 0, 50, 50);
  fill(255, 255, 0);
  ellipse(0, 0, 25, 25);
  fill(0, 0, 255);
  ellipse(0, 0, 12.5, 12.5);

  //cicle 6
  float theta = 0.0;
  float radius = 300;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 100, 100);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 300;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 100, 100);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 300;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 300;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 300;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 25, 25);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 300;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 25, 25);
    popMatrix();
    theta += TWO_PI/12;
  }
  //cicle 5
  theta = 0.0;
  radius = 250;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 80, 80);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 250;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 80, 80);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 250;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 250;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 250;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 25, 25);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 250;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 25, 25);
    popMatrix();
    theta += TWO_PI/12;
  }
  //cicle 4
  theta = 0.0;
  radius = 200;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 80, 80);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 200;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 80, 80);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 200;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 200;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 200;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 25, 25);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 200;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 25, 25);
    popMatrix();
    theta += TWO_PI/12;
  }
  //cicle 3
  theta = 0.0;
  radius = 150;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 80, 80);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 150;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 80, 80);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 150;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 150;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 150;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 25, 25);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 150;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 25, 25);
    popMatrix();
    theta += TWO_PI/12;
  }
  //cicle 2
  theta = 0.0;
  radius = 100;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 80, 80);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 100;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 80, 80);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 100;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 100;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 100;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 25, 25);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 100;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 25, 25);
    popMatrix();
    theta += TWO_PI/12;
  }
  //circle 1
  theta = 0.0;
  radius = 50;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 50;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 50;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 35, 35);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 50;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(0, 0, 255);
    ellipse(0, 0, 35, 35);
    popMatrix();
    theta += TWO_PI/12;
  }
  theta = 0.0;
  radius = 50;
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 22.5, 22.5);
    popMatrix(); 
    theta += TWO_PI/12;
  }
  theta = 50.0;
  radius = 50;
  for (int i= 0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(255, 0, 0);
    ellipse(0, 0, 22.5, 22.5);
    popMatrix();
    theta += TWO_PI/12;
  }
}


