
  //KIRA SULER
  //PROJECT 6: PLAY
  //12/2/10
  //Thanks to Winter and Spring 2010 Interactivity students for minor borrowed code
  
  
  import ddf.minim.*;
 
  Minim minim;
  AudioPlayer dizzyG;

  int page = 1;
  int circleD = 28;
  int score = 0;
  int scoreTrigger = 0;
  int reachBottom = 0;
  
  boolean shoot = false;
  boolean move = true;
  
  PImage opener;
  PImage end;
  PImage dizzy;
  PImage ball;
  PImage notes;
  PImage redbox;
  
  PFont type;
  PFont bigType;
  PFont biggestFont;
  
  float playerY = 480.0;
  float playerWidth = 100.0;
  int randOm(){
    return int(random(640));
  }
  
  int[] circleX = { randOm(), randOm(), randOm(), randOm(), randOm() };
  int[] circleY = { 0, 0, 0, 0, 0 };
  
  
  //setup----------------------------------------------------------------
  void setup(){
    size(640,480);
    smooth();
    
    minim = new Minim(this);
    dizzyG = minim.loadFile("Gillespie, Dizzy - 03 - Jungla.mp3");
  
    opener = loadImage("opener.png");
    end = loadImage("end.png");
    dizzy = loadImage("dizzy.png");
    ball = loadImage("ball.png");
    notes = loadImage("notes.png");  
    redbox = loadImage("redbox.png");
    
    type = loadFont("Futura-CondensedExtraBold-28.vlw");
    bigType = loadFont("Futura-CondensedExtraBold-40.vlw");
    biggestFont = loadFont("Futura-CondensedExtraBold-65.vlw");
    
    frameRate(30);
  }
  
  
  //draw----------------------------------------------------------------
  void draw(){
//    println(page);

  if (page == 1){
    image(opener, 0, 0);
    int left = 11;
    int right = 257;
    int top = 420;
    int bottom = 457;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
      image(redbox, 0, 0);
      page = 2;
      move = false;
    }
    
  }
  }

   else if(page == 2){
    
    image(notes, 0, 0);
      
      fill(0);
      image(dizzy, mouseX-175, 293);
//      ellipse(mouseX, playerY, playerWidth, playerWidth)
      
            if(shoot==true){
        lazer(mouseX);
        shoot = false;
      }
      
      fill(255,0,0);
      strokeWeight(2);
      stroke(color(255,0,0));
     
      //TEXT INSTRUCTIONS
      textFont(bigType);
      fill(255, 0, 0);
      text("DIZZY GILLESPIE!", 20, 70);
      textFont(type);
      text("USE YOUR JAZZ TO BLOW THESE BALLS", 20,40);
      
      //SCORE
      textFont(biggestFont);
      fill(0);
      text(":", 485, 60);
      text(score, 510, 64);
  
      //TIMER
      textFont(type);
      fill(255, 0, 0);
      int s = second();
      int m = minute();
      int h = hour();
      String t = h + ":" + nf(m, 2) + ":"+ nf(s, 2);
      text(t, 21, 90);
    
      fallingCircles();   
    }
  }
  
  void keyPressed(){
    shoot = true;
    
    if ( key == 'p' ) dizzyG.play();
  }
  
  void fallingCircles(){  
    noStroke();
    fill(255, 252, 0, 100);
    for (int i=0; i<5; i++){
      image(ball, circleX[i], (circleY[i]++)*3);
      
//      ellipse(circleX[i], (circleY[i]++)*3,
//              circleD, circleD);
//      if(circleY[i] == 480){
//        endGame();
//      }
      if(circleY[i] == 480){
        endGame();
      }
    }
  }
  
  void lazer(int shotX){

    boolean hit = false;
    for (int i = 0; i < 5; i++){
      if((shotX >= (circleX[i]-50/2)) && 
         (shotX <= (circleX[i]+50/2))){
        hit = true;
        println("a");
        strokeWeight(4);
        line(mouseX, 480, mouseX, circleY[i]);
        image(ball, circleX[i], (circleY[i]), 50, 50);
//        ellipse(circleX[i], (circleY[i]),
//                circleD+25, circleD+25);
        circleX[i] = randOm();
        circleY[i] = 0;
      }    
    }
    
    if(hit == true){
      score ++;
    }  
  }
  
  
  void endGame(){
    image(end, 0, 0);
    textFont(biggestFont);
    fill(0);
    text(score + "!", 480, 312);
    noLoop();
  }
  



