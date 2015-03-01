
int x = 40;
int[] y = { 18, 37, 43, 60, 82, 73, 82, 60, 43, 37 };

void setup () {
  size(400,400);
  background(50);
  noStroke();
  noLoop();
}

void draw () {
  fill(70,120,220,150);
  translate(20,0);
  
  beginShape();
    for (int i = 0; i < y.length; i++) {
    vertex(x*i, y[i]*4);
    }
  endShape(CLOSE);
  
  fill(200,70,50,120);
  beginShape();
    for (int i = 0; i < y.length; i++) {
    vertex(x*(i*1.4), y[i]*5);
    }
  endShape(CLOSE);
  
  fill(90,210,140,150);
    beginShape();
    for (int i = 0; i < y.length; i++) {
    vertex(x*((i+1)*0.7), y[i]*3);
    }
  endShape(CLOSE);
}


