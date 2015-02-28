
int objNumber=40;
color woodMain,dustColor;
int woodBrightest=90;
int dustCount,dustMax=3000,rockCount,rockMax=125,bigRockCount,bigRockMax=10;
int dustRange=250,rockRange=125,bigRockRange=75;
int rockLengthRange=20,bigRockLengthRange=30;
float[] dustX = new float[dustMax];
float[] dustY = new float[dustMax];
float[] rockX1 = new float[rockMax];
float[] rockY1 = new float[rockMax];
float[] rockX2 = new float[rockMax];
float[] rockY2 = new float[rockMax];
float[] bigRockX1 = new float[rockMax];
float[] bigRockY1 = new float[rockMax];
float[] bigRockX2 = new float[rockMax];
float[] bigRockY2 = new float[rockMax];

void setup() {
  size(700,600);
  colorMode(HSB,360,100,100);
  woodMain=color(28,80,40);
  dustColor=color(33,10,80,98);
  smooth();
  drawFloor();
}

void draw() {
}

void drawFloor() {
  background(woodMain);
  ellipseMode(CENTER);
  noStroke();
  for (int i=0;i<20;i++) {
    fill(hue(woodMain),saturation(woodMain)-i*2,woodBrightest-i*1,30);
    ellipse(width/2,height/2,620-25*i,620-25*i);
  }
  strokeWeight(20);
  noFill();
  strokeCap(ROUND);
  stroke(hue(woodMain),saturation(woodMain)-20,brightness(woodMain)-20,90);
  arc(width/2,height/2,800,800,-PI*3/4,PI/4);
}

void drawDust() {
  strokeCap(ROUND);
  for (int i=0;i<dustCount-1;i++) {
    stroke(hue(dustColor),saturation(dustColor),brightness(dustColor)+i*(20.0/dustCount)/*,alpha(dustColor)+i*(2.0/dustCount)*/);
    strokeWeight(random(2,8));
    float r=random(-dustRange,dustRange);
    dustY[i]=height/2-r;
    r=random(-(sqrt(sq(random(-dustRange,dustRange))-sq(r))),(sqrt(sq(random(-dustRange,dustRange))-sq(r))));
    dustX[i]=width/2-r;

    point(dustX[i],dustY[i]);
    point(dustX[i],height-dustY[i]);
    point(width-dustX[i],dustY[i]);
    point(width-dustX[i],height-dustY[i]);
  }
}

void drawRocks() {
  strokeCap(SQUARE);
  for (int i=0;i<rockCount-1;i++) {
    strokeWeight(random(5,25));
    color rockBright= color(0,0,90+10*i/rockCount);
    color rockDark= color(0,0,20,99);

    float r = random(-rockRange,rockRange);
    float r1 = random(-rockRange,rockRange);
    float r2 = random(-(sqrt(sq(random(-rockRange,rockRange))+sq(r1))),(sqrt(sq(random(-rockRange,rockRange))-sq(r1))));
    rockX1[i]= width/2+r1;
    rockY1[i]= height/2+r2;
    rockX2[i]= rockX1[i]+random(-rockLengthRange,rockLengthRange);
    rockY2[i]= rockY1[i]+random(-rockLengthRange,rockLengthRange);

    stroke(rockDark);
    line(rockX1[i],rockY1[i],rockX2[i],rockY2[i]);
    stroke(rockBright);
    line(rockX1[i]-4,rockY1[i]-4,rockX2[i]-4,rockY2[i]-4);

    stroke(rockDark);
    line(width-rockX1[i],rockY1[i],width-rockX2[i],rockY2[i]);
    stroke(rockBright);
    line(width-rockX1[i]-4,rockY1[i]-4,width-rockX2[i]-4,rockY2[i]-4);

    stroke(rockDark);
    line(rockX1[i],height-rockY1[i],rockX2[i],height-rockY2[i]);
    stroke(rockBright);
    line(rockX1[i]-4,height-rockY1[i]-4,rockX2[i]-4,height-rockY2[i]-4);

    stroke(rockDark);
    line(width-rockX1[i],height-rockY1[i],width-rockX2[i],height-rockY2[i]);
    stroke(rockBright);
    line(width-rockX1[i]-4,height-rockY1[i]-4,width-rockX2[i]-4,height-rockY2[i]-4);
  }
}

/*
void drawBigRocks() {
  strokeCap(SQUARE);
  for (int i=0;i<bigRockCount-1;i++) {
    strokeWeight(random(10,25));
    color rockBright= color(0,0,90+10*i/bigRockCount);
    color rockDark= color(0,0,20,99);

    float r = random(-bigRockRange,bigRockRange);
    float r1 = random(-bigRockRange,bigRockRange);
    float r2 = random(-(sqrt(sq(random(-bigRockRange,bigRockRange))+sq(r1))),(sqrt(sq(random(-bigRockRange,bigRockRange))-sq(r1))));
    rockX1[i]= width/2+r1;
    rockY1[i]= height/2+r2;
    bigRockX2[i]= bigRockX1[i]+random(-bigRockLengthRange,bigRockLengthRange);
    bigRockY2[i]= bigRockY1[i]+random(-bigRockLengthRange,bigRockLengthRange);

    stroke(rockDark);
    line(bigRockX1[i],bigRockY1[i],bigRockX2[i],bigRockY2[i]);
    stroke(rockBright);
    line(bigRockX1[i]-4,bigRockY1[i]-4,bigRockX2[i]-4,bigRockY2[i]-4);

    stroke(rockDark);
    line(width-bigRockX1[i],bigRockY1[i],width-bigRockX2[i],bigRockY2[i]);
    stroke(rockBright);
    line(width-bigRockX1[i]-4,bigRockY1[i]-4,width-bigRockX2[i]-4,bigRockY2[i]-4);

    stroke(rockDark);
    line(bigRockX1[i],height-bigRockY1[i],bigRockX2[i],height-bigRockY2[i]);
    stroke(rockBright);
    line(bigRockX1[i]-4,height-bigRockY1[i]-4,bigRockX2[i]-4,height-bigRockY2[i]-4);

    stroke(rockDark);
    line(width-bigRockX1[i],height-bigRockY1[i],width-bigRockX2[i],height-bigRockY2[i]);
    stroke(rockBright);
    line(width-bigRockX1[i]-4,height-bigRockY1[i]-4,width-bigRockX2[i]-4,height-bigRockY2[i]-4);
  }
}
*/

void mouseDragged() {
  dustCount=int(map(mouseX,0,width,0,dustMax-1));
//  dustRange=int(map(mouseX,0,width,500,225));
  rockCount=int(map(mouseY,0,height,0,rockMax));
//  rockRange=int(map(mouseY,0,height,500,125));
  bigRockCount=int(map(mouseY,0,height,0,bigRockMax));
  drawFloor();
  drawDust();
  drawRocks();
  //  drawBigRocks();
}

void mouseClicked() {
  dustCount=int(map(mouseX,0,width,0,dustMax-1));
//  dustRange=int(map(mouseX,0,width,500,225));
  rockCount=int(map(mouseY,0,height,0,rockMax));
//  rockRange=int(map(mouseY,0,height,500,125));
  bigRockCount=int(map(mouseY,0,height,0,bigRockMax));
  drawFloor();
  drawDust();
  drawRocks();
}


