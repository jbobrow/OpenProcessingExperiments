
float[] t=new float[10];
float[] tx=new float[10];
float[] ty=new float[10];
float[] d=new float[10];
float[] r= {
  142, 240, 255, 151, 140, 139, 168, 184, 195, 255
};
float[] g= {
  255, 142, 193, 142, 216, 255, 177, 121, 255, 111
};
float[] b= {
  207, 255, 142, 240, 140, 165, 255, 230, 165, 183
};
void setup() {
  size(600, 600);
  background(255);
  for (int i=0;i<10;i++) {
    t[i]=random(1000);
    tx[i]=random(1000);
    ty[i]=random(1000);
    d[i]=random(60, 150);
  }
  smooth();
}

void draw() {
  background(255);
  float[] nt=new float[10];
  float[] ntx=new float[10];
  float[] nty=new float[10];
  for (int i=0;i<10;i++) {
    nt[i]=noise(t[i]);
    ntx[i]=noise(tx[i]);
    nty[i]=noise(ty[i]);
    t[i]=t[i]+0.003;
    tx[i]=tx[i]+0.0005;
    ty[i]=ty[i]+0.0005;
    rectMode(CENTER);
    fill(r[i], g[i], b[i], 150);
    noStroke();
    ellipse(ntx[i]*width, nty[i]*height, nt[i]*d[i], nt[i]*d[i]);
    fill(0, 100);
    rect(ntx[i]*width, nty[i]*height, 4, 4);
    strokeWeight(0.3);
    stroke(0, 150);
    for (int j=0;j<10;j++) {
      if (sqrt((nty[j]-nty[i])*(nty[j]-nty[i])+(ntx[j]-ntx[i])*(ntx[j]-ntx[i]))<0.12) {
        line(ntx[i]*width, nty[i]*height, ntx[j]*width, nty[j]*height);
      }
    }
  }
  rectMode(CORNER);
  noStroke();
  fill(237, 220, 182, 120);
  rect(0, 0, width, 100);
  rect(0, 0, 100, height);
  rect(width-100, 0, 100, height);
  rect(0, height-100, width, 100);
}

