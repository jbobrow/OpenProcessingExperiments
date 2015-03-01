
float time=0;


void setup() {
  size(700, 700, P3D);
  background(5);
  smooth(8);
}


void draw() {
  time+=.03;
  background(5);


  pushMatrix();

  translate(width/2, height/2, -100);

  strokeWeight(2);
  stroke(230);

  for (int i=0; i<30; i+=10) {
    noFill();
    pushMatrix();
    strokeWeight(1.4);
    rotateX(sin(time-radians(i))-1.3*PI*i/100);
    rotateY(cos(time-radians(i))-1.3*PI*i/100);
    stroke(230);
    ellipse(0, 0, 480, 480);

    pushMatrix();
    translate(sin(time-i)*240, cos(time-i)*240);
    fill(#FED79C);
    noStroke();
    sphere(10);
    popMatrix();
    popMatrix();
  }

  directionalLight(204, 204, 204, .5, 0, -1);
  noStroke();
  fill(#00727D);
  emissive(#00727D);
  sphere(200);

  popMatrix();
}



