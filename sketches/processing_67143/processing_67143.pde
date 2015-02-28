
//Varibles--------------
int nR=6; ///number of images
float []circleX=new float [nR]; // First circle float varible 
float []circleY=new float [nR]; // Second circle float varible 
float []yVel=new float [nR]; //
float []xVel=new float [2]; // Velocity for balls so they can move across the y axis 
float []bX=new float [2]; // First circle float varible 
float []bY=new float [2]; // Second circle float varible 
float startingTime= 0;//start time of the timer
int rT=1000; // intervill of millsec
//float interval= 5000;//interval of millasec (I made it 5) 
boolean on = false;  //mouse click for timer 
boolean buttonClicked=false; // button rule for box
color ballColor; // color of ball 
//ellipse = the image I load --- what name should I do this as? // name of eliipse image tag
//image varible ----
PImage[] rI = new PImage[nR];
PImage[] bI=new PImage [2];
PFont sanfont;
String state = "countdown";
//postions for images
//rX[]=new Float[];
//rY[]=new float[];
//rV[]= new float[]; ----velocity for image

boolean go=false;


// The Setup-------------
void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  sanfont= loadFont("Serif-48.vlw");
  ballColor= color (255, 0, 0); 
  noStroke();
  for (int i = 0;i<nR;i++) {
    circleX[i] = 50*(i+1);
    circleY[i] = 0;
    yVel[i]=random (0, 5);
    //   for(int i=0 i<nR; i++){
    rI[0] = loadImage("0.png");   
    rI[1] = loadImage("1.png");
    rI[2] = loadImage("2.png");
    rI[3] = loadImage("3.png");
    rI[4] = loadImage("4.png");
    rI[5] = loadImage("5.png");
  }

  for (int b = 0;b<2;b++) {
    bX[b] = 50*(b+1);
    bY[b] = 0;
    xVel[b]=random (5, 0);
    bI[0] = loadImage("bacchus.jpg"); 
    bI[1] = loadImage("bacchus.jpg"); 
//    bI[2] = loadImage("bacchus.jpg"); 


    //      (all the points in the for loop for the images)
  }
}



//The Drawing-------------
void draw() {
  background(255);
  pushStyle();
  popStyle();
  textFont(sanfont);
  fill(0);

  if (millis()-startingTime>= 2000 && millis()-startingTime<3000) {
    text("3", 255, 330);
  }
  if (millis()-startingTime>= 3000 && millis()-startingTime<4000) {
    text ("2", 255, 330);
  }
  if (millis()-startingTime>= 4000 && millis()-startingTime<5000) {
    text ("1", 255, 330);

    // ellipse(width/2, height/2, 20, 20); //if true, draw circle--start race
  }
  if (millis()-startingTime>= 5000 && millis()-startingTime<6000) {
    text ("GO", 255, 330);
  }

  if (millis()>=6000) {
    state="grapes";
  }
  if (state=="grapes") {
    background(0);
    go=true;

    ballColor= color(255, 0, 0);
    for (int i=0; i<nR;i++) { 
      image(rI[i], circleX[i], circleY[i]);
    }
  }
  if (millis()>=7000) {
    state="bacchus";
  }
  if (state=="bacchus") {
    background(0);
    go=true;

    for (int i=0; i<2;i++) { 
      image(bI[i], bX[i], bY[i]);
    }

    //Draw Button 
    //  if (buttonClicked==false) {
    //    rect(100, 100, 50, 20);
    //  }
    //  
    // Button State 
    //  else {
    //    on=false;
    //  }
    //  
    //  else {
    //    background(255);

    if (go==true) {
      update(); // function name
    }//  update2();
  }
}


//Mouse States------
void mouseReleased() {
  on=true;  //activates the if statement above. This is needed in order to prevent the circle from drawing when the sketch starts
  startingTime=millis();  //sets starting time of "timed phenomenon" equal to the current number of milliseconds since the sketch has started

  println("Mouse Released ----------- mouseX = " + mouseX + "mouseY=" + mouseY);
  if (mouseX>100 && mouseX<150 && mouseY>100 && mouseY<120) {
    buttonClicked=true;
  }
}

// Update Function-----------
void update() {
  for (int i=0;i<nR;i++) {
    circleY[i]=circleY[i]+yVel[i];
    ballColor=color(0, 0, 150);

    for (int b=0;b<2;b++) {
      bY[b]=bY[b]+xVel[b];
      ballColor=color(0, 0, 150);
    }
  }
}


//void update2() {
//  for (int i=0;i<nR;i++) {
//    rX[i]=rY[i]+rV[i];
//  }


