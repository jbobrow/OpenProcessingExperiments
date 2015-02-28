
int number=100;
int number2=50;
int number3=3;
float[] circlex=new float[number];
float[] circley=new float[number];
float[] circlez=new float[number2];
float[] circles=new float[number2];

float[] velx=new float[number];
float[] vely=new float[number];
float[] velz=new float[number2];
float[] vels=new float[number2];

//float circlea=0;
//float circleq=0;
//float vela=0;
//float velq=0;
//float velw=2;
float[] circlea=new float[number3];
float[] circleq=new float[number3];
float[] vela=new float[number3];
float[] velq=new float[number3];
float[] velw=new float[number3];
float[] vele=new float[number3];


void setup() {
  size(500, 500);

  smooth();

  for (int i=0; i<number; i++) {

    circlex[i] = random(10, width-20);
    circley[i] = random(10, height-20);

    velx[i] = random(5);
    vely[i]= random(5);
  }

  for (int n=0; n<number2; n+=2) {

    circlex[n] = random(10, width-20);
    circley[n] = random(10, height-20);

    velx[n] = random(3);
    vely[n]= random(3);
  }

  for (int i=0; i<number3; i++) {

    circlea[i] = 0;
    circleq[i] = 0;

    vela[i] = 1;
    velq[i]= 1;
    velw[i]= 1;
    vele[i]= 50;
  }
}

void draw() {

  background(234, 248, 255);
  noStroke();
  
   if (mousePressed) {
    fill(210,177,237,50);
  }
  else {
    fill(135, 189, 234, 50);
  }
  
  for (int i=0; i<number;i++) {
    circlex[i]+=velx[i];
    circley[i]+=vely[i];
    
    ellipse(circlex[i], circley[i], 20, 20);


    if ((circlex[i]>=width-20)||(circlex[i]<=0)) {

      velx[i]=-velx[i];
    }

    if ((circley[i]<=0)||(circley[i]>=height-20)) {

      vely[i]=-vely[i];
    }
  }



  for (int n=0; n<number2;n++) {
    circlez[n]+=velz[n];
    circles[n]+=vels[n];

    ellipse(circlex[n], circley[n], 40, 40);


    if ((circlex[n]>=width-20)||(circlex[n]<=0)) {

      velz[n]=-velz[n];
    }

    if ((circley[n]<=0)||(circley[n]>=height-20)) {

      vels[n]=-vels[n];
    }


    for (int i=0;i<number3;i++) {

      ellipseMode(CENTER);
      circlea[i]+=vela[i];
      circleq[i]+=velq[i];
      ellipse(circlea[i], circleq[i], mouseX/10, mouseY/10);

      if (circleq[i]==vele[i]) {
        if (circlea[i]==vele[i]) {
          vela[i]=velw[i];
          velq[i]=0;
        }
        if (circlea[i]==width-vele[i]) {
          vela[i]=0;
          velq[i]=velw[i];
        }
      }

      if (circleq[i]==height-vele[i]) {
        if (circlea[i]==width-vele[i]) {
          vela[i]=-velw[i];
          velq[i]=0;
        }

        if (circlea[i]==vele[i]) {
          vela[i]=0;
          velq[i]=-velw[i];
        }
      }
    }
  }
}










