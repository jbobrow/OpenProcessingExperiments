
int clickCount = 0;
int spaceCount = 0;
int timer = 0;
int player1 = 0;
int player2 = 0;
int player3 = 0;
int simonPosition;
PFont winner, title;
PImage bg;

int scene = 1;




void setup() {
  bg= loadImage("background.jpg");
  image(bg,0,0);
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  
  smooth();
  stroke(0);
  strokeWeight(8);
  simonPosition = int(random(1,5));
  winner = loadFont("winner.vlw");
  title = loadFont("title.vlw");
  textFont(winner);
  timer=180;
}

void draw() {
  background(255);
  image(bg,0,0);
 
  
  
  // CLICK TO START
  if(scene == 1) {
    // Players
    pushMatrix();
    scale(0.5);
    translate(width/2+380, height/2-580);
    player1();
    player2();
    player3();
    popMatrix();
    
    // title
    fill(253,81,192);
    textFont(title);
    text("MAMA SAYS", width/2-370, height/2-200);
    
    // Simon (aka Mama)
    translate(-50,-50);
    pushMatrix();
    //translate(0, -250);
    //translate(-260, -60);
    translate(-90, 220);
    scale(1.8);
    Simon(0);
    popMatrix();
    
    // Controls
    pushMatrix();
    translate(-120, 75);
    textFont(winner, 48);
    text("Controls:", width/2-200, height/2+50);
    fill(64, 219, 168);
    text("player 1: ' A '", width/2-200, height/2+90);
    fill(253,81,0);
    text("player 2: ' SPACEBAR '", width/2-200, height/2+130);
    fill(0,81,192);
    text("player 3: ' L '", width/2-200, height/2+170);

    // Click to Start
    fill(255,0,0);
    textFont(winner, 55);
    text("CLICK TO START", width/2-200, height/2-15);
    popMatrix();
    
    // Story
    fill(0);
    translate(-145, 10);
    textFont(winner, 26);
    translate(-255, -100);
    text("Mama and her little guys are playing a simple game of \"Mama Says\".");
    translate(-555, 30);
    text("Use the following keys to change the position of your little guy to match Mama's position."); 
    translate(-730, 30);
    text("Match with Mama and you will win! This is a positive game so if you lose, no worries... "); 
    translate(-695, 30);
    text("just try again!");
    

    


  }
  // MODE 1
  else if(scene == 2) {

    println(timer);
    textFont(winner, 48);

    if (timer > 5.5 * 60) {
      simonPosition = int(random(1,5));
      println("SWITCH! to " +simonPosition);
      timer = 0;
      player1 = 0;
      player2 = 0;
      player3 = 0;
    } 
    else if (timer > 3 * 60 ) {
      endScreen();
    } 
    else {
      
      pushMatrix(); 
      scale(1.25);
      translate(-80,0);
      fill(253,81,192);
      Simon(simonPosition);
      popMatrix();

      player1();
      player2();
      player3();
    }
    timer++;
  }
}



void mousePressed() {
  scene = 2;
// player2++;
// if (player2 == 5){
// player2 = 0;
// }
}
void keyPressed() {
  if (key == 'a') {
    player1++;
    if (player1 == 5) {
      player1 = 0;
    }
  } 
  else if (key == 'l') {
    player3++;
    if (player3 == 5) {
      player3 = 0;
    }
  }
  else if (key == ' ') {
    player2++;
    if (player2 == 5) {
      player2 = 0;
    }
  }
}



void endScreen() {
     //shinning
     float h1= random(100,360);
     float s1=100;
     float b1=100;
  
  textFont(winner);
  if (player1 == simonPosition) {
    println("player 1 wins");
    fill(h1,s1,b1);
    text ("You Win!", 70, 550);
  } 
  if (player2 == simonPosition) {
    println("player 2 wins");
    fill(h1,s1,b1);

    
    text ("You Win!", 320, 550);
  } 
  if (player3 == simonPosition) {
    println("player 3 wins");
    fill(h1,s1,b1);
    
    text ("You Win!", 560, 550);
    
  } 
  pushMatrix(); 
  scale(1.25);
  translate(-80,0);
  fill(253,81,192);
  Simon(0);
  popMatrix();

  player1();
  player2();
  player3();

  int countdown = ceil(map(timer, 3*60, 5.5*60, 3, 0));
  fill (0);
  text(countdown, width/2, height/2);
}




void Simon(int position) {
  // body 
  strokeWeight(5);
  ellipse(width/2, 100, 100, 100);

  if (position == 0) { // WIP -> / \ (Rest Position)
    // L Arm
    pushMatrix();
    translate(width/2-70,110);
    line(0, 30, 20, 0);
    popMatrix();

    // R Arm
    pushMatrix();
    translate(width/2+70+10,110);
    rotate(radians(90));
    line(0, 30, 20, 0);
    popMatrix();

    // legs
    strokeWeight(6);
    pushMatrix();
    translate(350,150);
    line(35,0, 35,35);
    translate(35,0);
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 1) { // DONE -> \ \ (L - up, R - down)
    // L Arm
    pushMatrix();
    translate(width/2-80,20);
    line(0, 60, 30, 80);
    popMatrix();

    // R Arm
    pushMatrix();
    translate(width/2+70+10,110);
    rotate(radians(90));
    line(0, 30, 20, 0);
    popMatrix();

    // legs
    strokeWeight(6);
    pushMatrix();
    translate(350,150);
    line(35,0, 35,35);
    translate(35,0);
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 2) { // WIP -> \ /
    // L Arm
    pushMatrix();
    translate(width/2-80,20);
    line(0, 60, 30, 80);
    popMatrix();

    // R Arm
    pushMatrix();
    translate(width/2+70,110);
    rotate(-PI);
    line(0, 30, 20, 0);
    popMatrix();

    // legs
    strokeWeight(6);
    pushMatrix();
    translate(350,150);
    line(35,0, 35,35);
    translate(35,0);
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 3) { // WIP -> arms \ / ; legs | \
    // L Arm
    pushMatrix();
    translate(width/2-80,20);
    line(0, 60, 30, 80);
    popMatrix();

    // R Arm
    pushMatrix();
    translate(width/2+70,110);
    rotate(-PI);
    line(0, 30, 20, 0);
    popMatrix();

    // legs
    strokeWeight(6);
    pushMatrix();
    translate(350,150);
    line(35,0, 35,35);
    popMatrix();
    pushMatrix();
    translate(350+55,150+20);
    rotate(radians(-50));
    line(35,0, 35,35);
    popMatrix();
  }
  else if (position == 4) { // WIP -> arms \ / ; legs / \
    // L Arm
    pushMatrix();
    translate(width/2-80,20);
    line(0, 60, 30, 80);
    popMatrix();

    // R Arm
    pushMatrix();
    translate(width/2+70,110);
    rotate(-PI);
    line(0, 30, 20, 0);
    popMatrix();

    // legs
    strokeWeight(6);
    pushMatrix();
    translate(350-10,150-38);
    rotate(radians(50));
    line(35,0, 35,35);
    popMatrix();
    pushMatrix();
    translate(350+55,150+20);
    rotate(radians(-50));
    line(35,0, 35,35);
    popMatrix();
  }
}



void player1() {

  pushMatrix();
  translate(-250, 300);
  fill(64, 219, 168);
  Simon(player1);
  popMatrix();
}



void player2() {
  pushMatrix();
  translate(0, 300);
  fill(180,90,60);
  Simon(player2);
  popMatrix();
}



void player3() {
  pushMatrix();
  translate(250, 300);
  fill(0,81,192);
  Simon(player3);
  popMatrix();
}


