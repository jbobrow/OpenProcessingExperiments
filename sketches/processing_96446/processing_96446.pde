
float theta = radians(30);

void setup() {
  size(800, 800,P3D);
  background(210,210,210);
}

void draw() {
  background(210,210,210);
  
  noStroke();
  translate(width/2, height-100,0);
  rotateX(radians(((mouseY/(float)height)*180)-90));
  rotateY(radians(((mouseX/(float)height)*180)-90));
  
  textSize(10);
  fill(0);
  text("I  -   C     A     N     T   -  E     S     C     A     P     E",-120,-500);
  
  pushMatrix();
  noFill();
  stroke(255);
  translate(0,-height/2+100,0);
  sphereDetail(10);
  sphere(width/2-90);
  popMatrix();
  
  lights();
  branch(130);
  leaf(130);
}

void leaf(float len) {
  fill(230, 172, 240);
  if (len <= 100) {
    noStroke();
    sphere(4);
  }
}

void branch(float len) {

  organicLine(0,0,0,-len,len/13);
  translate(0, -len,0);

  if (len > 20) { 

    pushMatrix();
    rotate(theta+random(.1, 1)*noise(.2));
    branch(len*.65);
    leaf(len*.65);
    popMatrix();

    pushMatrix();
    rotate(theta+random(-.2, .2));
    branch(len*.75);
    leaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(-.2, .2));
    branch(len*.75);
    leaf(len*.75);
    popMatrix();

    pushMatrix();
    rotate(-theta-random(.1, 1));
    branch(len*.65);
    leaf(len*.65);
    popMatrix();
  }
}


