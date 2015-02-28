
void setup() {
  size(700,400);
  smooth();
}
int p = 0;
int x = frameCount + 3;
int q = 0;
void draw() {
  int rep = 100;
  float rot = .7;
  fill(255,170,3,20);
  background(0);
  noStroke();
  int x = 0;
  for (int i = 0; i < rep; i = i+1) {

    pushMatrix();
    translate(width/2, 0);
    ellipse(0,i*4,i*3,i);
    popMatrix();
    pushMatrix();
    translate(width, 0);
    rotate(rot);
    ellipse(0,i*5,i*3,i);
    popMatrix();
    pushMatrix();
    rotate(-rot);
    ellipse(0,i*5,i*3,i);
    popMatrix();
  }
  int m = 0;

  for (int i = 1; i <rep; i = i+10) {
    pushMatrix();
    translate(width/2, 0);
    noStroke();

    fill(245,(m+10)*5,q,70);
    ellipse(0,400,200-5*m,200-5*m);

    m= m+1;
    popMatrix();
  }
  noFill();
  strokeWeight(p);
  if (p < 2) {
    noStroke();
  }
  else {
    stroke(0);
  }

  ellipse(350,400,210,210);
} 

void mousePressed() {
  if ((p<5)&&(mouseX>250)&&(mouseX<450)&&(mouseY>300)&&(mouseY<400)) {
    p=5;
    int z = frameCount;
    if ((x < z)||(q > 254)) {
      x = frameCount +3;
      q = 38;
    }
    else {
      x = frameCount +3;
      q = 255;
    }
  }
  else if(p>4) {
    p=0;
    int z = frameCount;
    if ((x < z)||(q > 254)) {
      x = frameCount +3;
      q = 38;
    }
    else {
      x = frameCount +3;
      q = 255;
    }
  }




  println(frameCount);
}


