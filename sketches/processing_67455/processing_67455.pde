

PImage bg;
PImage winner;
PFont testFont;

int circleNum = 10;
int level;
int counter;

float[] circleX = new float [circleNum];
float[] circleY = new float [circleNum];
float[] vel = new float [circleNum];
float[] velX = new float [circleNum];

boolean[] circleLive = new boolean [circleNum];


void setup() {
  level=1;
  size(400, 600);
  smooth();
  bg = loadImage("fondofrog.jpg");
  resetBalls();
  //winner = loadImage("winner");
}


void draw() {

  background(bg);

  stroke(242, 31, 42);
  strokeWeight (18);
  strokeCap(ROUND);
  line(width/2, height, width/2, height - 30);
  
  fill(255);
  testFont = loadFont ("Silom-48.vlw");
  textFont(testFont,15);
  text("level:0", 310, 30);
  text(level, 365, 30);
  text("score:", 310, 50);
  text(counter, 365, 50);

  for (int i = 0; i < circleNum; i++) {

    float inCircle = dist(circleX[i], circleY[i], mouseX, mouseY);

    if (circleLive[i] == true) {
      fill(255, 217, 0);
      ellipse(circleX[i], circleY[i], 18, 18);
    }
    if (circleLive[i] && inCircle < 18 && mousePressed) {
      println("hit!");
      circleLive[i] = false;
      counter++;
      println(counter);
      
    } 
    
    
    if (counter==circleNum){
      level++;
      resetBalls();
      counter=0;
    }
    

    if (mousePressed) {
      line(width/2, height - 30, mouseX, mouseY);
    }

    circleY[i] += vel[i]; //the same as writing: circleY = circleY + vel
    circleX[i] += velX[i]; //the same as writing: circleX = circleX + 2


    if ((circleY[i] < 0)||(circleY[i] > height)) {
      vel[i] *= -1;  //same as vel*=-1
    }

    if ((circleX[i] < 0)||(circleX[i] > width)) {
      velX[i] *= -1;  //same as: velX = velX * -1
    }
  }
}

void resetBalls() {
  for (int i = 0; i < circleNum; i++) {
    circleLive[i] = true;
    circleX[i] = random(width);
    circleY[i] = random(height);

    if (level==1) {
      vel[i] = random(2, 4);
      velX[i] = random(1, 3);
    }
    
    if(level==2){
    vel[i] = random(4, 5);
    velX[i] = random(2, 4);
    }
    
    if(level==3){
    vel[i] = random(5, 7);
    velX[i] = random(3, 5);
    }
    
  }
}


