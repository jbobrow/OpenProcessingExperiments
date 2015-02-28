

int inc;
int num=5;
int []y= new int[num+1];
//int []y2= new int

void setup() {
  size(400, 400);
  background(255);
  inc=width/num;
  noFill();
  // noLoop();

  for (int i=0; i<y.length;i++) {

    y[i]= (int)random(height/3, height/2);
  }
}

void draw() {
  // background(255);
  stroke((int)random(100, 200), (int)random(100, 255), 3);
  beginShape();
  curveVertex(0, height/2);

  for (int i=0; i<=num;i++) {
    curveVertex(inc*i, y[i]);
    y[i]+=(int)random(-10, 10);

  }

  curveVertex(width, (height/2));
  endShape();
}



