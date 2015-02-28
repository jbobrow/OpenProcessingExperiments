
/* * Project Title: Shootting Game--Welcome to Sharks' Home!
 * Greated by Min FAN
 * Date: OCt.18th, 2012
 * Email: mfan1028@gmail.com
 
 *Description: My inspiration is from the simple game for children: rock, paper and scissors. I attempt to apply this interesting game mechanism into a shooting game.  
 In this game,  The user plays a role of a small fish who searches food(shrimps)in the ocean, however, he doesn’t realize he has already been in the sharps’ domain.  
 Therefore, two fightings will start. This poor fish needs to eat as many shrimps as possible to get enough energy to escape, but at the same time, 
 he also has to be very careful in case being caught by sharps around him. 
 
 This game is designed to make children have a basic philosophical idea of the world. Everything in the world is intricate and connected and with others.
 
 *References: 
 //music:Locklock_http://www.youtube.com/watch?v=8DRf4RN9zJE&feature=relmfu
 //The dropdownlist by controlIP5 is from the examples created by andreas schlegel, 2012,* www.sojamo.de/libraries/controlp5
 */

//Import the minim library
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
//Import the controlIP5 library
import controlP5.*;

/*Global variables*/
/*Declare the different game states*/
int PLAYING = 0;
int MAIN_MENU = 1;
int FAIL = 2;
int WIN = 3;
int gameState;
//Game socre
int score;
//What percentage of the final goal player has achieved
float perctg;
//Game time
int h=hour(), m=minute(), s=second(), tStart, tEnd;

/*Declare the fonts and pics*/
PFont headLineFont;
PFont descriptionFont;
PImage imgFish, imgShark, imgShrimp, imgBg, imgPlay, imgExit, imgPlayChange, imgExitChange;

/*Declare the background music*/
Minim minim;
AudioPlayer au_player1;

/*Declare the references of dropdownlist in ControlIP5 for controlling the game level*/
//Dropdownlist
ControlP5 cp5;
DropdownList d1;
//Game level
int level=0;

/*Declare the references for objects in each class*/
//Declare the reference named shripms for the arraylist
ArrayList shrimps;
//Declare the reference named sharks for the arraylist
ArrayList sharks;
//Declare the reference for the object of fish(Player)
Fish fish;


/*Game setup*/
void setup() {
  size (1200, 800);
  smooth();
  //Load the fonts for heading
  headLineFont = loadFont("HelveticaNeue-Bold-50.vlw");
  descriptionFont = loadFont("HelveticaNeue-25.vlw");
  //Load teh images
  imgBg=loadImage("bg.jpg");
  imgFish=loadImage("fish.png");
  imgShrimp=loadImage("shrimp.png");
  imgShark=loadImage("shark.png");
  imgPlay=loadImage("playButton.png");
  imgExit=loadImage("exitButton.png");
  imgExitChange=loadImage("exitButtonChange.png");
  imgPlayChange=loadImage("playButtonChange.png");
  //load and loop the background music
  minim=new Minim(this);
  au_player1=minim.loadFile("music.mp3");
  //Loop the audio
  au_player1.loop();            
  /*Set up a level dropdown menu by using the controlIP5 library*/
  cp5 = new ControlP5(this);
  //Create a dropdownList and set its position and size
  d1 = cp5.addDropdownList("myList-d1")
    .setPosition(480, 450)
      .setSize(250, 200)
        ;       
  // Customize the dropdown list
  customize(d1);
  //Call the method to initialize the game
  gameInit( );
}

//The customize method for dropdownlist
void customize(DropdownList ddl) {
  // A convenience function to customize a dropdownList
  //Set the background color
  ddl.setBackgroundColor(color(38, 169, 211, 200));
  //Set the item height 
  ddl.setItemHeight(20);
  //Set the bar height
  ddl.setBarHeight(35);
  //Set the caption label position
  ddl.captionLabel().set("LEVEL");
  ddl.captionLabel().style().marginTop = 9;
  ddl.captionLabel().style().marginLeft = 100;
  //For loop to add 3 items and name them level+i
  for (int i=1;i<4;i++) {
    ddl.addItem("LEVEL "+i, i);
  }
  //Set the colors for mouse action
  ddl.setColorBackground(color(38, 169, 211, 200));
  ddl.setColorActive(color(255, 128, 0, 200));
}

//Control mouse events for the dropdownlist
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    // check if the event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
  //Assign the number to level 
  level=int(theEvent.getGroup().getValue());
  //Re initialize the game based on the level the player chose 
  gameInit( );
}


/*Initialize the game*/
void gameInit() {
  //Start the game with score at 0
  score = 0;
  //Start at the main menu
  gameState = MAIN_MENU;
  /*Create 25 shrimps with arraylist & for loop, and initialize their maxspeed at 3*/
  // Create an empty ArrayList for shrimps
  shrimps = new ArrayList();
  //Start by adding one shrimp
  for (int i = 0; i < (10+level*5); i++) {
    shrimps.add(new Shrimp(3));
  }
  /*Create 15 sharks with arraylist & for loop,and initialize their maxspeed at 4*/
  // Create an empty ArrayList for sharks
  sharks= new ArrayList();
  //Start by adding one shark
  for (int i = 0; i < (6+level*5); i++) {
    sharks.add(new Shark(4));
  }
}


/*Game Flow*/
void draw() {
  //Calculate the time
  h=hour();
  m=minute();
  s=second();
  //Display the background image
  image(imgBg, 0, 0);
  //Set the frameRate for animation
  frameRate(60);

  /*Switch between different game states*/
  switch(gameState) {

    /*The main game loop*/
    case (0):
    //Hide the level slider
    cp5.hide();
    // Create a new fish(Player)
    fish = new Fish();
    /*Make shrimps grow and float in the screen randomly*/
    //Loop through each shrimp in the arraylist backward
    for (int i = shrimps.size()-1; i >= 0; i--) {
      //Cast the shrimp coming out.
      Shrimp shrimp = (Shrimp) shrimps.get(i);
      //Check whether the shrimp hits the wall 
      shrimp.checkEdges();
      //Update the shrimp's position with the maxspeed of 0.2
      shrimp.update(0.2);
      //Display shrimp
      shrimp.display();
      //Overload display method with the signatures of blinking eyes' size and positions
      shrimp.display(3, 17, 18, 24, 14);
      //Calculate the distance between shrimp and the fish(player)
      shrimp.checkDistance();

      /*Conditional: if shrimp is hitten, remove it and then update the score*/
      if (shrimp.hit()) {
        //remove shrimp
        shrimps.remove(i);
        //Update score
        score+=1;
        perctg=score;
      }
    }
    /*Make sharks grow and float in the screen randomly*/
    //Loop through each shark in the arraylist backward
    for (int i = sharks.size()-1; i >= 0; i--) {
      //Cast the shark coming out.
      Shark shark = (Shark) sharks.get(i);
      //Check whether the shark hits the wall 
      shark.checkEdges();
      //Update the shark's position with the maxspeed of 0.25
      shark.update(0.25);
      //Display shark
      shark.display();
      //Overload display method with the signatures of blinking eyes' size and positions
      shark.display(4, 35, 43, 35, 43);
      //Calculate the distance between shark and the fish(player)
      shark.checkDistance();

      /*Conditional:fail game! If player(fish) hits the shark, set gameState to fail*/
      if (shark.hit()) {
        gameState = 2;
      }
    }

    //Update the player(fish)'s position
    fish.update();  
    //Display the fish
    fish.display();
    //Overload display method with the signatures of blinking eyes' size and positions
    fish.display(3, 23, 30, 30, 30);

    /*Conditional: win game! If all the shrimps is eaten, set the gameState to win*/
    if (score == (10+level*5)) {
      gameState = 3;
    }
    tEnd=h*60+m*60+s;
    //Display the current level, score and time
    textFont(headLineFont);
    textSize(20);
    textAlign(RIGHT);
    fill(#FFFFFF);
    //Display the defaut level, score and time at different positions   
    text("Level:"+(level), 100, 50);
    text("Time:"+(tEnd-tStart), 210, 50);
    text("Score:"+score, 330, 50);
    break;

    /*Other gamestates*/
    /*Start Screen*/
    case(1):
    //Load the images of play and exit buttons
    image(imgPlay, 290, 500);
    image(imgExit, 610, 500);
    //ControlIP5
    noStroke();
    //Display the heading 
    textAlign(CENTER);
    textFont(headLineFont);
    text("WELCOME TO SHARKS' HOME!", width/2, 200);
    //Display the tutorials 
    textFont(descriptionFont);
    text("Left click to eat all shrimps to win.", width/2, height-500);
    text("Don't be caught by sharks!", width/2, height-470);
    /*Conditionals:buttons Change when mouse is on it*/
    if ((mouseX>=640&&mouseX<=900)&&(mouseY>=530&&mouseY<=580)) {
      //Load the images of play and exit buttons
      image(imgExitChange, 610, 500);
    }
    if ((mouseX>=320&&mouseX<=580)&&(mouseY>=500&&mouseY<=580)) {
      image(imgPlayChange, 290, 500);
    }
    /*Conditional: if right click, initialize the game again*/
    if (mousePressed && (mouseX>=320&&mouseX<=580)&&(mouseY>=500&&mouseY<=580)) {
      gameState = 0;
      //Re-calculate the time from 0
      tStart=h*60+m*60+s;
    }
    if (mousePressed && (mouseX>=640&&mouseX<=900)&&(mouseY>=530&&mouseY<=580)) {
      exit();
    }
    break;

    /*Fail screen*/
    case(2):
    //Load the images of play and exit buttons
    image(imgPlay, 290, 500);
    image(imgExit, 610, 500);
    //Re-show the levle slider
    cp5.show();
    //Turn on the cursor function
    cursor();
    //Display the heading
    textAlign(CENTER);
    textFont(headLineFont);
    text("Oops:(", width/2, 200);
    //Display description and scores
    textFont(descriptionFont);
    text("Your score: " +score, width/2, height-500);
    //Display the percentage of final goal and time
    text("You have already eaten "+ int(perctg/(10+level*5)*100) +"% of all shrimps in " +(tEnd-tStart)+ " seconds!", width/2, height-470);
    /*Conditionals:buttons Change when mouse is on it*/
    if ((mouseX>=640&&mouseX<=900)&&(mouseY>=530&&mouseY<=580)) {
      //Load the images of play and exit buttons
      image(imgExitChange, 610, 500);
    }
    if ((mouseX>=320&&mouseX<=580)&&(mouseY>=500&&mouseY<=580)) {
      image(imgPlayChange, 290, 500);
    }
    /*Conditional: if right click, initialize the game and replay it again*/
    if (mousePressed && (mouseX>=320&&mouseX<=580)&&(mouseY>=500&&mouseY<=580)) {
      gameInit();
      //Replay the game
      gameState = 0;
      //Re-calculate the time from 0
      tStart=h*60+m*60+s;
    }
    if (mousePressed && (mouseX>=640&&mouseX<=900)&&(mouseY>=530&&mouseY<=580)) {
      exit();
    }
    break;

    /*Win screen*/
    case(3):
    //Load the images of play and exit buttons
    image(imgPlay, 290, 500);
    image(imgExit, 610, 500);
    //Re-show the levle slider
    cp5.show();
    //Turn on the cursor function
    cursor();
    //Display the heading
    textAlign(CENTER);
    textFont(headLineFont);
    text("Yeah!", width/2, 200);
    //Display description and scores
    textFont(descriptionFont);
    text("Your score: " +score, width/2, height-500);
    //Display the percentage of final goal and time 
    text("You have already eaten "+ int(perctg/(10+level*5)*100)+"% of all shrimps in " +(tEnd-tStart)+ " seconds!", width/2, height-470);
    /*Conditionals:buttons Change when mouse is on it*/
    if ((mouseX>=640&&mouseX<=900)&&(mouseY>=530&&mouseY<=580)) {
      //Load the images of play and exit buttons
      image(imgExitChange, 610, 500);
    }
    if ((mouseX>=320&&mouseX<=580)&&(mouseY>=500&&mouseY<=580)) {
      image(imgPlayChange, 290, 500);
    }
    /*Conditional: if right click, initialize the game and replay it again*/
    if (mousePressed && (mouseX>=320&&mouseX<=580)&&(mouseY>=500&&mouseY<=580)) {
      gameInit();
      //Replay the game
      gameState = 0;
      //Re-calculate the time from 0
      tStart=h*60+m*60+s;
    }
    if (mousePressed && (mouseX>=640&&mouseX<=900)&&(mouseY>=530&&mouseY<=580)) {
      exit();
    }
    break;
  }
}

/*Create abstract Animal superclass*/
abstract class Animal {

  /*Properties*/
  //Animal's profiles 
  PImage img;
  //Anmial's width size
  float aWidth;
  //Anmial's location
  PVector location;
  //Anmial's velocity
  PVector velocity;
  //Anmial's accelerating velocity
  PVector acceleration;
  //Anmial's maxspeed of movement 
  float maxSpeed;
  //Distance bewteen two animals
  float magnitude;

  /*Default Animal constructor*/
  Animal() {
  }

  /*Methods*/
  /*Update Animals's location according to its movement speed*/
  void update(float ranAccel) {
    //Get random acceleration from -0.2 to 0.2
    acceleration = new PVector(random(-ranAccel, ranAccel), random(-ranAccel, ranAccel));    
    //Add the acclerating speed to the velocity
    velocity.add(acceleration);
    //Limit the velocity to the maxspeed
    velocity.limit(maxSpeed); 
    //Add the velocity to the location   
    location.add(velocity);
  }

  /*Calculate the distance between two animals(fish and shrimp or shark) by using two formulations*/
  void checkDistance() {
    //Position of fish
    PVector fish;
    //Get the fish's position accoring to the mouse's position
    fish = new PVector(mouseX, mouseY);
    //Calculate the PVector(x-x', y-y') bwteen the position of fish and animal by subsract formulation
    fish.sub(location);
    //Calculate the length of the PVector by equation sqrt(x*x + y*y)
    magnitude = fish.mag();
  }

  /*Conditionals: whether the fish(player) is close to shrimp or shark and hits them*/
  boolean hit() {
    checkDistance();
    //Conditional: if fish(player)'s position is within the range of other animals' size
    if (magnitude <aWidth) {
      //the fish(player) hits the others
      return true;
    } 
    //If not, the fish(player) doesn't the others
    else {
      return false;
    }
  }

  /*Abstract display method*/
  abstract void display();

  /*Overload display method with different signature: display the blinking eyes for animals with various eyeballs' sizes and positions*/
  void display(int aSize, int xposL, int yposL, int xposR, int yposR) {  
    //fill random colors
    fill(random(255));
    //Display the left and right eyeballs
    ellipse(location.x+xposL, location.y+yposL, aSize, 4);
    ellipse(location.x+xposR, location.y+yposR, aSize, 4);
  }

  /*Reverse animal's velocity x or y when it hits a wall*/
  void checkEdges() {
    //Conditional: if animal is nearly beyong the width, reverse the direction of y
    if ((location.y > (height-aWidth/2)) || (location.y < aWidth/2)) {
      velocity.y = velocity.y * -1;
    }
    //Conditional: if animal is nearly beyong the height, reverse the direction of x
    if ((location.x > (width-aWidth/2)) || (location.x < aWidth/2)) {
      velocity.x = velocity.x * -1;
    }
  }
}

/*Player class*/
class Fish extends Animal {

  /*Default constructor*/
  Fish() {
    //Initialize the fish's position
    location = new PVector(0, 0);
  } 

  /*Override methods within Animal superclass*/
  /*Update fish's location according to the mouse movement*/
  void update() { 
    //Get the velocity accoring to the mouse's input
    velocity = new PVector(mouseX, mouseY);
    //Set the x, y of velocity to the location's x, y of fish
    location.set(velocity);
  }
  /*Implement the abstract method in Animal superclass*/
  /*Displace fish with the mouse movement*/
  void display() {
    //Hide the cursor from view
    noCursor();
    //Turn off stroke function
    noStroke();
    //Displace fish 
    image(imgFish, location.x, location.y);
  }
}

/*Shark subclass inherited from Animal superclass*/
class Shark extends Animal {

  /*Default constructor*/
  Shark() {
  } 

  /*Overload shark constructor with different signature of speed in the type of float*/
  Shark(float speed) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    maxSpeed = speed;
    aWidth = 70;
    img=imgShark;
  } 

  /*Override methods within Animal superclass*/
  /*Implement the abstract method in Animal superclass*/
  void display() {
    //Display shark with the change of location
    image(img, location.x, location.y);
  }
}

/*Shrimp subclass inherited from Animal superclass*/
class Shrimp extends Animal {

  /*Default constructor*/
  Shrimp() {
  }

  /*Overload shrimp constructor with different signature of speed in the type of float*/
  Shrimp(float speed) {
    maxSpeed = speed;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    aWidth = 60;
    img=imgShrimp;
  }

  /*Override methods within Animal superclass*/
  // Execute this if, the player(fish) is both close to shrimp and presses the left mousebutton
  boolean hit() {
    checkDistance();
    //Conditional: if palyer(fish)'s position is within the range of shrimp's size and left mouse button is pressed
    if ((magnitude < aWidth) && mousePressed && (mouseButton == LEFT)) {
      //the fish hits shrimp
      return true;
    } 
    //If not, the fish doesn't the shrimp
    else {
      return false;
    }
  }

  /*Implement the abstract method in Animal superclass*/
  void display() {
    //Display shrimp with the change of location
    image(img, location.x, location.y);
  }
}



