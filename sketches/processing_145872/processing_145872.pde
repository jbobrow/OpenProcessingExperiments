
PImage backgroundImg;
PImage duck;
PImage shotgun;
PImage bullet;
PImage goldenduck;
PImage duckhuntingbeginningscreen;
PImage explosion;
PImage roastduck;
int state=2, stage = 1, numBullets = 5, lastClear = 0, lastReload = 0, stageFrame = 0, lives = 5, score, highscore, timeLeft;
boolean dead = false;
boolean shoot = false;
boolean goldDuckShot = false;

void setup() {
  size(700, 600);  
  backgroundImg = loadImage("background.jpg");
  duck = loadImage("duck.png");
  shotgun = loadImage("shotgun.png");
  bullet = loadImage("bullet.png");
  goldenduck = loadImage("goldenduck.png");
  duckhuntingbeginningscreen = loadImage("duckhuntingbeginningscreen.jpg");
  explosion = loadImage("explosion.png");
  roastduck = loadImage("roastduck.png");
  noCursor();
}
class Duck {
  boolean flip = false;
  boolean bull = false;
  boolean shot = false;
  float vx;
  float xDuck, yDuck;
  float murpx, murpy;
  int count = 0;
  Duck(int x, int y, boolean toflip) {
    flip = toflip;
    xDuck = x;
    vx=stage;
    yDuck = y;
  }
  void display() {

    if (flip) { 
      pushMatrix();
      if (shot)image(roastduck, xDuck, yDuck);
      else { 
        scale(-1.0, 1.0);
        image(duck, -xDuck, yDuck);
      }
      popMatrix();
      xDuck-=vx;
    }
    else {
      pushMatrix();
      if (shot)image(roastduck, xDuck, yDuck);
      else image(duck, xDuck, yDuck);
      popMatrix();
      xDuck+=vx;
    }
    if (shot)yDuck+=15;


    if (shot&&count<20) {
      count++;
      vx=0;
      image(explosion, murpx, murpy);
    }
  }
}
class Goduck {
  boolean flip = false;
  boolean shot = false;
  float vx;
  float xDuck1, yDuck1;
  Goduck(int x, int y) {
    xDuck1 = x;
    vx=stage*2;
    yDuck1 = y;
  }
  void display() {
    if (shot) {
      yDuck1+=15;
      vx=0;
    }
    if (flip) { 
      pushMatrix();
      scale(-1.0, 1.0);
      image(goldenduck, -xDuck1, yDuck1);
      popMatrix();
      xDuck1-=vx;
    }
    else {
      pushMatrix();
      image(goldenduck, xDuck1, yDuck1);
      popMatrix();
      xDuck1+=vx;
    }
  }
}
ArrayList <Duck> ducks = new ArrayList<Duck>();
ArrayList <Goduck> ducks1 = new ArrayList<Goduck>();
//ArrayList<PImage> images = new ArrayList<PImage>();
//images.add(loadImage("thefile.png"));
//images.add(loadIMage("asdfasdf"));
//PImage bla = images.get(0);ad
//image(images.get(0),  123, 234 );
ArrayList <PImage> bullets = new ArrayList<PImage>(); 
void draw() {
  if (state == 0) {
    timeLeft=(int)(20-(((frameCount-stageFrame)%1200)/60));
    if (lives<=0) {
      background(255, 0, 0);
      textSize(50);
      text("GAME OVER", width/2+125, height/2);
      lives=0;
      if (mousePressed) {
        ducks.clear();
        score = 0;
        lives = 5;
        numBullets = 5;
        stage = 1;
        stageFrame=0;
        lastReload = 0;
        lastClear = 0;
        frameCount = 0;
        goldDuckShot= false;
        ducks1.get(0).vx=stage*2;
      }
    }
    else {
      if (frameCount%(120-(10*stage))==0) {
        int derpx;
        int derpy = (int)random(0, 500);
        boolean derpsplit;
        if (random(0, 2)>1) {
          derpx=700;
          derpsplit = true;
        }
        else {
          derpx=0;
          derpsplit = false;
        }
        ducks.add(new Duck(derpx, derpy, derpsplit));
      }
      image(backgroundImg, 0, 0);
      if ((frameCount-stageFrame)%1200==600) {
        ducks1.add(new Goduck(0, (int)random(50, height-50)));
      }
      if ((frameCount-stageFrame)%1200>600) {
        if (ducks1.size()>0) {
          ducks1.get(0).display();
          if (goldDuckShot==false&&mousePressed&&dist(mouseX, mouseY, ducks1.get(0).xDuck1, ducks1.get(0).yDuck1)<60&&lives>0) {
            goldDuckShot=true;
            score+=stage*10;
            ducks1.get(0).shot=true;
          }
        }
      }
      for (int i=0;i<ducks.size();i++) {
        ducks.get(i).display();
        if (ducks.get(i).bull) {
          fill(0);
          text("Bullseye!", ducks.get(i).xDuck, ducks.get(i).yDuck);
        }
        if (700<ducks.get(i).xDuck||ducks.get(i).xDuck<0) {
          lives--;
          ducks.remove(i);
        }
      }
      if (score>=highscore) {
        highscore=score;
      }
      image(shotgun, mouseX-348, mouseY-205);
      if ((frameCount - stageFrame)%1200==0) {
        state = 1;
      }
      fill(255);
      textSize(10);
      textAlign(RIGHT);
      text("score: "+score, width-10, 50);
      text("lives: "+lives, width-10, 70);
      text("highscore: "+highscore, width-10, 30);
      text("Time Left: "+timeLeft, width-10, 90);
      //textAlign(LEFT);
      //image(bullet,0,540);
      //text("Bullets: "+numBullets, 10, 590);
      for (int j = 0 ; j < numBullets; j++) {
        if (state==0) {
          image(bullet, j*10+10, 540);
        }
      }
    }
  }
  if (state == 2) {
    background(0); 
    image(duckhuntingbeginningscreen, width/2-210, 50); 
    textAlign(CENTER);
    text("Welcome to Duck Hunting!", width/2, height/2+150);
    text("Here are the instructions:", width/2, height/2+160);
    text("1) Shoot the ducks to get points. The higher the stage, the faster the ducks move and the more points they're worth", width/2, height/2+170);
    text("2) You have 5 lives. If you miss a duck, you lose a life. Don't let your lives run out!", width/2, height/2+180);
    text("3) Press r to reload; it takes a second to reload", width/2, height/2+190);
    text("4) Space is available every 7 seconds and it clears all ducks except the golden duck, but doesn't give any points", width/2, height/2+200);
    text("5) Shoot accurately for a bulleye!", width/2, height/2+210);
    text("6) Hit the golden duck for a lot of points!", width/2, height/2+220);
    if (mousePressed) {
      frameCount = 0;
      state = 0;
    }
  }
  if (state==1) {
    background(0);
    textAlign(CENTER);
    textSize(50);
    text("Stage " + (stage+1), width/2, height/2);
    text("Click to Continue", width/2, height/2+50);
    lives = 5;
    if (mousePressed&&(frameCount-stageFrame)>=1300) {
      ducks.clear();
      stageFrame = frameCount;
      //frameCount=0;
      lives = 5;
      numBullets = 5;
      stage++;
      goldDuckShot=false;
      ducks1.remove(0);
      state = 0;
    }
  }
}
void keyPressed() {
  if (key==' ' && (frameCount - lastClear) > 60*7) {
    ducks.clear();
    lastClear = frameCount;
  }
  if (key=='r') {
    lastReload = frameCount;
    numBullets = 5;
  }
}
void mousePressed() {
  if (frameCount - lastReload>=60) {
    if (numBullets > 0) {
      numBullets--;
      for (int i=0;i<ducks.size();i++) {
        if (dist(mouseX, mouseY, ducks.get(i).xDuck, ducks.get(i).yDuck+50)<100&&dist(mouseX, mouseY, ducks.get(i).xDuck, ducks.get(i).yDuck+50)>20&&lives>0) {
          score+=stage;
          ducks.get(i).murpx=ducks.get(i).xDuck;
          ducks.get(i).murpy=ducks.get(i).yDuck;
          ducks.get(i).shot=true;

          if (ducks.get(i).yDuck>600) {
            ducks.remove(i);
          }
        }
        else if (dist(mouseX, mouseY, ducks.get(i).xDuck, ducks.get(i).yDuck+50)<20&&dist(mouseX, mouseY, ducks.get(i).xDuck-50, ducks.get(i).yDuck)>0&&lives>0) {
          score+=stage*3;
          ducks.get(i).murpx=ducks.get(i).xDuck;
          ducks.get(i).murpy=ducks.get(i).yDuck;
          ducks.get(i).shot=true;
          ducks.get(i).bull=true;
          if (ducks.get(i).yDuck>600) {
            ducks.remove(i);
          }
        }
      }
    }
  }
}


