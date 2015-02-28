
//import gifAnimation.*
int fishsNo = 150;
int p=0;
int f=0;
int m=4;
basket basket = new basket();
Fish[] fishs = new Fish[300];
int fishsGot = 0;
int fishsDone = 0;
boolean menudone = false;
boolean instructiondone = false;
boolean gamedone = false;
float rotf = random(1, 20);
int rottenFish = int(rotf);
float goldf =2;
int pinkFish = int (goldf);
int blackFish = 5;
PImage startpage;
PImage pausepage;
PImage clouds;
PImage deadfish;
PImage instructions;
int j=0;
String [] a={"0"};
String highscore1="";
int highscore;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioSnippet effect;

void setup() {
  size(900, 600);
  minim = new Minim(this);
  
  // this loads mysong.wav from the data folder
  song = minim.loadFile("Good Time.mp3");
  effect = minim.loadSnippet("WaterDrop.mp3");
  
  //these are the images used in the game
  startpage = loadImage("theflyingfish.gif");
  pausepage = loadImage("gameresumed.jpg");
  deadfish = loadImage("dead-fish-hi.png");
  clouds = loadImage("clouds.jpg");
  instructions = loadImage("instructions.jpg");
  //this sets up the font to be used within the game
  PFont font;
 font = loadFont("Rockwell-Bold-48.vlw");
  textFont(font, 40);
  //this isto read the previous highscore from file
  // and storing its int value 
    String temp ="";
  String lines[]=loadStrings("score.txt");
    int num=lines.length;
        temp=lines[0];
        highscore1 =temp;
        highscore = Integer.parseInt(highscore1);
        
        
        
        
        
  //this fills the fishs[] array with given instances of class Fish
  for (int i = 0; i <300;i++) {
    fishs[i] = new Fish(400);
  }
}

void draw() {
  //this displays start screen if not already done
  if (menudone == false) {
    //basicSetup();
    menuSetup();
  }
  //if start screen has been passed, this carries out the rest of the game
  else {
    noCursor();
    song.play();
    // this if statement is for the pause and resume function
    // workings() here represent the normal workings of the game
    if(p==0){
      basicSetup();
    workings();
  }
  }
  // This is the pause function
    if(keyPressed ==true && (key=='p' || key=='P')){
    p = 1;
    image(pausepage,0,0);
    //Delay(3000);
    song.mute();
  }
    
  if(p == 1 && (keyPressed ==true && (key=='r' || key=='R'))){
    p= 0;
    basicSetup();
    song.unmute();
  }
}


void workings(){
  printScore();
    //this sets the rotten and pink fishs
    fishs[rottenFish].rotten = true;
    fishs[blackFish].black=true;
    fishs[pinkFish].pink = true;

    if(pinkFish<fishsNo-3){
      pinkFish+=3;
    }
    if(blackFish<fishsNo-3) {
      blackFish+=4;
    }
    //if the rotten fish is not caught, this runs the main game
    if (fishs[rottenFish].fishCaught == false) {
      basket.display();
      //this loop runs through once for each falling fish
      for (int i = 0; i<fishsNo;i++) {
     
        fishs[i].check();
        fishs[i].display();
        fishs[i].drop(m);
      }
    }
    resetCalcFishs();
    messageSelection();
    // if the user catches the rotten fish, the following is run
    if (fishs[rottenFish].fishCaught == true) {
      cursor();
      image(deadfish,(width/2)-150,height/3*2,225,225);
      //this sets the colour of exit button to red
      fill(200, 1, 1);
      stroke(0);
      strokeWeight(2);
      //this draws the exit button
      rect((width/2)-150, (height/2)-50, 300, 100);
      fill(0);
      textSize(42);
      text("EXIT", (width/2)-50, (height/2)+10);
      //this prints the 'exit message'
      text("You caught the rotten fish! Game Over!", 70, 200);
      //the following provides a 'mouseover' effect for the button
      if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
        if (mouseY >=((height/2)-50) && mouseY <=((height/2)+50)) {
          stroke(255);
          strokeWeight(6);
          fill(200, 1, 1);
          rect((width/2)-150, (height/2)-50, 300, 100);
          fill(255);
          text("EXIT", (width/2)-50, (height/2)+10);
        }
      }
    }
  }



//this prints the current score for the player
void printScore() {
  if (gamedone == false) {
    fill(0);
    textSize(14);
    text("Score = " + fishsGot, 10, 580);
    textSize(14);
    text("Click P to Pause",700,580);
  }
}

//this selects a message to give to the player depending on their
//final score
void messageSelection() {
  if (fishsDone >fishsNo-1 && f==0) {
    textSize(50);
    for(int a=0;a<100;a++){
    text("LEVEL 2",width/2-50,height/2);
    }
    fishsNo +=150;
    m += 3;
    f=1;
   //Delay(5000);
  }
  if(fishsDone >299){
    fill(0);
    if(fishsGot>highscore && j==0){
      highscore1= str(fishsGot);
      a[0] =highscore1;
      saveStrings("data/score.txt", a);
     j++; 
    }
    textSize(42);
    if(fishsGot>highscore) {
      text("New High Score !!!!!",random(250,255),random(450,455));
    }
    if(fishsGot<highscore) {
      text("High Score is : " + highscore1,250,450);
    }
    text("Your final score was: " + fishsGot, 180, 300);
    gamedone = true;
    if (fishsGot < 500) {
      text("That's pretty rubbish! Get better!", random(118, 122), random(348, 352));
      //exit();
    }
    if (fishsGot >= 500 && fishsGot < 1100) {
      text("That's a fairly good score, well done.", random(108, 112), random(348, 352));
      //exit();
    }
    if (fishsGot >=1100) {
      fill(random(256), random(256), random(256));
      text("Excellent score! You are now a legend!", random(108, 112), random(348, 352));
      //exit();
    }
  }
}


//this sets the number of fishs that have been 'done' to 0 and
//then recalculates the cuurent number of fishs that have
//been 'done'
void resetCalcFishs() {
  fishsDone = 0;
  for (int i = 0; i<fishsNo;i++) {
    fishsDone = fishsDone + fishs[i].fishValue;
  }
}

//this stipulates what happens when  the 'START' and
//'EXIT' buttons are pressed
void mouseClicked() {
  if (menudone == false && instructiondone == false) {
    if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
      if (mouseY >=((height/2)-25) && mouseY <=((height/2)+75)) {
        menudone = true;
      }
    }
    if (mouseX >=(width/2)-150 && mouseX <=((width/2)+150)) {
    if (mouseY >=((height/2)+100) && mouseY <=((height/2)+175)) {
      instructiondone = true;

    }
    }
  }
  if (fishs[rottenFish].fishCaught == true) {
    if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
      if (mouseY >=((height/2)-50) && mouseY <=((height/2)+50)) {
        exit();
      }
    }
  }
}


//this displays the start screen before the game commences
void menuSetup() {
  if(instructiondone == true){
    image(instructions,0,0);
  }
  else {
  background(clouds);
  image(startpage,0,0,width*2/3,height*2/3);
  fill(200, 1, 1);
  stroke(0);
  strokeWeight(2);
  rect((width/2)-150, (height/2)-25, 300, 100);
  rect((width/2)-150, (height/2)+100, 300, 75);
  fill(0);
  textSize(35);
  text("INSTRUCTIONS", (width/2)-135, (height/2)+150);
  text("START", (width/2)-70, (height/2)+35);
  if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
    if (mouseY >=((height/2)-25) && mouseY <=((height/2)+75)) {
      stroke(255);
      strokeWeight(6);
      fill(200, 1, 1);
      rect((width/2)-150, (height/2)-25, 300, 100);
      fill(255);
      text("START", (width/2)-70, (height/2)+35);
    }
  }
  if (mouseX >=(width/2)-150 && mouseX <=((width/2)+150)) {
    if (mouseY >=((height/2)+100) && mouseY <=((height/2)+175)) {
       stroke(255);
      strokeWeight(6);
      fill(200, 1, 1);
      rect((width/2)-150, (height/2)+100, 300, 75);
      fill(255);
      text("INSTRUCTIONS", (width/2)-135, (height/2)+150);
    }
  }
}
}


//this sets out the background for the game,
void basicSetup() {
  background(clouds);
  noStroke();
  fill(95, 211, 94);
  rect(0, 500, width, 100);
}

void keyPressed() {
  if(key=='b' || key=='B'){
    instructiondone=false;
  }
}


void Delay(int ms){
  int time = millis();
  while(millis()-time < ms);
}

  
void stop(){
  effect.close();
  song.close();
  minim.stop();
}


//class made for basket..
class basket {
  int basketEdge = 570;
  //this displays the basket in the position the player's mouse
  //is pointing to
  void display() { 
   
    strokeWeight(10);
    stroke(185, 162, 96);
    fill(185, 162, 96);
    quad(mouseX-20, 600, mouseX+20, 600, mouseX+40, basketEdge, mouseX-40, basketEdge);
  }
}


//This class is for all the fishes that will fall and caught by the basket
class Fish {
  float fishX;
  float fishY;
  float speed;
  float d;
  float edge;
  boolean fishCaught;
  int fishValue;
  boolean rotten;
  boolean pink;
  boolean black;

 Fish(int t) {
   
    //this randomly sets the x-position of the fish
    fishX = random(width/8, width/1.2);
    //this randomly sets the y-position of the fish, i.e.
    //it randomly chooses when the fishs will fall
    fishY = random(-10000);
    //this sets the default speed of the falling fish
    speed = 4;
    //this sets the diameter of the fish
    d = 40;
    //this sets the edge which will need to be touched for the
    //fish to be caught
    edge = t;
    //this sets the fish's 'value' to 0
    fishValue = 0;
    //this presets the fish to be neither rotten nor pink
    rotten = false;
    pink = false;
    black= false;
  }


  //this displays the fish
  void display() {
    //if the fish has not been caught, make it maroon
   if (fishCaught == false) {
     if (rotten == false) {
      fill(191, 10, 16);
      }
      //if the fish is rotten make it brown
      if (rotten==true) {
        fill(31, 206, 38);
      }
      
     if(black == true) {
       ellipse(fishX, fishY, d, d);
         ellipse(fishX+25, fishY+8, d-20,d-20);
         ellipse(fishX+25, fishY-8, d-20,d-20);
         fill(0);
         ellipse(fishX-6, fishY, d-36,d-35);
           ellipse(fishX-15, fishY, d-36,d-35);
                  ellipse(fishX-10, fishY+10, d-25,d-38);
                  //inside eyes/eyeballs
           fill(0,0,0);
            ellipse(fishX-6, fishY, d-37.5,d-37.5);
               ellipse(fishX-15, fishY, d-37.5,d-37.5);
          
      
               
      
        noStroke();
     }
       
      if (pink == true) {
        fill(2,55,157);
          ellipse(fishX, fishY, d+10, d+10);
         ellipse(fishX+25, fishY+8, d-10,d-10);
         ellipse(fishX+25, fishY-8, d-10,d-10);
         fill(255,255,255);
         ellipse(fishX-6, fishY-10, d-26,d-25);
           ellipse(fishX-15, fishY-10, d-26,d-25);
                  ellipse(fishX-10, fishY+10, d-25,d-38);
                  //inside eyes/eyeballs
           fill(0,0,0);
            ellipse(fishX-6, fishY-10, d-37.5,d-37.5);
               ellipse(fishX-15, fishY-10, d-37.5,d-37.5);
               noStroke ();
      }
    else {
        ellipse(fishX, fishY, d, d);
         ellipse(fishX+25, fishY+8, d-20,d-20);
         ellipse(fishX+25, fishY-8, d-20,d-20);
         fill(255,255,255);
         ellipse(fishX-6, fishY, d-36,d-35);
           ellipse(fishX-15, fishY, d-36,d-35);
                  ellipse(fishX-10, fishY+10, d-25,d-38);
                  //inside eyes/eyeballs
           fill(0,0,0);
            ellipse(fishX-6, fishY, d-37.5,d-37.5);
               ellipse(fishX-15, fishY, d-37.5,d-37.5);
          
      
               
      
        noStroke();
    }
      
    }
  }

  //this drops the fish
  void drop(int j) {
    //this increments the fishs position by its 'speed'
    fishY += j;
  }




  //this checks the current status of the fish
  void check() {
    //this checks if the fish has been caught in the basket
    if ((fishY)+d/2 >580 && (fishY)+d/2 < 610) {
      if (fishX < mouseX+40 && fishX > mouseX-40) {
        fishCaught = true;
        effect.play();
        //Delay(50);
         effect.rewind();
        //this sets the score given for each caught fish,
        //depending on whether it is pink or not
        if (pink == false) {
          fishsGot ++;
        }
        if(black == true) {
          fishsGot -=5;
        }
          
        if (pink == true ) {
          fishsGot +=5;
        }
        //if the caught fish is rotten, then the game is finished
        if (rotten == true) {
          gamedone = true;
        }
        //this sets the fish's value to 1 when it is caught
        fishValue = 1;
      }
    }
    //this sets the fish value to 1 if it falls off the screen
    if (fishY > 600) {
      fishValue = 1;
    }
  }
  }




