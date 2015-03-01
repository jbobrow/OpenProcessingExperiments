
int ballCount=200;
float[] circleX = new float [ballCount];
float[] circleY = new float [ballCount];
float[] speedY = new float [ballCount];

float[] gravity = new float [ballCount];
float[] speedX = new float[ballCount];
float diam=5;
float[] a = new float[ballCount];
float[] b = new float[ballCount];
float[] c = new float[ballCount];

void setup() {
  size(700, 700);

  for (int i=0; i<ballCount; i++) {
    circleX[i]=random(-diam, 3*width/2);
    //circleY[i]=random(diam/2, height-diam/2);
    speedY[i]=0;
    speedX[i]=0;

    gravity[i]=0.1;
  }

  
}

void draw() {
  background(255);
  for (int i=0; i<ballCount; i++) {
    ellipse(circleX[i], circleY[i], diam, diam);


     noStroke();
     
      speedX[i]= mouseX - width/2;
      
      println(speedX[i]);
 
      circleY[i] += speedY[i];
      circleX[i] += speedX[i]*0.005;
      speedY[i] += gravity[i]*random(0.4,1.8);
      
      a[i] = map(circleX[i],0,width,0,255);
      b[i] = map(circleY[i],0,width,0,255);
      c[i] = map(speedX[i],-350,350,0,255);
      fill(a[i],b[i],c[i]);

      if (circleY[i]>height-diam/2) {
        circleY[i]=height-diam/2; 
        speedY[i]=-speedY[i]*0.95; 

        if (abs(speedY[i])<2) {
          speedY[i] = 0;
        }
      }


    }
  
}

void mousepressed(){
  
  
  
}














