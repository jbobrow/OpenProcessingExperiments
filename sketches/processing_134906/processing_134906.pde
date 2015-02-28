

//TCNJ RECYCLE  - BY JASON ERDREICH
//TCNJ DEPARTMENT OF RESIDENTIAL EDUCATION AND HOUSING
//2013-2014 

//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//GLOBAL VARIABLES

int stage;
int velocity = 1;
PImage backgroundim;


//CLASSES
Bin b1; //b for Bin
Score s1; //s for Score
Timer t1; //t for timer
Welcome w1; // w for welcome
Yes y1; //y for yes
No n1; //n for no
Roscoe r1; // r for roscoe
Level l1; // l for level

//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//CLASSES

class Welcome { //OPEN CLASS WELCOME
  //add variables
    PImage welcomescreen;
    int welcometimer = 0;
  //add constructor
    Welcome() { //open constructor welcome
      welcomescreen = loadImage("welcome.png");
    }//close constructor welcome
  //add method
    void drawWelcome() { //open void drawwelcome
      welcometimer = millis()/1000;
      image(welcomescreen,0,0);
    }//close void drawwelcome
    void pressWelcome() { //open void press welcome
      if(mouseX > 97 && mouseX < 544 && mouseY > 391 && mouseY < 498 && mousePressed) {
        stage = 1; 
        t1.starttime = millis();
        t1.paused = false;}
    }//close void press welcome
} //CLOSE CLASS WELCOME

class Timer { //OPEN CLASS TIMER
  //add variables
    int starttime = 0;  
    int startseconds = 0;
    int timer = 0;
    int totaltime = 0;
    int supertime = 0;
    boolean paused = false;
    PFont font;
    String t = "Time Elapsed (Seconds): ";
  //add constructor
    Timer() { //open constructor timer
      font = createFont("DIN Condensed Bold.ttf",40); 
      starttime = millis(); 
    }//close constructor timer
  //add method
    void drawTimer() { //open void drawtimer
      fill(19,31,80);
      textFont(font);
      textSize(40);
      timer = millis()/1000-starttime/1000;
      if(paused ==false) {
        totaltime = timer; }
      supertime = totaltime;
      t = "Time Elapsed (Seconds):"  +supertime;
      text(t, 160, 40);
    }//close void drawtimer
}//CLOSE CLASS TIMER
    
class Score { //OPEN CLASS SCORE
  //add variables
    char nameanything = 's';
    String s = "Score: ";
    int score = 0;
    PFont font;
  
  //add constructor
    Score() { //open constructor Score
      font = createFont("DIN Condensed Bold.ttf",40);
    }//close constructor score
  //add method
    void drawScore() { //open void drawscore
      fill(19,31,80);
      textFont(font);
      textSize(40);
      s = "Score: "+score;
      text(s, 15, 40);
    }//close void drawscore

  void makeScore() { // open void makescore
  
  }//close void makescore
}//CLOSE CLASS SCORE

class Bin { //OPEN CLASS BIN
  //add variables
    PImage bin;
    float bx;
    float by;
  
  //add constructor
    Bin() { //open constructor bin
      bin = loadImage("bin.png");
      bx = width/2;
      by = 450;
    } //close constructor bin
  //add method
    void drawBin() { //open void drawbin
      image(bin, bx, by);
    }//close void draw bin
   
    void moveBin() { //open void movebin
       if(keyCode == LEFT && keyPressed == true) {//move bin left
         b1.bx = bx-4; }
       if(keyCode == RIGHT && keyPressed == true) { //move bin right
         b1.bx = bx+4; }
    }// close void movebin
} //close class bin

class Yes {//OPEN CLASS YES
  //add variables
    PImage ybottle;
    PImage ymilk;
    PImage ynews;
    PImage ysoda;
    float bottlex = random(0,500);
    float bottley = -150;
    float milkx = random(0,500);
    float milky = -350;
    float newsx = random(0,500);
    float newsy = -550;
    float sodax = random(0,500);
    float soday = -750;
  //add constructor
    Yes() { //open constructor yes
      ybottle = loadImage("ybottle.png");
      ymilk = loadImage("ymilk.png");
      ynews = loadImage("ynews.png");
      ysoda = loadImage("ysoda.png");
    }//close constructor yes
  //add method
    void drawYes() { //open void draw yes
      //bottle
        image(ybottle,bottlex,bottley);
        bottley = bottley + velocity;
        if(bottley > 700) {
           bottlex = random(0,500);
           bottley = -150 + random(0,20);
           bottley = bottley + velocity; }
       //milk
        image(ymilk,milkx,milky);
        milky = milky + velocity;
        if(milky > 700) {
           milkx = random(0,500);
           milky = -350 + random(0,20);
           milky = milky + velocity; }
       //news
        image(ynews,newsx,newsy);
        newsy = newsy + velocity;
        if(newsy > 700) {
           newsx = random(0,500);
           newsy = -550 + random(0,20);
           newsy = newsy + velocity; }
       //soda
        image(ysoda,sodax,soday);
        soday = soday + velocity;
        if(soday > 700) {
           sodax = random(0,500);
           soday = -750 + random(0,20);
           soday = soday + velocity; }
         
    }//close void draw yes
    void catchYes() {//open void catchyes
      if(bottlex > b1.bx + 30 && bottlex < b1.bx + 235 && bottley > b1.by && bottley < b1.by + 50) {
        s1.score = s1.score + 1;
        bottlex = -300; }
      if(milkx > b1.bx + 30 && milkx < b1.bx + 235 && milky > b1.by && milky < b1.by + 50) {
        s1.score = s1.score + 1; 
        milkx = -300; }
      if(newsx > b1.bx + 30 && newsx < b1.bx + 235 && newsy > b1.by && newsy < b1.by + 50) {
        s1.score = s1.score + 1; 
        newsx = -300; }
      if(sodax > b1.bx + 30 && sodax < b1.bx + 235 && soday > b1.by && soday < b1.by + 50) {
        s1.score = s1.score + 1; 
        sodax = -300;}
    }//close void catchyes
        
}//close class yes

class No {//OPEN CLASS No
  //add variables
    PImage nbag;
    PImage nbattery;
    PImage nfork;
    PImage npizza;
    float bagx = random(0,500);
    float bagy = -200;
    float batteryx = random(0,500);
    float batteryy = -400;
    float forkx = random(0,500);
    float forky = -600;
    float pizzax = random(0,500);
    float pizzay = -800;
  //add constructor
    No() { //open constructor yes
      nbag = loadImage("nbag.png");
      nbattery = loadImage("nbattery.png");
      nfork = loadImage("nfork.png");
      npizza = loadImage("npizza.png");
    }//close constructor yes
  //add method
    void drawNo() { //open void draw no
      //bag
        image(nbag,bagx,bagy);
        bagy = bagy + velocity;
        if(bagy > 700) {
           bagx = random(0,500);
           bagy = -200 + random(0,20);
           bagy = bagy + velocity; }
       //battery
        image(nbattery,batteryx,batteryy);
        batteryy = batteryy + velocity;
        if(batteryy > 700) {
           batteryx = random(0,500);
           batteryy = -400 + random(0,20);
           batteryy = batteryy + velocity; }
       //fork
        image(nfork,forkx,forky);
        forky = forky + velocity;
        if(forky > 700) {
           forkx = random(0,500);
           forky = - 600 + random(0,20);
           forky = forky + velocity; }
       //pizza
        image(npizza,pizzax,pizzay);
        pizzay = pizzay + velocity;
        if(pizzay > 700) {
           pizzax = random(0,500);
           pizzay = -800 + random(0,20);
           pizzay = pizzay + velocity; }
         
    }//close void draw no
    void catchNo() { //open void catchNo
      if(bagx > b1.bx + 20 && bagx < b1.bx + 160 && bagy > b1.by && bagy < b1.by + 5) {
           fill(100);
           textSize(300);
           textFont(s1.font);
           text("GAME OVER!",250,height/2);
           text("PRESS SPACE TO RESTART",150, 350); 
           velocity = 0;
           t1.paused = true;}
      if(batteryx > b1.bx + 20 && batteryx < b1.bx + 160 && batteryy > b1.by && batteryy < b1.by + 50) {
           fill(100);
           textSize(300);
           textFont(s1.font);
           text("GAME OVER!",250,height/2);
           text("PRESS SPACE TO RESTART",150, 350); 
           velocity = 0; 
           t1.paused = true;}
      if(forkx > b1.bx + 20 && forkx < b1.bx + 160 && forky > b1.by && forky < b1.by + 50) {
           fill(100);
           textSize(300);
           textFont(s1.font);
           text("GAME OVER!",250,height/2);
           text("PRESS SPACE TO RESTART",150, 350); 
           velocity = 0;
           t1.paused = true;}
      if(pizzax > b1.bx + 20 && pizzax < b1.bx + 160 && pizzay > b1.by && pizzay < b1.by + 50) {
           fill(100);
           textSize(300);
           textFont(s1.font);
           text("GAME OVER!",250,height/2);
           text("PRESS SPACE TO RESTART",150, 350);  
           velocity = 0;
           t1.paused = true;} 
    } // close void catch no 
}//close class No

class Roscoe { //OPEN CLASS ROSCOE
  //add variables
    PImage roscoe;
  //add constructor
    Roscoe() { //open constructor roscoe
      roscoe = loadImage("roscoe.png");
    } //close constructor roscoe  
  //add method
    void drawRoscoe() { //open void draw roscoe
      image(roscoe,0,0);
      t1.paused = true;
      velocity = 0;     
    }//close void draw roscoe
}//CLOSE CLASS ROSCOE

class Level { //OPEN CLASS LEVEL
  //add variables
    PImage roscoe;
    char nameanything = 'l';
    String l = "Level: ";
    int level = 0;
    PFont font;
    boolean levelup;
  //add constructor
    Level() { //open constructor level
      roscoe = loadImage("roscoe.png");
      font = createFont("DIN Condensed Bold.ttf",40);
      levelup = false;
    }//close constructor level
  //add method
    void drawLevel() { //open void drawlevel
      fill(19,31,80);
      textFont(font);
      textSize(40);
      l = "Level: "+level;
      text(l, 15, 90);
    }//close void drawlevel
    void splashLevel() { //open void splashLevel
      levelup = false;
      if((s1.score == 5 && level == 0)||(s1.score == 10 && level == 1)||(s1.score == 15 && level == 2)||(s1.score == 20 && level == 3)||(s1.score == 25 && level == 4)) { 
        levelup = true; }
      if(levelup == true) {
        image(roscoe,0,0);
        t1.paused = true;
        velocity = 0; }
    } // close void splashLevel
}//CLOSE CLASS LEVEL

//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//GAME STRUCTURE (SETUP & DRAW)

void setup() { //OPEN VOID SETUP
  size(600,600);
  //frameRate = 30;
  background(255);
  backgroundim = loadImage("background.png");
  stage = 0;
  
  //classes
  
  b1 = new Bin();
  s1 = new Score();
  t1 = new Timer();
  w1 = new Welcome();
  y1 = new Yes();
  n1 = new No();
  r1 = new Roscoe();
  l1 = new Level();
  
} //CLOSE VOID SETUP

void draw() { //OPEN VOID DRAW
  image(backgroundim,0,0);
  
  if(stage == 0) { //if stage 0 open
    w1.drawWelcome();
    w1.pressWelcome();
  }//if stage 0 close
  
  if(stage == 1) { //if stage 1 open
    image(backgroundim,0,0);
    b1.drawBin();
    b1.moveBin();
    s1.drawScore();
    s1.makeScore();
    t1.drawTimer();
    y1.drawYes();
    y1.catchYes();
    n1.drawNo();
    n1.catchNo();
    b1.drawBin();
    b1.moveBin();
    s1.makeScore();
    s1.drawScore();
    t1.drawTimer();
    l1.drawLevel();
    l1.splashLevel();
  }// if stage 1 close
  

}//CLOSE VOID DRAW

//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//KEYPRESS FUNCTIONS
void keyPressed(){ //OPEN KEYPRESSED
  
    if (key == ENTER) {
      l1.levelup = false; 
      t1.paused = false;  
      l1.level = l1.level + 1; 
      velocity = l1.level+1;} 
  
  if(key == ' ') { //space = restart
      stage = 1;
        velocity = 1;
        s1.score = 0;
        t1.starttime = millis();
        t1.paused = false;
        y1.bottlex = random(0,500);
        y1.bottley = -150 + velocity;
        y1.milkx = random(0,500);
        y1.milky = -350 + velocity;
        y1.newsx = random(0,500);
        y1.newsy = -550 + velocity;
        y1.sodax = random(0,500);
        y1.soday = -750 + velocity;
        n1.bagx = random(0,500);
        n1.bagy = -200 + velocity;
        n1.batteryx = random(0,500);
        n1.batteryy = -400 + velocity;
        n1.forkx = random(0,500);
        n1.forky = -600 + velocity;
        n1.pizzax = random(0,500);
        n1.pizzay = -800 + velocity;
        b1.bx = width/2;
        b1.by = 450;
     } //space = restart


}//CLOSE KEYPRESSED 








