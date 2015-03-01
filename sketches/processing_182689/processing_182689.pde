
/*
Joanna Ngai
Design 479
Exercise 4: Poke, Rub and Tickle
An interactive Eve that responds to user's mouse input.
*/


import ddf.minim.*; //import audio

Minim minim; //import audio 
AudioPlayer song; //import audio 
 
PFont font; //create font
String nameTag; //create string

PShape body; //body shape
PShape leftArm; //left arm shape
PShape rightArm; //right arm shape
PShape eyes; //eyes shape
PShape neutralEyes; //neutral eyes shape
PShape happyEyes; //happy eyes shape
PShape madEyes; //mad eyes shape
PShape leaf; //leaf symbol shape

int eyeTimer = 0;  //initialize timer
int mouseTimer = 0; //initialize timer

int arm = 163; //arm y-value

void setup(){
  size(400, 400); //sets up canvas size
  background(220, 150, 40); //orange background color
  smooth(); //smooth mode
  
  minim = new Minim(this);
  // this loads Directive.mp3 from the data folder
  song = minim.loadFile("Directive.mp3"); //loads file
  song.play(); //plays file

  body = loadShape("eve-01.svg"); //sets name to shape
  leftArm = loadShape("eve-02.svg"); //sets name to shape 
  rightArm = loadShape("eve-03.svg"); //sets name to shape
  neutralEyes = loadShape("eve-04.svg"); //sets name to shape
  happyEyes = loadShape("eve-05.svg"); //sets name to shape
  madEyes = loadShape("eve-06.svg"); //sets name to shape
  leaf = loadShape("eve-07.svg");//sets name to shape
  
  eyes = neutralEyes; //makes neutral eyes same as eyes
  
  PFont font = loadFont("OCRAStd-28.vlw"); //loads font
  textFont(font); //loads font
  
  nameTag = "EVE"; //sets string
}

void draw(){
  
  /* outer border */
  noFill(); //sets no fill
  strokeWeight(10); //sets stroke weight
  stroke(245, 240, 206); //stroke color
  rect(0, 0, width, height); //stroke placement
  
  /* background fill */
  noStroke(); //sets no stroke
  fill(187, 132, 43); //fills color
  
  /* shadow */
  ellipse(width/2, height/2 + 80, 45, 10); //creates shadow
  
  /* do drawing */  
  shape(body, width/3 + 5, (height/5) + (mouseY/300), 120, 190); //draw body
  shape(rightArm, width - 167, arm + (mouseY/300), 30, 90); //draw right arm
  shape(leftArm, width/3 + 5, arm + (mouseY/300), 30, 90);  //draw left arm
  shape(eyes, (width - 224) + (mouseX/180), (height - 280) + (mouseY/200), 48, 17); //draw eyes
  
  /*check timer */
  if( millis() - eyeTimer >= 2000  ){ //check time has passed
    eyes = neutralEyes; //reset eyes
  }
  
  /* button */
  fill(131, 183, 227); //button fill color
  stroke(107,110,114); //button stroke color
  
  //if mouse hover over button
  if(mouseX >= 133 && mouseX <= 133 + 130 &&
    mouseY >= 328 && mouseY <= 328 + 40) { 
    fill(103,160,198);  //changes button fill color
  }
  
  strokeWeight(3); //increases stroke weight
  rect(133, 328, 130, 40, 50); //creates button shape
  
  /* text */
  fill(255); //fill color
  textSize(28); //text size
  text(nameTag, width - 231, height - 40); //text placement
  
}

//rub and tickle
void mouseDragged(){
  //mouse clicking inside shape
   if(mouseX >= 150 && mouseX <= 150 + 100 &&
  mouseY >= 100 && mouseY <= 100 + 150) { 
    
  float speed = 0; //declares speed and set initial value
   
  float d = dist(pmouseX, pmouseY, mouseX, mouseY); //calculate distance 
  
  speed = ( d / (millis() - mouseTimer) ); // calculate speed

  eyes = madEyes; //change eyes
  
  //for rapid movement after mouse dragged
   if ( speed > 3 ){ //checks speed
      shape(leaf, width/2 + 5, height - 225, 20, 20); //shows leaf symbol     
  }
    mouseTimer = millis(); //reset timer
  }
}

//poke
void mouseClicked(){
  //mouse clicking inside shape
  if(mouseX >= 150 && mouseX <= 150 + 100 &&
  mouseY >= 100 && mouseY <= 100 + 150) { 
    
   minim = new Minim(this);
  // this loads EveLaugh.mp3 from the data folder
  song = minim.loadFile("EveLaugh.mp3");
  song.play();
  
  eyes = happyEyes; //changes eyes
  eyeTimer = millis(); //reset Timer
  }
}



