

//set variables
int x = 255;
int y = x;
PFont f;
PFont g;
//green location spawn
int ran_a = int(random(60,460)/2)*2;
int ran_b = int(random(90,450)/2)*2;
//red location spawns
int ran_1 = ran_a + int(random(15, 50));
int ran_2 = ran_b + int(random(15, 50));
int ran_3 = ran_a + int(random(15, 50));
int ran_4 = ran_b + int(random(15, 50));
int ran_5 = ran_a + int(random(-15, -50));
int ran_6 = ran_b + int(random(15, 50));
int ran_7 = ran_a + int(random(-15, -50));
int ran_8 = ran_b + int(random(15, 50));
int ran_9 = ran_a + int(random(15, 50));
int ran_10 = ran_b + int(random(-15, -50));
int ran_11 = ran_a + int(random(15, 50));
int ran_12 = ran_b + int(random(-15, -50));
int ran_13 = ran_a + int(random(-15, -50));
int ran_14 = ran_b + int(random(-15, -50));
int ran_15 = ran_a + int(random(-15, -50));
int ran_16 = ran_b + int(random(-15, -50));
int ran_17 = ran_a + int(random(15, 50));
int ran_18 = ran_b + int(random(15, 50));
int ran_19 = ran_a + int(random(-15, -50));
int ran_20 = ran_b + int(random(15, 50));
int ran_21 = ran_a + int(random(15, 50));
int ran_22 = ran_b + int(random(-15, -50));
int ran_23 = ran_a + int(random(-15, -50));
int ran_24 = ran_b + int(random(-15, -50));
//set the sword kills to false
boolean red1 = false;
boolean red2 = false;
boolean red3 = false;
boolean red4 = false;
boolean red5 = false;
boolean red6 = false;
boolean red7 = false;
boolean red8 = false;
boolean red9 = false;
boolean red10 = false;
boolean red11 = false;
boolean red12 = false;
//other stuff
int time = millis();
int timelevel = 30000;
int timerepeat = 0;
int timecurrent = millis();
int score = 0;
int scoreran = int(random(200,400));
int side = int(random(0,3));
int swordstart = millis();
int speed = 1;
//images
PImage care;
PImage charloss;
PImage charwin;
PImage spike;
PImage win;
PImage sword1;
PImage sword2;
PImage sword3;
PImage sword4;
PImage sword5;
PImage bison;


void setup() {
  //set images
  size(600, 600);
  noStroke();
  imageMode(CENTER);
 
 
  sword1 = loadImage("sword1.gif");
  sword2 = loadImage("sword2.BMP");
  sword3 = loadImage("sword3.BMP");
  sword4 = loadImage("sword4.BMP");
  sword5 = loadImage("sword5.BMP");
  care = loadImage("Zangief1.png");
  charloss = loadImage("gameover.png");
  charwin = loadImage("charwin2.png");
  win = loadImage("win2.png");
  spike = loadImage("spike.gif");
 bison = requestImage("bison1.jpg");
  //set fonts & image mode
  f = loadFont("Text.vlw");
  g = loadFont("ArialNarrow-10.vlw");
  imageMode(CENTER);
}

void draw() {
  fill(0);
  timecurrent = millis() - timerepeat;
  background(255);
  image(bison, 350, 400, width, height);
  rectMode(CENTER);
  //if won...
  if(x-15 <= ran_a && x+15 >= ran_a && y-15 <= ran_b && y+15 >= ran_b){
    //win screen
    background(255);
    image(charwin, 300, 250, width, height);
    textFont(f);
    text("YOU WON!",200,30);
    fill(0);
    
    textFont(g);
    text("Click to Exit", 200,50);
    text("C to Continue", 200,80);
    if(keyPressed && key == 'p' || key == 'P'){
      for(int z = 0; z == 0; z=z+1){
        saveFrame();
      }
    }
    //if clicked exit the program
    if(mousePressed){
      exit();
    } 
    if(key == 'c' || key == 'C'){
      //reset variables
      ran_a = int(random(10,490)/2)*2;
      ran_b = int(random(10,490)/2)*2;
      ran_1 = ran_a + int(random(15, 50));
      ran_2 = ran_b + int(random(15, 50));
      ran_3 = ran_a + int(random(15, 50));
      ran_4 = ran_b + int(random(15, -50));
      ran_5 = ran_a + int(random(-15, -50));
      ran_6 = ran_b + int(random(15, 50));
      ran_7 = ran_a + int(random(-15, -50));
      ran_8 = ran_b + int(random(15, 50));
      ran_9 = ran_a + int(random(15, 50));
      ran_10 = ran_b + int(random(-15, -50));
      ran_11 = ran_a + int(random(15, 50));
      ran_12 = ran_b + int(random(-15, -50));
      ran_13 = ran_a + int(random(-15, -50));
      ran_14 = ran_b + int(random(-15, -50));
      ran_15 = ran_a + int(random(-15, -50));
      ran_16 = ran_b + int(random(-15, -50));
      ran_17 = ran_a + int(random(15, 50));
      ran_18 = ran_b + int(random(15, 50));
      ran_19 = ran_a + int(random(-15, -50));
      ran_20 = ran_b + int(random(15, 50));
      ran_21 = ran_a + int(random(15, 50));
      ran_22 = ran_b + int(random(-15, -50));
      ran_23 = ran_a + int(random(-15, -50));
      ran_24 = ran_b + int(random(-15, -50));
      red1 = false;
      red2 = false;
      red3 = false;
      red4 = false;
      red5 = false;
      red6 = false;
      red7 = false;
      red8 = false;
      red9 = false;
      red10 = false;
      red11 = false;
      red12 = false;
      y = 255;
      x = 255;
      timelevel = timelevel - 2000;
      timerepeat = millis();
      score = score + (30 - timecurrent / 1000) ;
    }
  }
  //if you aren't winning
  else{
  //if lost
  if(x-15 <= ran_1 && x+15 >= ran_1 && y-15 <= ran_2 && y+15 >= ran_2 && red1 == false || time + timelevel <= millis() - timerepeat ||
     x-15 <= ran_3 && x+15 >= ran_3 && y-15 <= ran_4 && y+15 >= ran_4 && red2 == false ||
     x-15 <= ran_5 && x+15 >= ran_5 && y-15 <= ran_6 && y+15 >= ran_6 && red3 == false ||
     x-15 <= ran_7 && x+15 >= ran_7 && y-15 <= ran_8 && y+15 >= ran_8 && red4 == false ||
     x-15 <= ran_9 && x+15 >= ran_9 && y-15 <= ran_10 && y+15 >= ran_10 && red5 == false ||
     x-15 <= ran_11 && x+15 >= ran_11 && y-15 <= ran_12 && y+15 >= ran_12 && red6 == false ||
     x-15 <= ran_13 && x+15 >= ran_13 && y-15 <= ran_14 && y+15 >= ran_14 && red7 == false ||
     x-15 <= ran_15 && x+15 >= ran_15 && y-15 <= ran_16 && y+15 >= ran_16 && red8 == false ||
     x-15 <= ran_17 && x+15 >= ran_17 && y-15 <= ran_18 && y+15 >= ran_18 && red9 == false ||
     x-15 <= ran_19 && x+15 >= ran_19 && y-15 <= ran_20 && y+15 >= ran_20 && red10 == false ||
     x-15 <= ran_21 && x+15 >= ran_21 && y-15 <= ran_22 && y+15 >= ran_22 && red11 == false ||
     x-15 <= ran_23 && x+15 >= ran_23 && y-15 <= ran_24 && y+15 >= ran_24 && red12 == false   ){
    //do the losing screen
    background(255);
    if(keyPressed && key == 'p' || key == 'P'){
      for(int z = 0; z == 0; z=z+1){
        saveFrame();
      }
    }
    textFont(f);
    text("YOU LOST",200,30);
    fill(0);
   image(charloss, 300, 250, width, height);
    textFont(g);
    text("Click to Exit", 200,50);
    text("C to Continue", 200,80);
    if(keyPressed && key == 'p' || key == 'P'){
      for(int z = 0; z == 0; z=z+1){
        saveFrame();
      }
    }
    //if clicked exit
    if(mousePressed){
      exit();
    } 
    if(key == 'c' || key == 'C'){
      //variable reset
      ran_a = int(random(10,490)/2)*2;
      ran_b = int(random(10,490)/2)*2;
      ran_1 = ran_a + int(random(15, 50));
      ran_2 = ran_b + int(random(15, 50));
      ran_3 = ran_a + int(random(15, 50));
      ran_4 = ran_b + int(random(15, 50));
      ran_5 = ran_a + int(random(-15, -50));
      ran_6 = ran_b + int(random(15, 50));
      ran_7 = ran_a + int(random(-15, -50));
      ran_8 = ran_b + int(random(15, 50));
      ran_9 = ran_a + int(random(15, 50));
      ran_10 = ran_b + int(random(-15, -50));
      ran_11 = ran_a + int(random(15, 50));
      ran_12 = ran_b + int(random(-15, -50));
      ran_13 = ran_a + int(random(-15, -50));
      ran_14 = ran_b + int(random(-15, -50));
      ran_15 = ran_a + int(random(-15, -50));
      ran_16 = ran_b + int(random(-15, -50));
      ran_17 = ran_a + int(random(15, 50));
      ran_18 = ran_b + int(random(15, 50));
      ran_19 = ran_a + int(random(-15, -50));
      ran_20 = ran_b + int(random(15, 50));
      ran_21 = ran_a + int(random(15, 50));
      ran_22 = ran_b + int(random(-15, -50));
      ran_23 = ran_a + int(random(-15, -50));
      ran_24 = ran_b + int(random(-15, -50));
      red1 = false;
      red2 = false;
      red3 = false;
      red4 = false;
      red5 = false;
      red6 = false;
      red7 = false;
      red8 = false;
      red9 = false;
      red10 = false;
      red11 = false;
      red12 = false;
      y = 255;
      x = 255;
      timelevel = timelevel + 2000;
      timerepeat = millis();
      score = score - (timelevel/1000);
      side = int(random(0,3));
    }
  }
  else{
   //if key pressed do the following
   if(keyPressed){
    background(255);
    if(key == 'w' || key == 'W'){
      //move up
      y = y-1;
    }
    if(key == 'a' || key == 'A'){
      //move left
      x = x-1;
    }
    if(key == 's' || key == 'S'){
      //move down
      y = y+1;
    }
    if(key == 'd' || key == 'D'){
      //move right
      x = x+1;
    }
    if (key == 'f'|| key == 'F'){
      //do once, set swordstart to millis()
      for(int z = 0; z == 0; z=z+1){
        swordstart = millis();
      }
    }
  }
    //show the play screen
    fill(0);
    image(care,x,y);
    textFont(f);
    image(win,ran_a,ran_b);
    //if the spike has not been killed, display.
    if(!red1){
      image(spike,ran_1,ran_2);
    }
    if(!red2){
      image(spike,ran_3,ran_4);
    }
    if(!red3){
      image(spike,ran_5,ran_6);
    }
    if(!red4){
      image(spike,ran_7,ran_8);
    }
    if(!red5){
      image(spike,ran_9,ran_10);
    }
    if(!red6){
      image(spike,ran_11,ran_12);
    }
    if(!red7){
      image(spike,ran_13,ran_14);
    }
    if(!red8){
      image(spike,ran_15,ran_16);
    }
    if(!red9){
      image(spike,ran_17,ran_18);
    }
    if(!red10){
      image(spike,ran_19,ran_20);
    }
    if(!red11){
      image(spike,ran_21,ran_22);
    }
    if(!red12){
      image(spike,ran_23,ran_24);
    }
    text(timecurrent/1000,10,30);
    //if time is 1 letter long put text here
    if(timecurrent/1000 <= 9){
      text("/",24,30);
      text(timelevel/1000,30, 30);
    }
    //if time is 2 letters long put it here
    else{
      text("/",38,30);
      text(timelevel/1000,43, 30);
    }
    text("Get to the Choppa!!", 175, 30);
    text(score,450,30);
    textFont(g);
    text("Use W,A,S,D, F for swords,sword reduces score", 125,50);
    if(keyPressed && key == 'p' || key == 'P'){
      for(int z = 0; z == 0; z=z+1){
        saveFrame();
      }
    }
    //sword killing action
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_1 && x-12 >= ran_1 && y-10 <= ran_2 && y+10 >= ran_2 && red1 == false ){
      red1 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_3 && x-12 >= ran_3 && y-10 <= ran_4 && y+10 >= ran_4 && red2 == false ){
      red2 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_5 && x-12 >= ran_5 && y-10 <= ran_6 && y+10 >= ran_6 && red3 == false ){
      red3 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_7 && x-12 >= ran_7 && y-10 <= ran_8 && y+10 >= ran_8 && red4 == false ){
      red4 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_9 && x-12 >= ran_9 && y-10 <= ran_10 && y+10 >= ran_10 && red5 == false ){
      red5 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_11 && x-12 >= ran_11 && y-10 <= ran_12 && y+10 >= ran_12 && red6 == false ){
      red6 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_13 && x-12 >= ran_13 && y-10 <= ran_14 && y+10 >= ran_14 && red7 == false ){
      red7 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_15 && x-12 >= ran_15 && y-10 <= ran_16 && y+10 >= ran_16 && red8 == false ){
      red8 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_17 && x-12 >= ran_17 && y-10 <= ran_18 && y+10 >= ran_18 && red9 == false ){
      red9 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_19 && x-12 >= ran_19 && y-10 <= ran_20 && y+10 >= ran_20 && red10 == false ){
      red10 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_21 && x-12 >= ran_21 && y-10 <= ran_22 && y+10 >= ran_22 && red11 == false ){
      red11 = true;
      swordstart = 10000;
      score = score - 3;
    }
    if(millis() - swordstart <= 600 && millis() >= 400 && x-30 <= ran_23 && x-12 >= ran_23 && y-10 <= ran_24 && y+10 >= ran_24 && red12 == false ){
      red12 = true;
      swordstart = 10000;
      score = score - 3;
    }
    
    //sword animation
    if(millis() - swordstart <= 200 && millis() - swordstart != 0){
      image(sword1, x,y-15);
    }
    else{
      if(millis() - swordstart <=400){
        image (sword2, x-10, y-10);
      }
      else{
        if(millis() - swordstart <=600){
          image(sword3, x-14, y-2);
        }
        else{
          if(millis() - swordstart <=800){
            image(sword4, x-13, y+4);
          }
          else{
            if(millis() - swordstart <=1000){
              image(sword5, x-6, y+12);
            }
          }
        }
      }
    }
  }
  }
}


