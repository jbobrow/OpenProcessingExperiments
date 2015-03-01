
float time=0;
int particles=8;

void setup() {
  size(700, 700);
  background(#0AAF8F);
  smooth(8);
}

void draw() {

  frameRate(50);
  time+=.03;
  background(#EAEAEA);

  noStroke();
  fill(7, 15+random(-5, 5));
  rect(0, 0, width*2, height*2);


  pushMatrix();
  translate(width/2+random(2), 
  height/2+random(2));
  rectMode(CENTER);
  for (int i=100; i<500; i+=20) {
    noFill();
    stroke(#202253, 200+random(-15, 15));//0AAF8F
    strokeWeight(1);
    pushMatrix();
    rotate(sin(time-radians(i))/5);
    ellipse(0, 0, i+sin(time-radians(i))*40, 
    i+cos(time-radians(i))*40);
    popMatrix();
    }
  popMatrix();




  for (int i=0; i<particles; i++) {
    pushMatrix();
    translate(random(width-i), random(height-i));
    rotate(random(time-i));
    part();

    point(i, i);
    popMatrix();
  }

  for (int i=0; i<particles*2; i++) {
    pushMatrix();
    translate(random(width-i), random(height-i));
    rotate(random(time-i));
    dust();
    popMatrix();
  }
}


void dust() {
  int n=8;
  float[] x=new float[n];
  float[] y=new float[n];
  noFill();
  stroke(5, 45);
  beginShape();
  for (int i=0; i<n; i++) {
    x[i]=cos(noise(i))*i*4;
    y[i]=sin(noise(i, x[i]))*6;
    vertex(x[i], y[i]);
  }
  endShape();
}




void part() {
  int n=25;
  float[] x=new float[n];
  float[] y=new float[n];
  noFill();
  noStroke();
  fill(5, 20);
  beginShape();
  for (int i=0; i<n; i++) {
    x[i]=cos(i)*3+random((i));
    y[i]=sin(i)*3+random((i));
    curveVertex(x[i], y[i]);
  }
  endShape();
}


