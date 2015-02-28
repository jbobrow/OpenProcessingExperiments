
//yi-ting sie
//課程練習-多球移動
//畫面中的圓圈會變位置，自行移動
//Sheng-Fen Nik Chien(2011), Many bouncing balls, http://www.openprocessing.org/visuals/?visualID=42444

float ball_size=5;
float[] X= new float[5];
float[] Y= new float[5];
float[] W= new float[5];
float[] H= new float[5];//ball001
float Z, V, A, B;//ball002

void setup() {
  size(300, 300);

  for (int i=0;i<5;i++) {  

    X[i]=random(width);
    Y[i]=random(height);
    W[i]=random(5);
    H[i]=random(5);//ball001

    smooth();
    ellipse(X[i]+=W[i], Y[i]+=H[i], 20, 20);
    ellipse(Z, V, 50, 50);
  }

  Z=random(width);
  V=random(height);
  A=random(4);
  B=random(4);//ball002
}

void draw() {
  smooth();
  background(210, 200, 130);

  //ball001
  for (int i=0;i<5;i++) {
    if (X[i]>=width-5 || X[i]<5) {
      W[i]=-W[i];
    }
    if (Y[i]>=height-5|| Y[i]<5) {
      H[i]=-H[i];
    }


    strokeWeight(2);
    fill(60, 250, 100);
    ellipse(X[i]+=W[i], Y[i]+=H[i], 20, 20);
  }


  //ball002
  if (Z>=width-25  || Z<25 ) {
    A=-A;
  }
  if (V>=height-25  || V<25 ) {
    B=-B;
  }

  Z=Z+A;
  V=V+B;

  strokeWeight(5);
  fill(160, 70, 200);
  ellipse(Z, V, 50, 50);
}

void keyPressed() {
  saveFrame("ball-####.png");
}


