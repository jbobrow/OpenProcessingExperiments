
import ddf.minim.*;
Minim minim = new Minim( this );
AudioPlayer player;
boolean playing;

PImage img;
PImage img2;

PFont font;
int startX = 200; //start button x pos
int startY = 280; // start button y pos
int startW = 200; //start button width
int startH = 75; // start button height

int questionCounter = 0;
String userChoice = "   ";
String wrongAnswer = "   ";

//wrong answer bank
String wA1 ="A careless zookeeper leaves the kangaroo cage open, and Greentoes O'Houlihan gets kicked to death in a comic style dust cloud.";
String wA2 ="Just as Greentoes O'Houlihan walks out of the store, a careless pizza delivery driver flattens him with a car. Order up.";
String wA3 ="After talking to the gumshoe, Greentoes ironically steps in gum while crossing the street. He looks down right as a bus turns the corner. SMOOSH!";
String wA4 ="After mentioning lost gold coins Greentoes O'Houlihan gets trampled by an angry soccer mob.";
String wA5 ="The barrista remembers Greentoes from last night and poisons his drink.";
String wA6 ="Greentoes tries to get his car out of the impound to check inside for the gold. He gets ripped to shreds by the gaurd dog. I its bite was meaner than its bark.";
String wA7 ="A drunken barfight breaks out and Greentoes gets capped with a broken bottle. One tequilla shot too many.";
String wA8 ="Greentoes O'Houlihan checks under a rainbow for his pot of gold.  All he finds is a falling metoer. SPLAT!";
String wA9 ="A sunny day at the beach digging for gold turns bad quickly for Greentoes when he is eaten by a shark.";

//start screen messages
String sm1 ="Choose Your Own"; //start message line 1
String sm2 ="Adventure:"; //start message line 2
String sm3 ="The Leprechaun's Gold"; // start message line 3
// victory message
String vic = "As Greentoes opens the door to the creepy basement, a rainbow explosion shoots out, showering him in hearts, stars, and rainbows!";

//choice bank
String c1 = "1. Super Market. He is chased out of the store by a mob of people after his lucky Charms";
String c2 = "2. Casino. Two bouncers toss him to the curb and shout 'Don't ever step foot in here again!' He calls the gambling hotline for help";
String c3 = "3. Disco. His poor dancing skills turn his green toes black and blue";
String c4 = "4. Police Station. He is wrongly identified as a bank robber when he mumbles something about stolen gold";
String c5 = "1. Bank. He then remembers he uses a metal pot instead of a bank to store his gold";
String c6 = "2. Mall, where one of Santa's elves had been attacked by a tiny man hours earlier. 'I should go...' he thought";
String c7 = "3. Playground. He accidentally gets taken to somebody's home, confused for their own red headed child";
String c8 = "4. Gentleman's Club. He tries to make it rain heats, stars, and rainbows. It doesn't work";
String c9 = "1. Zoo.";
String c10 = "2. Pizza Parlor.";
String c11 = "3. Office. A friend at work tells Greentoes about some voicemail and an angry coworker";
String c12 = "4. Private Detective.";
String c13 = "1. Stadium.  ";
String c14 = "2. Coffee Shop.";
String c15 = "3. School.";
String c16 = "4. Car Impound.";
String c17 = "1. Bar.";
String c18 = "2. Under A Rainbow.";
String c19 = "3. Beach.";
String c20 = "4. Creepy Basement.";


//result bank

int gameStage = 0; // stores the game state (start screen, in game, end screen)

void setup(){
  size(400,400);
  background(0,0,0);
  rectMode(CENTER);
  textAlign(CENTER);
  colorMode(HSB);
}

void draw(){
 //sets the gamestate (start screen, in game, end screen)
 if(gameStage == 0){
    startScreen();
  } else if (gameStage == 1){
    playGame();
  }else if (gameStage == 2){
    gameOver();
  }

}

void mouseClicked(){
  startBox(); //run when mouse is clicked in the start box
}

void startScreen(){
  rectMode(CENTER);
  textAlign(CENTER);
  fill(255);
  font = loadFont("pixel.vlw");
  textFont(font,25);
  text(sm1, startX, 60); 
  text(sm2, startX, 100); 
  fill(#3EAD2D);
  text(sm3, startX, 160); 
  startBox();
}

void startBox(){
  if(gameStage != 1 ){
     if((mouseX > startX-startW/2 && mouseX < startX+startW/2)  &&  (mouseY > startY-startH/2 && mouseY < startY+startH/2)){
     fill(255); 
     rect(startX,startY,startW,startH); 
     fill(0);
     textSize(25);
     text("START", startX, startY+11);
       if (mousePressed == true){
         gameStage = 1;
         player = minim.loadFile("wiskey.mp3", 512);
         player.loop();
         playing = true;
       }
     } else  {
     fill(0);
     strokeWeight(5);
     stroke(255);
     rect(startX,startY,startW,startH); 
     fill(255);
     textSize(25);
     text("START", startX, startY+11); 
     gameStage = 0;
     } 
  }
}

void question(){
 // println("On question " + questionCounter + " with choice " + userChoice);

//question bank
String q1 = "Greentoes O'Houlihan woke up this morning with a hang over, and he can't find his gold.  Help him retrace his steps to find it. Where should he look first?";
String q2 = "Greentoes O'Houlihan's luck runs dry at the " + userChoice.substring(3) + ". Where should he search next?";
String q3 = "Greentoes is getting desperate for his gold so he searches the " + userChoice.substring(3) +  ". Where should he look now?";
String q4 = "After getting a tip off at the office about a voice mail he left last night, Greentoes O'Houlihan stops by HR for harassment training. Where should he go next?";
String q5 = "Greentoes O'Houlihan is hot on the trail of his gold after visiting the school. Where does he think he will find it?";
String q6 = "As Greentoes opens the door to the creepy basement, a rainbow explosion shoots out, showering him in hearts, stars, horseshoes!";

 switch (questionCounter) {
   case 0:
     fill(255);
     textSize(15);
     textAlign(LEFT);
     text(q1, startX, startY-40, 360, 400);
     break;
   case 1:
     fill(255);
     textAlign(LEFT);
     text(q2, startX, startY-40, 360, 400);
     break;
   case 2:
     fill(255);
     textAlign(LEFT);
     text(q3,  startX, startY-40, 360, 400);
     break;
   case 3:
     fill(255);
     textAlign(LEFT);
     text(q4,  startX, startY-40, 360, 400);
     break;
   case 4:
     fill(255);
     textAlign(LEFT);
     text(q5,  startX, startY-40, 360, 400);
     break;
    case 5:
     noStroke();
     fill(random(255), 255, 255); // HSB Hue Saturation Brightness
     rect(232, 135, 10, 350);
     fill(random(255), 255, 255); // HSB Hue Saturation Brightness
     rect(242, 135, 10, 350);
     fill(random(255), 255, 255); // HSB Hue Saturation Brightness
     rect(252, 135, 10, 350);
     fill(random(255), 255, 255); // HSB Hue Saturation Brightness
     rect(262, 135, 10, 350);
     fill(random(255), 255, 255); // HSB Hue Saturation Brightness
     rect(272, 135, 10, 350);
     img = loadImage("greentoes.png");
     image(img, 50,200);
     img = loadImage("pot.png");
     image(img, 225,300);
     fill(255);
     textAlign(LEFT);
     text(q6,  startX, startY-40, 360, 400);
    
     break;
  }
}

void choices(){
  switch (questionCounter) {
   case 0:
     fill(#3EAD2D);
     textSize(15);
     textAlign(LEFT);
     text(c1.substring(0,15), 20, 250);
     text(c2.substring(0,9), 20, 275);
     text(c3.substring(0,8), 20, 300);
     text(c4.substring(0,17), 20, 325);
     if (keyPressed){
        switch(key){
           case 49: 
             userChoice = c1;
             questionCounter++;
             delay(200);
             break;
           case 50:
             userChoice = c2;
             questionCounter++;
             delay(200);
             break;
           case 51:
             userChoice = c3;
             questionCounter++;
             delay(200);
             break;
           case 52: 
             userChoice = c4;
             questionCounter++;
             delay(200);
             break;
        }
     }
     break;
   case 1:
     fill(#3EAD2D);
     textSize(15);
     textAlign(LEFT);
     text(c5.substring(0,7), 20, 250);
     text(c6.substring(0,7), 20, 275);
     text(c7.substring(0,13), 20, 300);
     text(c8.substring(0,19), 20, 325);
     if (keyPressed){
        switch(key){
           case 49: 
             userChoice = c5;
             questionCounter++;
             delay(200);
             break;
           case 50:
             userChoice = c6;
             questionCounter++;
             delay(200);
             break;
           case 51:
             userChoice = c7;
             questionCounter++;
             delay(200);
             break;
           case 52: 
             userChoice = c8;
             questionCounter++;
             delay(200);
             break;
        }
     }
     break;
   case 2:
     fill(#3EAD2D);
     textSize(15);
     textAlign(LEFT);
     text(c9.substring(0,6), 20, 250);
     text(c10.substring(0,15), 20, 275);
     text(c11.substring(0,9), 20, 300);
     text(c12.substring(0,20), 20, 325);
     if (keyPressed){
        switch(key){
           case 49: 
             userChoice = c9;
             wrongAnswer = wA1;
             gameStage = 2;
             delay(200);
             break;
           case 50:
             userChoice = c10;
             wrongAnswer = wA2;
             gameStage = 2;
             delay(200);
             break;
           case 51:
             userChoice = c11;
             questionCounter++;
             delay(200);
             break;
           case 52: 
             userChoice = c12;
             wrongAnswer = wA3;
             gameStage = 2;
             delay(200);
             break;
        }
     }
     break;
   case 3:
     fill(#3EAD2D);
     textSize(15);
     textAlign(LEFT);
     text(c13.substring(0,10), 20, 250);
     text(c14.substring(0,14), 20, 275);
     text(c15.substring(0,9), 20, 300);
     text(c16.substring(0,14), 20, 325);
     if (keyPressed){
        switch(key){
           case 49: 
             userChoice = c13;
             questionCounter++;
             delay(200);
             break;
           case 50:
             userChoice = c14;
             questionCounter++;
             delay(200);
             break;
           case 51:
             userChoice = c15;
             questionCounter++;
             delay(200);
             break;
           case 52: 
             userChoice = c16;
             questionCounter++;
             delay(200);
             break;
        }
     }
     break;
   case 4:
     fill(#3EAD2D);
     textSize(15);
     textAlign(LEFT);
     text(c17.substring(0,6), 20, 250);
     text(c18.substring(0,18), 20, 275);
     text(c19.substring(0,8), 20, 300);
     text(c20.substring(0,18), 20, 325);
     if (keyPressed){
        switch(key){
           case 49: 
             userChoice = c17;
             questionCounter++;
             delay(200);
             break;
           case 50:
             userChoice = c18;
             questionCounter++;
             delay(200);
             break;
           case 51:
             userChoice = c19;
             questionCounter++;
             delay(200);
             break;
           case 52: 
             userChoice = c20;
             questionCounter++;
             //victory();
             delay(200);
             break;
        }
     }
     break;
  }
  
}

void answer(){
  
  
}

void resetGame(){
  background(0);
  gameStage = 0;
  questionCounter = 0;
 
}

void playGame(){
  background(0);
  question();
  choices();
}

void gameOver(){
  background(0);
  fill(255);
  textSize(15);
  textAlign(LEFT);
  text(wrongAnswer, startX, startY-40, 360, 400);
  textAlign(CENTER);
  textSize(30);
  fill(255,0,0);
  text("GAME OVER", startX, startY );
  textSize(10);
  fill(255);
  text("(press 'R' to reset)", startX, startY+20 );
}



//various navigation controls
void keyPressed(){
  if (key == 'r' || key == 'R'){
  resetGame();
    if(playing == true ){
    player.close();
    playing = false;
    }
   }
  if (key == 'z'){
     questionCounter =+ 5;
     
  } 
  if (gameStage == 0 && key == ENTER){
    gameStage++;
    player = minim.loadFile("wiskey.mp3", 512);
    playing = true;
    player.loop();
  }
  if(questionCounter >=0 && key == BACKSPACE){
     background(0);    
     questionCounter--;  
     println(questionCounter);
    
  }
  if(questionCounter == -1 && key == BACKSPACE){
    resetGame();
    if(playing == true ){
      player.close();
      playing = false;
    }
  }
}





