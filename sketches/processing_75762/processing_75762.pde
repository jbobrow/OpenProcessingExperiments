
//DECLARE EVERYTHING!!!
//DECLARE EVERYTHING LIKE IT'S 1776 AND YOU'RE SICK OF ENGLAND BREATHING DOWN YOUR NECK
PImage[] buttframes = new PImage[2];
int currentSec;
int currentMin;
int currentHour;

int buttFrame;
int yawnFrame;
int phoneFrame;
int shakeFrame;

PImage bg;

//for the animations
PImage[] yawnframes = new PImage[30];
PImage[] phoneframes = new PImage[122];
PImage[] shakeframes = new PImage[12];

//for the randomized stats bars
int statDiff = 0;
int[] minOrPlus = {-1, 1};
int start1 = int(random(85));
int start2 = int(random(85));
int start3 = int(random(85));
int start4 = int(random(85));
int start5 = int(random(85));
int start6 = int(random(85));

//for the 'sims'-like commands
boolean optionScreen = false;
boolean showerMessage = false;
boolean laundryMessage = false;
boolean outsideMessage = false;
boolean peeMessage = false;
boolean pizzaMessage = false;
boolean eatMessage = false;
int msgTime = 0;


void setup() {
  size(600, 500);
  frameRate(10);
  bg = loadImage("bg.png");
  image(bg, 0, 0);
  //buttscratch frames
  buttframes[0] = loadImage("butts1.png");
  buttframes[1] = loadImage("butts2.png");
  //use a for loop to set up the array that holds all the yawning frames
  for (int i = 0; i<30; i++) {
    String imageName = "yawn"+nf(i, 2)+".png";
    yawnframes[i] = loadImage(imageName);
  }
  //do the same for the phone call
  for (int i=0; i<122;i++) {
    String imageName = "phone"+nf(i, 3)+".png";
    phoneframes[i] = loadImage(imageName);
  }
  //aaaaand the same for the headshaking
  for (int i=0; i<12; i++) {
    String imageName = "shake"+nf(i, 2)+".png";
    shakeframes[i] = loadImage(imageName);
  }
  currentSec = second();
  currentMin = minute();
  currentHour = hour();
}

void draw() {
  image(bg, 0, 0);
  bottomStats(228, 414, start1);
  bottomStats(228, 441, start2);
  bottomStats(228, 471, start3);
  bottomStats(429, 414, start4);
  bottomStats(429, 441, start5);
  bottomStats(429, 471, start6);
  //change the frames of the various animations as needed
  drawButts();
  drawYawn();
  drawPhone();
  //this if is so that pressing space initiates the hourly animation at any time
  if ((keyPressed == true)&&(key == ' ')) {
    currentHour-=1;
  }
  //then draw everything as needed!
  if ((currentHour == hour())) { 
    image(buttframes[buttFrame], 242, 75);
    image(yawnframes[yawnFrame], 281, 75);
  }
  else { //the other animations have to be halted when the phone animation is playing
    image(phoneframes[phoneFrame], 156, 75);
  }
  if (optionScreen == true) { //this helps keep it from lagging!!
    screenOptions();
  }
  messages(); //put up the messages in response to options as needed.
}

void bottomStats(int x, int y, int startGreen) {
  noStroke();
  //start the thing that will make the comfort show up/fluctuate
  statDiff = startGreen + int(random(5));
  int rectWidth = 110-statDiff;
  //red bar, opacity goes down as green bar gets bigger
  int redAlpha = int(map(rectWidth, 0, 110, 255, 50));
  fill(255, 2, 0, redAlpha);
  rect(x, y, 110, 10);
  //green bar, opacity goes up as green bar gets bigger
  int greenAlpha = int(map(rectWidth, 0, 110, 100, 255));
  fill(0, 255, 70, greenAlpha);
  rect(x, y, rectWidth, 10);
}

void drawButts() { // changes frame depending on time
  if (second() !=currentSec) {
    buttFrame = (buttFrame+1) % 2;
    currentSec = second();
  }
}

void drawYawn() { //changes yawning frame, starts off at every minute and resets once it plays through
  if (currentMin != minute()) {
    if (yawnFrame <29) {
      yawnFrame = yawnFrame + 1;
    }
    else if (yawnFrame ==29) {
      currentMin = minute();
      yawnFrame = 0;
    }
  }
}

void drawPhone() {
  if ((currentHour != hour())) {
    if (phoneFrame <121) {
      phoneFrame = phoneFrame +1;
    }
    else if (phoneFrame ==121) { //loop it back around once it's done so we can use it again
      currentHour = hour();
      phoneFrame = 0;
    }
    if ((33 <= phoneFrame) && (phoneFrame <= 54)) { // also put in the hour for the appropriate frames
      fill(255);
      textSize(40);
      textAlign(LEFT);
      text((hour()%12), 456, 114);
    }
  }
}

void drawShake() { //change the headshaking frame for the options
  if (shakeFrame <11) {
    shakeFrame = shakeFrame + 1;
  }
  else if (shakeFrame ==11) {
    shakeFrame = 0;
  }
}

void mouseClicked() { 
  //if you click on him, the option screen shows up!
  if ((262 < mouseX)&&(mouseX<366)&&(75<mouseY)&&(mouseY<353)) {
    optionScreen = true;
  }
  //the following are to get certain messages to show up depending on which button you click
  if ((optionScreen == true) && ((mouseX<100)||(mouseX>570) || (mouseY<22)||(mouseY>373))) {
    optionScreen = false;
  }
  else if ((optionScreen == true) && ((240<mouseX)&&(mouseX<390)&&(22<mouseY)&&(mouseY<62))) {
    optionScreen = false;
    showerMessage = true;
  }
  else if ((optionScreen == true) && ((400<mouseX)&&(mouseX<570)&&(109<mouseY)&&(mouseY<149))){
    optionScreen = false;
    laundryMessage = true;
  }
  else if ((optionScreen == true) && ((410<mouseX)&&(mouseX<560)&&(235<mouseY)&&(mouseY<275))){
    optionScreen = false;
    outsideMessage = true;
  }
  else if ((optionScreen == true) && ((240<mouseX)&&(mouseX<400)&&(333<mouseY)&&(mouseY<373))){
    optionScreen = false;
    peeMessage = true;
  }
  else if ((optionScreen == true) && ((92<mouseX)&&(mouseX<242)&&(235<mouseY)&&(mouseY<275))){
    optionScreen = false;
    pizzaMessage = true;
  }
  else if ((optionScreen == true) && ((92<mouseX)&&(mouseX<252)&&(109<mouseY)&&(mouseY<149))){
    optionScreen = false;
    eatMessage = true;
  }
}

void messages() { //displays the message according to which option you chose
  if (showerMessage == true) {
    drawShake();
    image(shakeframes[shakeFrame], 281, 75);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    if (msgTime < 50) { 
      text("Why would you do that? You already took a shower", width/2+30, 370);
      text("just two weeks ago, it's far too early for another one!", width/2+30, 390);
      msgTime+=1;
    }
    else {
      msgTime = 0;
      showerMessage = false;
    }
  }
  
  if (laundryMessage == true){
    drawShake();
    image(shakeframes[shakeFrame],281,75);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    if (msgTime<50){
      text("That's just silly. This outfit still has another",width/2+30,370);
      text("five uses in it, AT LEAST!",width/2+30,390);
      msgTime+=1;
    }
    else{
      msgTime = 0;
      laundryMessage = false;}
  }  
  
  if (outsideMessage == true){
    drawShake();
    image(shakeframes[shakeFrame],281,75);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    if (msgTime<180){
      text("Why? You already have everything you need right here!",width/2+20,360);
      text("10 pizza places on speed dial, a TV you can watch to unleash your blossoming",width/2+20,375);
      text("social party animal, a high speed internet connection, and a creaky bed",width/2+20,390);
      text(" you can cry into late at night in your fits of despair.",width/2+20,405);
      msgTime +=1;
    }
    else{
      msgTime = 0;
      outsideMessage = false;}
  }
  
  if (peeMessage == true){
    drawShake();
    image(shakeframes[shakeFrame],281,75);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    if (msgTime<60){
      text("What, like in the bathroom? That's too much effort!",width/2+30,370);
      text("Besides, that's obviously what boxers are for!",width/2+30,390);
      msgTime+=1;
    }
    else{
      msgTime = 0;
      peeMessage = false;}
  }
  if (pizzaMessage == true){
    drawShake();
    image(shakeframes[shakeFrame],281,75);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    if (msgTime<90){
      text("Ugh, come on, you're a way too busy guy to deal with cleaning things up.",width/2+30,370);
      text("Besides, the pizza gives your room a nice ambience. A certain 'je ne sais quois.'",width/2+30,390);
      msgTime+=1;
    }
    else{
      msgTime = 0;
      pizzaMessage = false;}
  }
  
  if (eatMessage == true){
    drawShake();
    image(shakeframes[shakeFrame],281,75);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    if (msgTime<100){
      text("It's not TIME to eat yet! Your mother hasn't yet come by and dropped off dinner!",width/2+10,360);
      text("(NOT LIKE YOU ASKED HER TO, AS A GROWN ADULT",width/2+30,380);
      text("YOU DON'T NEED HER HELP ANY MORE.)",width/2+30,400);
      msgTime +=1;
    }
    else{
      msgTime = 0;
      eatMessage = false;}
  }
}

void screenOptions() {
  if (optionScreen == true) {
    //does this if statement about fill belong here?
    if ((240<mouseX)&&(mouseX<390)&&(22<mouseY)&&(mouseY<62)) {
      fill(145, 168, 228);
    }
    else {
      fill(54, 88, 175);
    }
    rect(240, 22, 150, 40, 7, 7);
    fill(255);
    textSize(12);
    textAlign(LEFT);
    text("take a shower already!", 250, 42);

    if ((400<mouseX)&&(mouseX<570)&&(109<mouseY)&&(mouseY<149)) {
      fill(145, 168, 228);
    }
    else {
      fill(54, 88, 175);
    } 
    rect(400, 109, 170, 40, 7, 7);
    fill(255);
    textSize(12);
    textAlign(LEFT);
    text("do the laundry, GODDAMN!", 405, 132);

    if ((410<mouseX)&&(mouseX<560)&&(235<mouseY)&&(mouseY<275)) {
      fill(145, 168, 228);
    }
    else {
      fill(54, 88, 175);
    }
    rect(410, 235, 150, 40, 7, 7);
    fill(255);
    textSize(22);
    textAlign(LEFT);
    text("GO OUTSIDE", 415, 262);

    if ((240<mouseX)&&(mouseX<400)&&(333<mouseY)&&(mouseY<373)) {
      fill(145, 168, 228);
    }
    else {
      fill(54, 88, 175);
    }
    rect(240, 333, 160, 40, 7, 7);
    fill(255);
    textSize(12);
    textAlign(LEFT);
    text("just go pee already, jesus", 245, 358);

    if ((92<mouseX)&&(mouseX<242)&&(235<mouseY)&&(mouseY<275)) {
      fill(145, 168, 228);
    }
    else {
      fill(54, 88, 175);
    }
    rect(92, 235, 150, 40, 7, 7);
    fill(255);
    textSize(12);
    textAlign(LEFT);
    text("GET RID OF THE MOLDY", 97, 250);
    text("PIZZA, HOLY SHIT", 110, 265);

    if ((92<mouseX)&&(mouseX<242)&&(109<mouseY)&&(mouseY<149)) {
      fill(145, 168, 228);
    }
    else {
      fill(54, 88, 175);
    }
    rect(92, 109, 150, 40, 7, 7);
    fill(255);
    textSize(14);
    textAlign(LEFT);
    text("EAT SOMETHING,", 112, 124);
    text("HOLY GOD!", 127, 142);
  }
}


