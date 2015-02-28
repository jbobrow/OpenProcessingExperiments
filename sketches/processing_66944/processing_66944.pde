
PImage[] discoBall=new PImage [10];
float [] circleX=new float [10];
float [] circleY=new float [10];
float [] yVel = new float [10];
float d;



void setup() {
  size(600, 600);
  smooth();
  noStroke();
  d=20;


  frameRate(30);

  for (int i=0; i<10; i++) {
    circleX[i]=50*(i+1);
    //  circleY[i]=9*(i+1);
    yVel [i] = random(0, 10);
    discoBall [i]= loadImage("sphere.png");
  }
}

void draw () {

  background(0);
  fill(255, 255, 255,90);
  rect(10, 500, 580, 20);
  for (int i=0; i <10; i++) {
    fill(255);
    image(discoBall[i], circleX[i], circleY[i],60,60);
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


