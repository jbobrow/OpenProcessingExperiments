
/*
* Susse's Interface!
* Spacebrew Collab Feb 2014
* Stephanie Alexandra Rose Burgess & Susse Sønderby
* Parsons The New School For Design 
*/
import spacebrew.*;

String server="54.201.24.223"; //until spacebrew is up running again. 
String name="Susse";
String description ="Client that sends and receives boolean messages. Background turns Green when message received.";

Spacebrew sb;

//Set color for recieving signal
color color_on = color(180,176,227);
color color_off = color(255, 255, 255);
int currentColor = color_off;
int circleSize = 200; //diameter of circle
boolean disturbPressed = false;
boolean disturbHover = false;

boolean leavePressed = false;
boolean leaveHover = false;

boolean recievedText = false;

//color For interacting with disturb button
color disturbFill = color(0,173,159);
color disturbHoverFill = color(5,128,127);
int disturbInteractColor = disturbFill;

//color For interacting with leave button
color leaveFill = color(0,173,159);
color leaveHoverFill = color(5,128,127);
int leaveInteractColor = disturbFill;
color changeFill = color(192,15,0);

int responseButtX = 80;
int responseButtWidth = 200;
int responseButtHeight = 80;

int strokeColor = color(62,62,62);
int disturbSize = 100;
int disturbY = 250;
int disturbX = 90;

int leaveX = 220;



void setup() {
  frameRate(240);
  size(300, 400);
  background(255,255,229);

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers
  sb.addPublish( "button_pressed", "boolean", true );


  // declare your subscribers
  sb.addSubscribe( "change_background", "boolean" );

  // connect to spacebre
  sb.connect(server, name, description );
  
  //write text
   fill(strokeColor);
   textAlign(CENTER);
   textSize(14);
   text( name + ", set your status:", width/2, 170);
}

void draw() {
 background(255,255,229);
 fill(strokeColor);
   textAlign(CENTER);
   textSize(14);
   text( name + ", set your status:", width/2, 170);
    // draw Response Button
    fill( currentColor );
    rectMode(CENTER);
    stroke(strokeColor);
    strokeWeight(2);
    ellipse(width/2, responseButtX,responseButtWidth,responseButtHeight);
    fill(color_on);
    fill(strokeColor);
    text("Stephanie says:", width/2, 25);
    text("Leave Me" , width/2, responseButtX);
    
    if ( recievedText == true) {
      fill( currentColor );
    rectMode(CENTER);
    stroke(strokeColor);
    ellipse(width/2, responseButtX,responseButtWidth,responseButtHeight);
    fill(color_on);
    fill(strokeColor);
    text("Disturb Me!", width/2, responseButtX);
    } 
    
    //check if hover disturb me
//    if (sqrt(sq(mouseX) + sq(mouseY)) < 200/2) {
    if (mouseX > disturbX-disturbSize/2 && mouseX < disturbX+disturbSize/2 &&
        mouseY > disturbY-disturbSize/2 && mouseY < disturbY+disturbSize/2) {
          disturbHover = true;
          println("disturb hover " + disturbHover);
        } else {
          disturbHover = false;
          println("disturb hover " + disturbHover);
        }
    
    // draw Disturb Me Button
    rectMode(CENTER);
    fill(disturbInteractColor); //light Green
    noStroke();
    ellipse(disturbX, disturbY, disturbSize, disturbSize);
    fill(strokeColor);
    textAlign(CENTER);
    textSize(12);
    text("Disturb Me", disturbX, disturbY);
      
    // Change color on Disturb Me Button  
    if(disturbHover == true) {
       disturbInteractColor = disturbHoverFill;
    }  else {
       disturbInteractColor = disturbFill;
    }
    
    //check hover Leave Me button
    if (mouseX >= leaveX-disturbSize/2 && mouseX <= leaveX+disturbSize/2 &&
        mouseY >= disturbY-disturbSize/2 && mouseY <= disturbY+disturbSize/2) {
          leaveHover = true;
          println("leave hover " + leaveHover);
        } else {
          leaveHover = false;
          println("leave hover " + leaveHover);
        }
    
    // draw do notButton
    rectMode(CENTER);
    fill(leaveInteractColor); //light Green
    rect(leaveX, disturbY, disturbSize, disturbSize);
    fill(strokeColor);
    textAlign(CENTER);
    textSize(12);
    text("Leave Me", leaveX, disturbY);
    
    // Change color on Disturb Me Button
    if(leaveHover == true) {
       leaveInteractColor = leaveHoverFill;
    }  else {
       leaveInteractColor = leaveFill;
    }
 
}

void mousePressed() {
  // send message to spacebrew
  if(disturbHover == true) {
  sb.send( "button_pressed", true);
  } 
    else { 
  {
  sb.send( "button_pressed", false);
  }
  
}
}

void mouseReleased() {
  // send message to spacebrew
  sb.send( "button_pressed", false);
  
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message " + name + " : " + value);

  // update background color
  if (value == true) {
    recievedText = true;
    currentColor = color_on;
    println("Who is sending " + name);
  } else {
    currentColor = color_off;
    println("No to me");
    recievedText = false;
  }
  
  
}


