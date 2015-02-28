
float[] xp= new float[11];
float[] yp= new float[11];
float[] xspeed=new float[11];
float[] yspeed=new float[11];
int score=0;
int n=0;
boolean bouncelife=true;
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup() {
  size(600, 600);
  smooth();

  img0 = loadImage("trial0.png");
  img1 = loadImage("trial1.png");
  img2 = loadImage("trial2.png");
  img3 = loadImage("cloud.png");
  img4 = loadImage("grinningpanda.png");
  img5 = loadImage("mont.png");

  //initialize
  xp[0]=70;
  yp[0]=80;
  xspeed[0]=4;
  yspeed[0]=3;

  xp[1]=70;
  yp[1]=80;
  xspeed[1]=6;
  yspeed[1]=2;

  xp[2]=70;
  yp[2]=80;
  xspeed[2]=3;
  yspeed[2]=6;

  xp[3]=70;
  yp[3]=80;
  xspeed[3]=3;
  yspeed[3]=5;

  xp[4]=70;
  yp[4]=80;
  xspeed[4]=2;
  yspeed[4]=5;

  xp[5]=70;
  yp[5]=80;
  xspeed[5]=3;
  yspeed[5]=3;

  xp[6]=70;
  yp[6]=80;
  xspeed[6]=1;
  yspeed[6]=5;

  xp[7]=70;
  yp[7]=80;
  xspeed[7]=4;
  yspeed[7]=6;

  xp[8]=70;
  yp[8]=80;
  xspeed[8]=5;
  yspeed[8]=5;

  xp[9]=70;
  yp[9]=80;
  xspeed[9]=6;
  yspeed[9]=1;

  xp[10]=70;
  yp[10]=80;
  xspeed[10]=4;
  yspeed[10]=7;
}

void draw() {

  noStroke();

  background(87, 194, 239);

  image(img3, mouseX-600, height-90);
  image(img5, 0, 500);

  image(img0, xp[0], yp[0], 80-yp[0]*0.1, 80-yp[0]*0.1);
  image(img1, xp[1], yp[1], 80-yp[1]*0.1, 80-yp[1]*0.1);
  image(img2, xp[2], yp[2], 80-yp[2]*0.1, 80-yp[2]*0.1);
  image(img0, xp[3], yp[3], 80-yp[3]*0.1, 80-yp[3]*0.1);
  image(img1, xp[4], yp[4], 80-yp[4]*0.1, 80-yp[4]*0.1);
  image(img2, xp[5], yp[5], 80-yp[5]*0.1, 80-yp[5]*0.1);
  image(img0, xp[6], yp[6], 80-yp[6]*0.1, 80-yp[6]*0.1);
  image(img1, xp[7], yp[7], 80-yp[7]*0.1, 80-yp[7]*0.1);
  image(img2, xp[8], yp[8], 80-yp[8]*0.1, 80-yp[8]*0.1);
  image(img0, xp[9], yp[9], 80-yp[9]*0.1, 80-yp[9]*0.1);
  image(img1, xp[10], yp[10], 80-yp[10]*0.1, 80-yp[10]*0.1);

  if (frameCount>300) {
    playball(0);
    playball(1);
    playball(2);
    playball(3);
    playball(4);
    playball(5);
    playball(6);
    playball(7);
    playball(8);
    playball(9);
    playball(10);
  }

  if (frameCount<=300) {
    fill(87, 194, 239);
    rect(70, 80, 100, 100);
    fill(255, 0, 0);
    String t="Save the Pandas";
    textSize(50);
    textAlign(CENTER);
    text(t, 50, 100, 500, 300);
    fill(0); 
    String tt="Save the pandas bouncing in the atmosphere by letting them fall back under the clouds to the troposphere, or they will burst!!!";
    textSize(30);
    textAlign(CENTER);
    text(tt, 75, 200, 450, 600);
  }
}

void playball(int i) {

  xp[i]=xp[i]+xspeed[i];
  yp[i]=yp[i]+yspeed[i];

  if (xp[i]<0||xp[i]>width-40) {  //bounce back
    xspeed[i]=-xspeed[i];
  }
  if (yp[i]<0) {  //bounce back
    yspeed[i]=-yspeed[i];
  }
  if (yp[i]>height-40) {  //obect stops
    xspeed[i]=0;
    yspeed[i]=0;
  }

  if (floor(yp[i])==height-40) {  //score+1
    score+=30;
  }

  if ((xp[i]<mouseX-45||xp[i]>mouseX+45)&&(yp[i]>486&&yp[i]<496)) {  //bounce back
    yspeed[i]=-yspeed[i];
    score--;
  }

  textSize(40);  //score display
  fill(255, 0, 0);
  text(score, 50, 60);

  if (frameCount>1500&&score<0) { //end game
    xspeed[i]=0;
    yspeed[i]=0;
    fill(0);
    rect(0, 0, width, height);
    fill(255, 0, 0);
    textSize(n+32);
    n=n+3;
    text("PONG!", 100, 300);
  }

  if (yp[0]>height-40&&yp[1]>height-40&&yp[2]>height-40&&yp[3]>height-40&&yp[4]>height-40&&yp[5]>height-40&&yp[6]>height-40&&yp[7]>height-40&&yp[8]>height-40&&yp[9]>height-40&&yp[10]>height-40) {
    fill(255, 0, 0);
    String ttt="Congratulations!";
    textSize(30);
    textAlign(CENTER);
    text(ttt, 50, 200, 500, 300);
    fill(0);
    String tttt="It isn't the end of the world...yet.";
    textSize(30);
    textAlign(CENTER);
    text(tttt, 50, 250, 500, 300);
    image(img4, 300, 300);
    String ttttt="Press DOWN to play again!";
    textSize(20);
    textAlign(CENTER);
    text(ttttt, 50, 350, 250, 300);


    if (key == CODED) {
      if (keyCode == DOWN) {
        //initialize
        xp[0]=70;
        yp[0]=80;
        xspeed[0]=4;
        yspeed[0]=3;

        xp[1]=70;
        yp[1]=80;
        xspeed[1]=6;
        yspeed[1]=2;

        xp[2]=70;
        yp[2]=80;
        xspeed[2]=3;
        yspeed[2]=5;

        xp[3]=70;
        yp[3]=80;
        xspeed[3]=3;
        yspeed[3]=5;

        xp[4]=70;
        yp[4]=80;
        xspeed[4]=2;
        yspeed[4]=5;

        xp[5]=70;
        yp[5]=80;
        xspeed[5]=3;
        yspeed[5]=3;

        xp[6]=70;
        yp[6]=80;
        xspeed[6]=1;
        yspeed[6]=5;

        xp[7]=70;
        yp[7]=80;
        xspeed[7]=4;
        yspeed[7]=6;

        xp[8]=70;
        yp[8]=80;
        xspeed[8]=5;
        yspeed[8]=5;

        xp[9]=70;
        yp[9]=80;
        xspeed[9]=6;
        yspeed[9]=1;

        xp[10]=70;
        yp[10]=80;
        xspeed[10]=4;
        yspeed[10]=7;
      }
    }
  }
}


