
//////////////////////////////////////////////////////////////////////
//Christoper Lane                                                   //
//CSE 174H                                                          //
//Program six                                                       //
//Clicking wiht the mouse the home button on the                    //
//iphone shows the home screen, and if you click the power button   //
//at the top right corner of the iphone, it shuts the home          //
//screen off. but if you do not touch the home button for 8         //
//seconds, the home screen will turn off                            //
//////////////////////////////////////////////////////////////////////




//imports my image and background for the project
PImage phoneBackground;
PFont myFont;

//Setup my boolean for phone being on or off
boolean iPhoneOn=false;

//setup constant for timer of phone to go off
final float SECONDS_UNTIL_AUTO_SHUTOFF = 8;

//Declare variable for timer
float timeOfLastTrigger=0;

//Setup my project and import font and picture
void setup() {
  size(600, 600);
  background(255, 0, 0);
  phoneBackground=loadImage("iphone_background_0103 copy.png");
  myFont=loadFont("MyanmarSangamMN-48.vlw");
}


//list of my draw methods
void draw() {
  drawHeadPhones();
  drawIPhone();
  drawPhoneScreen();
  drawHomeButton();
  drawSideButtons();
}
//This method draws the iphone
void drawIPhone() {
  int iPhoneSizeX=300;
  int iPhoneSizeY=450;
  noStroke();
  fill(0);
  rectMode(CENTER);
  rect(300, 300, iPhoneSizeX, iPhoneSizeY);

  ellipse(155, 80, 25, 25);
  ellipse(145+iPhoneSizeX, 80, 25, 25);
  ellipse(155, 73+iPhoneSizeY, 25, 25);
  ellipse(145+iPhoneSizeX, 73+iPhoneSizeY, 25, 25);
  rect(iPhoneSizeX+(iPhoneSizeX)/2-4, 
  300, 25, iPhoneSizeY-5); 
  rect(300, iPhoneSizeX-(iPhoneSizeX)/2-69, iPhoneSizeX, 25);
  rect(iPhoneSizeX-(iPhoneSizeX)/2+6, 300, 25, iPhoneSizeY);  
  rect(iPhoneSizeX, iPhoneSizeX+(iPhoneSizeX)/2+74, 
  iPhoneSizeX, 25);


  noStroke();
  fill(150, 150, 150);
  rect(415, 66, 40, 4);
  rect(141, 110, 4, 20);
  rect(141, 150, 4, 10);
  rect(141, 175, 4, 10);

  fill(80, 80, 80);
  rect(300, 110, 60, 4);
  fill(40, 40, 40);
  ellipse(250, 110, 5, 5);
}

//this method draws the screen for when 
//the homebutton is pressed
void drawPhoneScreen() {
  if (iPhoneOn==false || 
  secondsSinceLastTrigger() > SECONDS_UNTIL_AUTO_SHUTOFF) {
    fill(0);
    rectMode(CENTER);
    rect(300, 300, 250, 350);
  }

  else {
    //uploaded image for the phone background
    image(phoneBackground, 140.0, 45.0);

    //top rectangle for time and date
    fill(40, 40, 40, 200);
    rectMode(CENTER);
    rect(302, 163, 290, 77);



    //says time and date on top of scree
    textFont(myFont, 50);
    fill(255);
    text("12:00", 235, 165);
    textFont(myFont, 20);
    text("Thursday, September 27", 200, 190);

    //Bottom rectangle for slide to unlock
    fill(40, 40, 40, 200);
    rectMode(CENTER);
    rect(302, 442, 290, 65);
    fill(30, 30, 30, 200);
    rectMode(CENTER);
    rect(280, 445, 190, 40);  

    //draws the slide button
    fill(182, 182, 182);
    rect(210, 445, 50, 40);
    fill(100, 100, 100);
    rect(205, 445, 20, 10);
    triangle(215, 455, 215, 435, 232, 445);

    //Says "slide to unlock" but colors go from white
    //to gray so it looks like the white is moving 
    //through the text
    textFont(myFont, 20);
    fill(255);
    text("slide ", 240, 450);
    fill(195, 195, 195);
    text("to", 285, 450);
    fill(150, 150, 150);
    text("unlock", 310, 450);

    //draws camera icon
    fill(220, 220, 220);
    rect(420, 445, 24, 17);
    rect(420, 435, 10, 5);
    stroke(30, 30, 30);
    strokeWeight(2);
    ellipse(419.5, 445, 10, 10);
  }
}

//this method draws the home button
void drawHomeButton() {
  fill(42, 42, 42);
  stroke(40, 40, 40);
  strokeWeight(1);
  ellipse(300, 500, 40, 40);
  stroke(255);
  rect(300, 500, 10, 10);
}

//this method draws the buttons on
//the side of the iphone
void drawSideButtons() {
  noStroke();
  fill(150, 150, 150);
  rect(415, 66, 40, 4);
  rect(141, 110, 4, 20);
  rect(141, 150, 4, 10);
  rect(141, 175, 4, 10);
}

//this method draws the headphones 
void drawHeadPhones() {
  int headPhoneX=170;

  fill(255);
  rectMode(CENTER);
  rect(headPhoneX, 56, 15, 25);
  rect(headPhoneX, 45, 10, 20);
  rect(headPhoneX, 30, 5, 15);
  fill(255, 0, 0);
  stroke(255);
  strokeWeight(3);
  arc(headPhoneX-10, 23, 20, 20, PI, 2*PI);
  line(headPhoneX-20, 23, headPhoneX-20, 600);
}

//returns float to allow my timer to work and determines how 
//long its been since the button was pressed
float secondsSinceLastTrigger() {
  return millis()/1000.0-timeOfLastTrigger;
}

//Each time you click the home button, the home screen 
//appears
void mousePressed() {

  //when you click the button, the home screen is shown
  //after a certain time, the homescreen will go away
  if (mouseX<325 && mouseX>278 && mouseY<525 && mouseY>485) {
    iPhoneOn=true;
    timeOfLastTrigger = millis()/1000.0;
  }



  //If you click the power button at the top right, 
  //the screen will go away
  else if (mouseX>375 && mouseX<455 && mouseY<68 && mouseY>64) {
    iPhoneOn=!iPhoneOn;
  }
}


