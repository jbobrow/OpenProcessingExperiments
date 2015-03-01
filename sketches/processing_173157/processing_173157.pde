
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/106774*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Aoba character;
clones clones1;
int highScore=0;

PImage aDown,usui;

Kojaku character2;
clone2 clones2;
int highScore2;

//PImage Kojaku;

void setup(){
  size(1023, 575);
  frameRate(14);
  //player1
  character = new Aoba();
  clones1 = new clones();
  
  //player2
  character2 = new Kojaku();
  clones2 = new clone2();

  
 
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  usui=requestImage("Background.jpg");
  aDown=requestImage("aobaFront.png");
  highScore=0;
  //Kojaku=requestImage("KojakuFront.png");
  highScore2 = 0;
   }



void draw(){
  image(usui,0,0,width,height);
  drawScoreboard();
  
  character.move();
  character.display();
  clones1.display();
 
  if( dist(clones1.xpos, clones1.ypos, character.xpos.get(0), character.ypos.get(0)) < character.sideways ){
    clones1.reset();
    character.addLink();
  }

  
  if(character.amount > highScore){
    highScore= character.amount;
  }
    drawScoreboard2();
  
  character2.move();
  character2.display2();
  clones2.display2();
  
  
  if( dist(clones2.xpos, clones2.ypos, character2.xpos.get(0), character2.ypos.get(0)) < character2.sideMove ){
    clones2.reset();
    character2.addLink();
  }
  
  if(character2.lengthh > highScore2){
    highScore2= character2.lengthh;
  }
}


void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
     character.direction = "left";
 
  }
    if(keyCode == RIGHT){
    
      character.direction = "right";
    }
    if(keyCode == UP){
     
      character.direction = "up";
    }
    if(keyCode == DOWN){
    
      character.direction = "down";
    }
  }
}
void keyPressed(){
 
    if(key=='a'||key=='A'){
      character2.direct = "left";
    }
    if(key=='d'||key=='D'){
      character2.direct = "right";
    }
    if(key=='w'||key=='W'){
      character2.direct = "up";
    }
    if(key=='s'||key=='S'){
      character2.direct = "down";
    }
  }


void drawScoreboard(){
  // All of the scode for code and title
  
 /* fill(250, 0, 250);
  textSize(65);
  text( "text here", width/2, 80);
  fill(250, 0, 250);
  textSize(20);
  text( "game title", width/2, 140);
  //
  */
  // draw scoreboard
  stroke(#9D0A0A);
  fill(#0A4D9D);
  rect(90, 70, 160, 80);
  fill(255);
  textSize(15);
  text( "High Score: "+highScore, 70, 50);

  
  fill(255);
  textSize(15);
  text( "Score: "+character.amount, 70, 70);
  text("Aoba-Player1",65,85);
}

void drawScoreboard2(){
  // All of the scode for code and title
  
  /*fill(250, 0, 250);
  textSize(65);
  text( "Kojaku Game", width/2, 80);
  fill(250, 0, 250);
  textSize(20);
  text( "By: Katherine<3Quinlivan", width/2, 140);
  
  */
  
  // draw Scoreboard2
  stroke(179, 140, 198);
  fill(#6C0B22);
  rect(900, 70, 160, 80);
  fill(255);
  textSize(15);
  text( "Score: " + character2.lengthh, 910, 50);
  
  fill(255);
  textSize(15);
  text( "High Score: " + highScore2, 910, 65);
  text("Kojaku-Player2",905,85);
}

class clones{
  
  // define varibles
  float xpos, ypos;
  
  
  
  //constructor
  clones(){
    xpos = random(175, width - 175);
    ypos = random(175, height - 175);
  }

  // functions
 void display(){
   
   fill(#20C5E0);
   ellipse(xpos, ypos,17,17);
 }
 
 
 void reset(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
 }   
}

class clone2{
  
  // define varibles
  float xpos, ypos;
  
  
  
  //constructor
  clone2(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
  
  
  // functions
 void display2(){
   
   fill(190,0,100);
   ellipse(xpos, ypos,17,17);
 }
 
 
 void reset(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
 }   
}

/////////////////////////////////////

/////////////////////////////////////
class Aoba{
  
  //define varibles
  int amount;
  float sideways;
  String direction; 
  ArrayList <Float> xpos, ypos;
  
  // constructor
  Aoba(){
    amount = 1;
    sideways = 32;
    direction = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( random(width) );
    ypos.add( random(height) );
  }
  
  // functions
  
  
  void move(){
   for(int i = amount - 1; i > 0; i = i -1 ){
    xpos.set(i, xpos.get(i - 1));
    ypos.set(i, ypos.get(i - 1));  
   } 
   if(direction == "left"){
    
     xpos.set(0, xpos.get(0) - sideways);
   }
   if(direction == "right"){
     
     xpos.set(0, xpos.get(0) + sideways);
   }
   
   if(direction == "up"){
   
     ypos.set(0, ypos.get(0) - sideways);
  
   }
   
   if(direction == "down"){
     ypos.set(0, ypos.get(0) + sideways);
   }
   xpos.set(0, (xpos.get(0) + width) % width);
   ypos.set(0, (ypos.get(0) + height) % height);
   
    // check if hit itself and if so cut off the tail
    if( checkHit() == true){
      amount = 1;
      float xtemp = xpos.get(0);
      float ytemp = ypos.get(0);
      xpos.clear();
      ypos.clear();
      xpos.add(xtemp);
      ypos.add(ytemp);
    }
  }
  
  
  
  void display(){
    for(int i = 0; i <amount; i++){
  
 image(aDown, xpos.get(i),ypos.get(i),sideways,sideways); 
}   
  }
  
  
  void addLink(){
    xpos.add( xpos.get(amount-1) + sideways);
    ypos.add( ypos.get(amount-1) + sideways);
    amount++;
  }
  
   boolean checkHit(){
    for(int i = 1; i < amount; i++){
     if( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sideways){
       return true;
     } 
    } 
    return false;
   } 
}

class Kojaku{
  
  //define varibles
  int lengthh;
  float sideMove;
  String direct; 
  ArrayList <Float> xpos, ypos;
  
  // constructor
  Kojaku(){
    lengthh = 1;
    sideMove = 32;
    direct = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( random(width) );
    ypos.add( random(height) );
  }
  
  // functions
  
  
  void move(){
   for(int i = lengthh - 1; i > 0; i = i -1 ){
    xpos.set(i, xpos.get(i - 1));
    ypos.set(i, ypos.get(i - 1));  
   } 
   if(direct == "left"){
     xpos.set(0, xpos.get(0) - sideMove);
   }
   if(direct == "right"){
     xpos.set(0, xpos.get(0) + sideMove);
   }
   
   if(direct == "up"){
     ypos.set(0, ypos.get(0) - sideMove);
  
   }
   
   if(direct == "down"){
     ypos.set(0, ypos.get(0) + sideMove);
   }
   xpos.set(0, (xpos.get(0) + width) % width);
   ypos.set(0, (ypos.get(0) + height) % height);
   
    // check if hit itself and if so cut off the tail
    if( checkHit() == true){
      lengthh = 1;
      float xtemp = xpos.get(0);
      float ytemp = ypos.get(0);
      xpos.clear();
      ypos.clear();
      xpos.add(xtemp);
      ypos.add(ytemp);
    }
  }
  
  
  
  void display2(){
    for(int i = 0; i <lengthh; i++){
      stroke(179, 140, 198);
      fill(#CB0C39, map(i-1, 0, lengthh-1, 250, 50));
    //  image(Kojaku(xpos.get(i), ypos.get(i), sideMove, sideMove));
          rect(xpos.get(i), ypos.get(i), sideMove, sideMove);
    }  
  }
  
  
  void addLink(){
    xpos.add( xpos.get(lengthh-1) + sideMove);
    ypos.add( ypos.get(lengthh-1) + sideMove);
    lengthh++;
  }
  
   boolean checkHit(){
    for(int i = 1; i < lengthh;i++){
     if( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sideMove){
       return true;
     } 
    } 
    return false;
   } 
}
//////////////////////////////////



