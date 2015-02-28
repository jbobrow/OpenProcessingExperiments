
PImage[] bubble=new PImage [10];
float [] circleX=new float [10];
float [] circleY=new float [10];
float [] yVel = new float [10];


void setup() {
  size(630, 490);
  smooth();
  noStroke();
  frameRate(10);

  for (int i=0; i<10; i++) {
    circleX[i]=50*(i+1);
    circleY[i]=9*(i+1);
    yVel [i] = random(0, 50);
    bubble [i]= loadImage("bubble.png");
  }
  
  
}

void draw () {

  background(255);
  fill(255, 255, 255, 90);
  rect(10, 500, 580, 20);
  for (int i=0; i <10; i++) {
    image(bubble[i], circleX[i], circleY[i]);
  }
  update();
}





void update () {
  for (int i=0; i<10; i++) {
    circleY[i]=circleY[i]+yVel[i];

    if ( circleY[i] >=500-(120/2)) {
      circleY[i] = 500-120/2;
      yVel[i]= yVel[i]*(-1);
    }
  }
}


