
boolean debug = false; // shows diagnosics information
boolean names = true;
boolean hideStats = false;
PFont f10, f12, f14;
int loopDelay = 0;
int steps = 0;
String message;
float translateX, translateY; 
Point consistL, consistR;
Point farR, farL;
float scaler;
int bgColor = #FFF4A0;
String title1, title2;

// throttle/speed varbs
int engines; // set in setupLayout()
int numButtons; 
float maxSpeed = 1;
float setSpeed = 0;
int offset;
//float speedInc = 0.5;
RectButton[] buttons = new RectButton[7];

// track varbs
float stdLen = 50; // standard track len
Segment[] tracks;  // = new Segment[1]; // initial track section
boolean magnets = false; // type of uncoupling
int correctSpots;
int requiredSpots;
boolean showSpots = false; // show where to spot cars
int showSpot = -1;

// car varbs
Car[] cars; // = new Car[1]; // initial car
int nudge = 3; //distance to bump unhooked cars
float speedX, speedY;

// button varbs
color currentcolor;
CircleButton[] turnouts; // = new CircleButton[1]; // initial turnout
boolean locked = false;
int bounce = 10;
int bounceTime = 10; // delay for button press

// time varbs
float startTime; // in seconds
float runTime; // in seconds
float messageTimer; //keeps
boolean startClock = false;
String timeString;


void setup(){
  size(500, 200);
  frameRate(30); // slow it down?
  runTime = 0; 
  scaler = 1;
  startClock = false;
  steps = 0;
  setSpeed = 0;
  messageTimer = 0;
  requiredSpots = 0;
  consistL = new Point(-1, 50, 50);
  consistR = new Point(-1, 50, 50);
  f10 = loadFont("ArialNarrow-10.vlw");
  f12 = loadFont("ArialNarrow-12.vlw");
  f14 = loadFont("SansSerif.bolditalic-14.vlw");
  
  setupLayout2(); // < -- WHICH LAYOUT TO DRAW
  build_turnouts(); // creates buttons for turnouts
  printLayout(); 
  requiredSpots = countSpots(); 
  
  // THROTTLEs
  color buttoncolor = color(100);
  color highlight = color(0); 
  if (engines == 2) {
    offset = 50;
    numButtons = 7;
  }
  else {
    offset = 0;
    numButtons = 4;
  }
  buttons[0] = new RectButton(width - 40, 3, 35, 16, buttoncolor, highlight, "Reset");
  
  buttons[1] = new RectButton(width / 2 - 25 - offset , height - 23, 20, 20, buttoncolor, highlight, "«"); // left arrow
  buttons[2] = new RectButton(width / 2 - offset, height - 23, 20, 20, buttoncolor, highlight, "| |"); // stop
  buttons[3] = new RectButton(width / 2 + 25 - offset, height - 23, 20, 20, buttoncolor, highlight, "»"); // right arrow
  if (engines == 2) {
    buttons[4] = new RectButton(width / 2 - 25 + offset, height - 23, 20, 20, buttoncolor, highlight, "«"); // left arrow
    buttons[5] = new RectButton(width / 2 + offset, height - 23, 20, 20, buttoncolor, highlight, "| |"); // stop
    buttons[6] = new RectButton(width / 2 + 25 + offset, height - 23, 20, 20, buttoncolor, highlight, "»"); // right arrow
  }
  checkCouplers(); // inital check
  steps = 0; // reset moves if couplers hooked up
  message = "Ready to start.";
}


void draw(){
  background(bgColor);
  stroke(0);
  if (!startClock) {
    startTime = millis() / 1000; // in seconds
  }
  if (correctSpots != requiredSpots){
    runTime = millis() / 1000 - startTime;
  }
  timeString = "";
  float tempMin = runTime / 60;
  if (tempMin < 10) {
    timeString = "0";
  }
  timeString = timeString + int(tempMin) + ":";
  float tempSec = runTime - int(tempMin) * 60;
  if (tempSec < 10) {
    timeString = timeString + "0";
  }
  timeString = timeString + int(tempSec);
  
  update(int(mouseX - int(translateX) * scaler), int(mouseY - int(translateY) * scaler));
  if (cars[0].speed != 0){
    driveTrain(0);
  }
  if (engines == 2 && cars[1].speed !=0) {
    driveTrain(1);
  }
  checkCouplers();

  // check screen position
  if (consistR.x > (width / 3 - translateX) /scaler && speedX > 0){
    if ((width - translateX - 10) / scaler < farR.x) {
      translateX = translateX - 1;
    }
  }
  if (consistL.x < (width / 16 - translateX) /scaler && speedX < 0){
    if ((-translateX + 10) / scaler > farL.x) {
      translateX = translateX + 1 * scaler;
    }
  }
  if (consistL.y > (height / 2 - translateY) /scaler && speedY > 0){
    if ((height - translateY - 35) / scaler < farR.y) {
      translateY = translateY - 1 * scaler;
    }
  }
  if (consistR.y < (height / 2 - translateY) /scaler && speedY < 0){
    if ((-translateY + 10) / scaler > farL.y) {
      translateY = translateY + 1 * scaler;
    }
  }
  
  pushMatrix();
  translate(translateX, translateY);
  scale(scaler);
 
   
  if (!debug){ // draw warehouse extras
    float tempX = 200;
    tempX = tracks[7].x1; // align with track 7
    stroke(0);
    textFont(f14, 14);
    fill(#a1a23a); // dock
    rect(tempX, 55, 100, 40);
    fill(0);
    text("PCA Dock", tempX + 10, 70);
    fill(#b5b4b7); // warehouse
    rect(tempX + 100, 50, 200, 65);
    fill(#b5b4b7); // starch
    rect(tempX + 200, 90, 50, 24);
    fill(0);
    text("PCA Warehouse", tempX + 150, 70);
    textFont(f12, 12); // ArialNarrow-12
    text("Interchange", tempX + 245, 140);
    text("Storage", tempX + 255, 162);
    text("Starch", tempX + 210, 88);
  } 
  
  for (int i = 0; i < turnouts.length; i++) { 
    turnouts[i].display();
  }
  
  for (int i = 0; i < tracks.length; i++) { 
    tracks[i].display();
  }

  correctSpots = 0; // reset status check
  for (int i = 0; i < cars.length; i++) { 
    if (!cars[i].moved){
      cars[i].drive(-1);
      //tempDisp2 = tempDisp2 + i + " ";
    }
    cars[i].display();
  }
  
  popMatrix();
  
  // bottom stuff
  fill(bgColor + 50);
  rect(0, height - 26, width, 26);
  fill(cars[0].carColor);
  rect( width / 2 - 28 - offset , height - 26, 75, 26);
  if (engines == 2) {
    fill(cars[1].carColor);
    rect( width / 2 - 28 + offset , height - 26, 75, 26);
  }
  for (int i = 0; i < numButtons; i++) { // throttle buttons go on top
    buttons[i].display();
  }
  writeText(); // write stationary data

  if (bounce < 10000) {bounce++;}

  delay(loopDelay);
}


void writeText(){

  if (!debug){
    fill(#E02424);
    textFont(f14, 18);
    textAlign(CENTER);
    text (title1, width / 2, 20);
    textFont(f14, 14);
    text (title2, width / 2, 36);
  }
  
  textAlign(LEFT);  
  fill(0);
  textFont(f14, 12);
  if (correctSpots == requiredSpots){
    textFont(f14, 14);
    text ("FINISHED!", 10, height - 10);
  }  
  else if (runTime - messageTimer < 5){
    text (message, 10, height - 8);
  }
  else if (!hideStats) {
    text("spots: " + correctSpots + " of " + requiredSpots, 10, height - 15);
    text("scale: " + int(scaler * 100) + "%" + " (" + int(frameRate) + " fps)", 10, height - 2);
  }

  if (!hideStats){
    textAlign(RIGHT);
    text("time: " + timeString, width - 5, height - 2);  
    text("steps: " + steps, width - 5, height - 15);
    textAlign(LEFT);
  }
  
  textFont(f12, 12);
  if(debug){ //write non-stationary data
    text("translate (" + int(translateX) + "," + int(translateY) + ")", 10, 15);
    //text("consistR " + consistR.printPt(), 10, 30);
    //text("consistL" + consistL.printPt(), 10, 45);    
    //text("farR " + farR.printPt(), 10, 30);
    //text("farL" + farL.printPt(), 10, 45);  
    text("speedX " + speedX, 10, 30);
    text("speedY " + speedY, 10, 45);    
    
    text("speed " + cars[0].speed, 10, 60);
    text("fps(" + int(frameRate) + ")", 10, 75);
    text("bounce" + bounce, 10, 90);
    text ("mouse(" + int(mouseX - translateX) + "," + int(mouseY - translateY) + ")", 10, 105);
  }
  
  if(false){
    int tempCar = 1;
    text("#0 cl= " + cars[0].coupledLeft + " ll=" + cars[0].latchedLeft + " cr=" + cars[0].coupledRight + " lr=" + cars[0].latchedRight, 125, height/2 - 50);
    text("speed " + cars[0].speed + " ang=" + int(degrees(cars[0].angle)), 125, height/2 - 35);
    text("cp1 " + cars[0].cp1.printPt(), 125, height/2 - 20);
    text ("cp2 " + cars[0].cp2.printPt(), 125, height/2 - 5);
    text("#" + tempCar + " cl= " + cars[tempCar].coupledLeft + " ll=" + cars[tempCar].latchedLeft + " cr=" + cars[tempCar].coupledRight + " lr=" + cars[tempCar].latchedRight, 300, height/2 - 50);
    text("speed " + cars[tempCar].speed + " ang=" + int(degrees(cars[tempCar].angle)), 300, height/2 - 35);
    text("cp1 " + cars[tempCar].cp1.printPt(), 300, height/2 - 20);
    text ("cp2 " + cars[tempCar].cp2.printPt(), 300, height/2 - 5);
    tempCar = 2;
    text("#" + tempCar + " cl= " + cars[tempCar].coupledLeft + " ll=" + cars[tempCar].latchedLeft + " cr=" + cars[tempCar].coupledRight + " lr=" + cars[tempCar].latchedRight, 480, height/2 - 50);
    text("speed " + cars[tempCar].speed + " ang=" + int(degrees(cars[tempCar].angle)), 480, height/2 - 35);
    text("cp1 " + cars[tempCar].cp1.printPt(), 480, height/2 - 20);
    text ("cp2 " + cars[tempCar].cp2.printPt(), 480, height/2 - 5);
  }
}


void setMessage(String string){
  message = string;
  messageTimer = runTime;
}


void checkCouplers(){
  //farL = new Point(-1, width, 0);
  //farR = new Point(-1, 0, 0);
  for(int i = 0; i < cars.length; i++) { // check for coupling
    //if (cars[i].cp1.x < farL.x) { farL.x = cars[i].cp1.x; }
    //if (cars[i].cp2.x < farL.x) { farL.x = cars[i].cp2.x; }
    //if (cars[i].cp1.x > farR.x) { farR.x = cars[i].cp1.x; }
    //if (cars[i].cp2.x > farR.x) { farR.x = cars[i].cp2.x; }
    for(int j = 0; j < cars.length; j++) {
      if(i != j){ // dont check self
        if(abs(cars[i].cp2.x - cars[j].cp1.x) < 2 && abs(cars[i].cp2.y - cars[j].cp1.y) < 2){
          if(cars[i].coupledRight < 0){// && bounce > bounceTime) { //not coupled
            cars[i].coupledRight = j; // car attached to
            cars[j].coupledLeft = i;
            //if (magnets){ 
            if(!tracks[cars[i].cp2.seg].magnet){// not on mag
              cars[i].latchedRight = true;
              cars[j].latchedLeft = true;
              setMessage(cars[j].name + " coupled to " + cars[i].name);
              //steps++;
            }
            else {
              setMessage(cars[j].name + " pushing " + cars[i].name);
            }
            cars[j].cp1.x = cars[i].cp2.x; // match positions
            cars[j].cp1.y = cars[i].cp2.y;
            if (abs(cars[i].speed) > abs(cars[j].speed)){
              cars[j].speed = cars[i].speed;              
            }
            else {
              cars[i].speed = cars[j].speed;              
            }
            if (debug) {println("car " + j + " hooked to car " + i + " speed =" + cars[i].speed);}
            setMessage(cars[j].name + " hooked to " + cars[i].name);
            steps++;
          }
          else if (cars[0].speed == 0 && tracks[cars[i].cp2.seg].magnet && magnets) {
            setMessage(cars[i].name + " unlatched");
            cars[i].latchedRight = false;
            cars[j].latchedLeft = false; 
          }
        }
      }
    }
  }
}

