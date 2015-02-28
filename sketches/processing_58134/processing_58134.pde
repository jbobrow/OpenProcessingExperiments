
// Created by Woon Hyun Bae and Yeung Shin
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University

// Projecting a Recursive Urban Fabric: for Hong Kong's Shrinking Harbor

float theta, h;
int count;
void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  float a = map (width, 0, width, 0, 30);
  theta = radians(a*-.15);

  fill(255, 13);
  noStroke();
  rect(0, 0, width, height);
  pushMatrix() ;
  rotate(PI);
  translate (-mouseX/10, -mouseY/2.25);
  translate(-250, height/135);//position
  translate(590, -height);//position
  branch (160);
  popMatrix() ;

  rotate(PI+1.35);
  translate (mouseY/6.5, -mouseY/2.05);
  stroke(0);
  float b = map (width, 0, width, 0, 30);
  theta = radians(b*.6);
  translate(width/75, height/1);//position
  translate(80, -height/4);//position
  branch (160);
}
void branch (float h) {
  for (float i = h; i>2; i *= map (mouseY/5, 0, height, .95, .5)) { //no of blocks
    int a = 60; //street interval
    int Fstart = 50;
    float x = h+15; //start

    h= map (mouseY, 0, height, 50, 50);

    float m = .5;//rect strokeweight
    float n = 220;//rect stroke

    int w = 30; //block width
    rotate(theta);

    translate (-h-10, 0);
    noStroke();
    fill(0, 90, 120, 50);
    //rect(h+=5, random(x-8*a, x+4*a), .7, 40);  //markers - long
    rect(10, random(x+2*a, x+4*a), 30, 10);  //markers - short

    strokeWeight(m);
    stroke (n);
    float c = map (mouseY, height/10, height, 0, 255);

    fill(Fstart, c);
    rect(10, x, w, 20); 
    rect(10, x+a, w, 20);
    rect(10, x+2*a, w, 20);
    rect(10, x+3*a, w, 20);//building blocks

    fill(Fstart);
    rect(10, x-a, w, 20); 
    rect(10, x-2*a, w, 20);
    rect(10, x-3*a, w, 20);
    rect(10, x-4*a, w, 20);
    rect(10, x-5*a, w, 20);
    rect(10, x-6*a, w, 20);
    rect(10, x-7*a, w, 20);
    rect(10, x-8*a, w, 20);//building blocks

    translate (-h, 0);
    noStroke();
    fill(200, 200);
    rect(5, random(x+2*a, x+4*a), 30, 10);  //markers - short

    strokeWeight(m);
    stroke (n);
    float d = map (mouseY, height/5, height, 0, 220);
    float f2 = map (-mouseY, height/2, height, 81, 102);
    fill(Fstart, d);
    rect(5, x, w, 20); 
    rect(5, x+a, w, 20);
    rect(5, x+2*a, w, f2);
    rect(5, x+3*a, w, f2);//building blocks

    noStroke();
    fill(Fstart);
    rect(5, x-a, 30, 20); 
    rect(5, x-2*a, 30, 20);
    rect(5, x-3*a, 30, 20);
    rect(5, x-4*a, 30, 20);
    rect(5, x-5*a, 30, 20);//building blocks

    translate (-h, 0);
    noStroke();
    fill(200, 50, 50, 200);
    rect(0, random(x+2*a, x+4*a), 30, 10);  //markers - short
    fill(250, 50, 50);
    ellipse(random(x-2*a, x+2*a), x+4*a, 20, .9);  //markers - waterfront edge

    strokeWeight(m);
    stroke (n);
    float e = map (mouseY, height/5, height, 150, 220);
    fill(Fstart, e);
    float f = map (-mouseY, height/5, height, 67, 100);

    rect(0, x, w, f); 
    rect(0, x+a, w, f);
    rect(0, x+2*a, w, f);
    rect(0, x+3*a, w, f);//building blocks

    fill(Fstart);
    rect(0, x-a, 30, 20); 
    rect(0, x-2*a, 30, 20);
  }
}


