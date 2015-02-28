
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer song;*/
int l = 23;
int n=0;
int lives = 7;
int level =1;
int i = 0;
float k = 250;
int s=1;
int t = 0;
int r = 0;
float y = 250;
int b=1;
int score = 0;
int hit=0;
void setup() {
  size(1000, 500);
  //loadsong();
  t = millis(); 
  startpage();
  y = millis();
}

void draw() {

  if (r>1000) {
    r=0;
    b=b+1;
    y=random(25, 475);
  }

  if (i>1000) {
    i=0;
    s=s+1;
    k=random(25, 475);
    lives--;
  }
  if (mouseY>k-100 && mouseY<k+25 && i>925&&i<975) {
    i=0;
    s=s+1;
    k=random(25, 475);
  }
  if (key=='m') {
    fill(random(255), random(255), random(255));
    background(0, 0, 128);
    ellipse(i=i+l, k, 50, 50); 
    rect(950, mouseY, 10, 75);
    fill(240, 19, 19);

    text("lives:"+lives, 25, 25);
    //if(millis()>t+5000); 

    // ellipse(r=r+b,y,50,50);
    println("mouseY "+mouseY+" i "+i+ " k "+k);
    if (mouseY>k-100 && mouseY<k+25 && i>925&&i<975) {
      //score++;
      if (hit==0) {
        hit = 1;
        score=score+hit;
      }
    }

    else {
      hit=0;
    }
    text("score:"+score, 500, 250);
    println("score");
  }
  //if (keyCode == DOWN) {
  fill(random(255), random(255), random(255));
  //background(0,0,128);
  //ellipse( i,k=k+5, 100, 100); 


  if (key == ' ') {
    fill(random(255), random(255), random(255));
    background(0, 0, 128);
    ellipse(i=i+s, k, 50, 50); 
    rect(950, mouseY, 10, 75);
    fill(240, 19, 19);
    text("level:"+level, 500, 500);
    text("lives:"+lives, 25, 25);
    //if(millis()>t+5000); 

    // ellipse(r=r+b,y,50,50);
    println("mouseY "+mouseY+" i "+i+ " k "+k);
    if (mouseY>k-100 && mouseY<k+25 && i>925&&i<975) {
      //score++;
      if (hit==0) {
        hit = 1;
        score=score+hit;
      }
    }
    else {
      hit=0;
    }
    text("score:"+score, 500, 250);
    println("score");

    if (score==5&&level==1) {


      s=1;
      score=0;
      level++;
    }
    if (score==10&&level==2) {

      s=1;
      score=0;
      level++;
    }
    if (score==15&&level==3) {

      s=1;
      score=0;
      level++;
    }
    if (score==20&&level==4) {

      s=1;
      score=0;
      level++;
    }
    if (score==25&&level==5) {

      s=1;
      score=0;
      level++;
    }
    if (score==30&&level==6) {

      s=1;
      score=0;
      level++;
    }

    if (score==35&&level==7) {
      background(19, 12, 242);
      textSize(100);
      text("you win", 250, 250);
    }
  }
  if (lives<1) {
    //song.play();
    background(242, 12, 12);
    fill(242, 220, 12);
    textSize(100);  
    text("you lost", 250, 250);
    text("score:"+score, 250, 400);
    if(millis()>n+3000) {
      startpage();
    }
  }
}


void startpage() {
if (key==' ') {
  l = 23;
  lives = 7;
  level =1;
  i = 0;
  k = 250;
  s=1;
  t = 0;
  r = 0;
  y = 250;
  b=1;
  score = 0;
  hit=0;
}
  background(19, 52, 4);
  ellipse(500, 250, 300, 100);
  textSize(30);
  text("press space to start", 300, 100);
  text("use the mouse to control the paddle", 250, 350);
  text("try to touch the ball with the paddle", 250, 400);
  text("and get past level 7 to win", 250, 450);
  text("any key to pause,space to resume", 250, 500);
  text("press m to try to get a high score", 250, 50);
}

/*void loadsong() {
  minim=new Minim(this);
  song=minim.loadFile("descending_craft-Sonidor-991848481.mp3");
}*/



















