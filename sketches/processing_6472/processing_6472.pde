
//Kelly is a sexy bitch
int page = 1; // Stores the current page
int score = -20;
int startTime = 0;
PShape slide1;
PImage slide2;
PImage yudof;
PFont myfont;
PShape taz1;
PShape taz2;
float t1, t2;
School s1;
String Score;
School[] schools = new School[5];
import ddf.minim.*;
AudioPlayer player;
Minim minim;
int m;
int startm;
int uclax = 12;
int ucsbx = 141;
int calx = 273;
int ucsdx = 400;
int ucscx = 530;
int collegewidth = 98;
boolean pressed = false;
float tz;
boolean switch4;
PShape p3;







void setup() {
  size(640, 480);
  smooth();
  frameRate(14);

  slide1 = loadShape("slide1.svg");
  slide2 = loadImage("background.jpg");
  yudof = loadImage("yudof.png");
  startTime = millis();
  myfont = loadFont("ArialMT-20.vlw");
  taz1 = loadShape("taz1.svg");
  taz2 = loadShape("taz2.svg");
  t1 = 225;
  t2 = 425;
  minim = new Minim(this);
  player = minim.loadFile("money.mp3");
  player.play();
  p3 = loadShape("page3.svg");



  schools[0] = new School(0 , 30, 0, "ucla.jpg"); 
  schools[1] = new School(130 , 30, 0, "ucsb.jpg"); 
  schools[2] = new School(260 , 30, 0, "cal.jpg"); 
  schools[3] = new School(390 , 30, 0, "ucsd.jpg"); 
  schools[4] = new School(520 , 30, 0, "ucsc.jpg");
}

void draw() {
  //Intro  
  if (page == 1){
    background(255);
    shape(slide1, 0, 0);
  }
  // Game
  else if (page == 2) {
    noCursor();

    image(slide2, 0, 0);
    for(int i=0; i < schools.length; i++){
      schools[i].display(); 
      //println(schools[i].getheight());
      if(schools[i].getheight() < 0){
        schools[i].setheight(schools[i].getheight()+1);
      }
    }
    imageMode(CENTER);
    image(yudof, mouseX, 350);
    imageMode(CORNER);
    //Score Counter
    Score=" "+score+" ";
    fill (255); 
    textFont(myfont); 
    text(Score, 520, 442);
    schoolpressed();

    //Tasers
    shape(taz1, t1, t2);
    if (tz >= 1){
      shape(taz2, t1, t2);
    }
    shape(taz1, t1 + 25, t2);
    if (tz >= 2){
      shape(taz2, t1 + 25, t2);
    }
    shape(taz1, t1 + 50, t2); 
    if (tz >= 3){
      shape(taz2, t1 + 50, t2);
    }
    shape(taz1, t1 + 75, t2);
    if (tz >= 4){ 
      shape(taz2, t1 + 75, t2);
    }
    shape(taz1, t1 + 100, t2); 
    if (tz >= 5){
      shape(taz2, t1 + 100, t2);
    }
    shape(taz1, t1 + 125, t2); 
    if (tz >= 6){
      shape(taz2, t1 + 125, t2);
    }
    shape(taz1, t1 + 150, t2);
    if (tz >= 7){
      shape(taz2, t1 + 150, t2);
    }
    if (tz >= 7.2){
      page = 3;
    }
  }
  else if (page == 3){
    cursor();
    shape(p3, 0, 0);
  }

}

void mousePressed(){
  if (page == 1){
    page = 2;
    startm = millis();
  }
  if (page == 2){
    score = score + 20;
    if (!pressed){
      pressed = true;
    }
  }
  if (page == 3){
    link("http://latimesblogs.latimes.com/lanow/2009/11/a-university-of-california-board-of-regents-committee-today-approved-a-series-of-controversial-increases-in-student-fees-that.html"); 
  }
}

void schoolpressed(){
  if (pressed){
    if ((mouseX > uclax) && (mouseX < (uclax + collegewidth))){
      if(schools[0].getheight()> -120){
        schools[0].setheight(schools[0].getheight()-25);
      }
      if(schools[0].getheight() <= -105){
        tz = tz + .2;
      }
      if(schools[0].getheight() >= 0){
        tz = tz + .2;
      }
    }
    if ((mouseX > ucsbx) && (mouseX < (ucsbx + collegewidth))){
      if(schools[1].getheight()> -120){
        schools[1].setheight(schools[1].getheight()-25);
        println("ucsbpressed");
      }
      if(schools[1].getheight() <= -105){
        tz = tz+.2;
      }
      if(schools[1].getheight() >= 0){
        tz = tz+.2;
      }
    }
    if ((mouseX > calx) && (mouseX < (calx + collegewidth))){
      if(schools[2].getheight()> -120){
        schools[2].setheight(schools[2].getheight()-25);
        println("calpressed");
      }
      if(schools[2].getheight() <= -105){
        tz = tz+.2;
      }
      if(schools[2].getheight() >= 0){
        tz = tz+.2;
      }
    }
    if ((mouseX > ucsdx) && (mouseX < (ucsdx + collegewidth))){
      if(schools[3].getheight()> -120){
        schools[3].setheight(schools[3].getheight()-25);
        println("ucsdpressed");
      }
      if(schools[3].getheight() <= -105){
        tz = tz+.2;
      }
      if(schools[3].getheight() >= 0){
        tz = tz+.2;
      }
    }
    if ((mouseX > ucscx) && (mouseX < (ucscx + collegewidth))){
      if(schools[4].getheight()> -120){
        schools[4].setheight(schools[4].getheight()-25);
        println("ucscpressed");
      }
      if(schools[4].getheight() <= -105){
        tz = tz+.2;
      }
      if(schools[4].getheight() >= 0){
        switch4 = true;
      }

    }
    pressed = false;

  }
  println(schools[4].getheight());
  println(switch4);
}


















