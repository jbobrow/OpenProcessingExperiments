
float []xPosBall=new float[4];
float []yPosBall=new float[4];
float []Xvelocity=new float[4];
float []Yvelocity=new float[4];
float gravity =0.1;
void setup() {
  size(300, 300);
  background(255);
  noStroke();
  for (int i=0;i<4;i++) {
    xPosBall[i]=random(0, width);
    yPosBall[i]=random(0, height);
    Xvelocity[i]=i/10+2.4;
    Yvelocity[i]=i/10+3.1;
  }
}

void draw() {
  background(255);
  fill(0);
  for (int i=0;i<4;i++) {
  
//with for loop we can draw 4 balls

    ellipse(xPosBall[i], yPosBall[i], 30, 30);
    xPosBall[i]=xPosBall[i]+Xvelocity[i];
    yPosBall[i]=yPosBall[i]+Yvelocity[i];
    Yvelocity[i]=Yvelocity[i]+gravity;
    
//the position of ball will change when next void draw() hanpens

    if (xPosBall[i]>300||xPosBall[i]<0) {
      Xvelocity[i]=-Xvelocity[i];
    }
    
//if the ball hits the border, it will change the direction

    if (yPosBall[i]>300||yPosBall[i]<0) {
      Yvelocity[i]=Yvelocity[i]*-0.9;
    }
    
//if the ball hits the border, it will change the direction

  }
  
//above loop is all about drawing balls and bounce

  for (int i = 0;i<4;i++) {
    for (int j=0;j<4;j++) {
      println(dist(xPosBall[i], yPosBall[i], xPosBall[j], yPosBall[j])<=30);    
      if ((dist(xPosBall[i], yPosBall[i], xPosBall[j], yPosBall[j])<=30)&& (dist(xPosBall[i], yPosBall[i], xPosBall[j], yPosBall[j])!=0)) {
        Yvelocity[i]=-Yvelocity[i];
        Xvelocity[i]=-Xvelocity[i];
        Xvelocity[j]=-Xvelocity[j];
        Yvelocity[j]=-Yvelocity[j];
        break;
      }
    }
  }
// with two loop, we can compare the distance of all balls ,even its self, that is why there is one !=0;
// we dont want the comparation of itsself count. when the comparation say yes , it hits, we get out of the loop, 
//that is why there is a break;
}



