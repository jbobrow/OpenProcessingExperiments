
int num=30;
float[]X=new float[num];
float[]Y=new float[num];
float[]angle=new float[num];
float[]amount=new float[num];
float[]esAmount=new float[num];
float[]es=new float[num];
float[]R=new float[num];
float[]G=new float[num];
float[]B=new float[num];

void setup() {
  size(600, 400);
  background(0);
  for (int i=0; i<num; i++) {
    X[i]=random(-150, 150);
    Y[i]=random(-150, 150);
    angle[i]=random(360);
    amount[i]=random(0.05, 0.1);
    es[i]=random(15);
    esAmount[i]=random(0.1, 1);
    R[i]=random(255);
    G[i]=random(255);
    B[i]=random(255);
  } 
  smooth();
}

void draw() {
  fadeToWhite();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    angle[i]+=amount[i];
    rotate(radians(angle[i]));
    es[i]+=esAmount[i];
    if (es[i]>15 || es[i]<0) {
      esAmount[i]=-esAmount[i];
    }
    fill(R[i], G[i], B[i]);
    noStroke();
    ellipse(X[i], Y[i], es[i], es[i]);
  }
}

void fadeToWhite() {
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
}

void mousePressed() {
  background(0);
  for (int i=0; i<num; i++) {
    X[i]=random(-150, 150);
    Y[i]=random(-150, 150);
    angle[i]=random(360);
    amount[i]=random(0.05, 0.1);
    es[i]=random(15);
    esAmount[i]=random(0.1, 1);
    R[i]=random(255);
    G[i]=random(255);
    B[i]=random(255);
  }
}

                
                
