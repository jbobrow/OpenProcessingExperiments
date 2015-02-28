
// Declaring vars
// Not changing
int chairX;
int iniChairY;
int iniChairWidth;
int iniChairBackHeight;
int chairSeatHeight;
int chairDepth;
int espessura;
color main;
color shade;

// Changing
int chairY;
int chairWidth;
int chairBackHeight;

// Jump
Boolean jumping; // if it is jumping or not
float speed;       // the actual and variable speed that will be used in each frame iteration
int gravity;     // the amount of change/accelaration in the speed vector

// The comic balloon
PShape balloon;
PFont balloonFont;

void setup(){
  size(1024, 768);
  background(255);
  noStroke();
  
  // Intializing vars
  // Not changing
  chairX = 200;
  chairY = 700;
  iniChairWidth = 100;
  iniChairBackHeight = 100;
  chairSeatHeight= 100;
  chairDepth = 60;
  espessura = 15;
  main = color(251, 176, 59);
  shade = color(188, 132, 44);

  // Changing
  iniChairY = chairY;
  chairWidth = 100;
  chairBackHeight = 140;

  // Jump
  gravity = 4;
  jumping = false;
  
  // Balloon
  balloon = loadShape("balloon.svg");
  balloonFont = loadFont("GothamRounded-Bold-40.vlw");
}


/*----------- INTERACTION -----------*/
void mouseDragged(){
  if(mouseX >= chairX + iniChairWidth && mouseX <= width){
    chairWidth = mouseX - chairX;
  }
  if(mouseY <= chairY - chairSeatHeight - espessura - chairDepth - iniChairBackHeight && mouseY >= 0){
    chairBackHeight = -mouseY + chairY - chairSeatHeight - chairDepth;
  }
}

void keyPressed(){
  if(keyCode == ' '){
    jumping = true;
    
    // the initial speed will depend on the size of the chair
    speed = 50 - (chairWidth * chairBackHeight)/5000;
    println(speed);
//    speed = constrain(speed, 200, 20);
  }
}

/*----------- DRAWING -----------*/
// Wall
void drawWall(){
  noFill();
  stroke(shade);
  line(0, iniChairY - chairDepth - espessura, width, iniChairY - chairDepth - espessura);  
}

// Balloon
void drawBalloon(){
  float balloonX = chairX + chairWidth/2 - chairDepth + 2*espessura;
  float balloonY = chairY - chairSeatHeight - espessura
                   - chairDepth - chairBackHeight/2 - balloon.height;
  
  // Balloon
  balloon.disableStyle();
  fill(255);
  stroke(shade); 
  shape(balloon, balloonX, balloonY);
  
  // Text
  fill(main);
  textFont(balloonFont);
  textAlign(CENTER, CENTER);
  text("Yay!", balloonX + balloon.width/2, balloonY + balloon.height/2);
}

// Chair Legs
void drawLeg(int tempX, int tempY){
  // Legs
  fill(main);  
  rect(tempX, tempY, espessura, -chairSeatHeight);
  
  fill(shade);
  quad(tempX, tempY,
       tempX, tempY - chairSeatHeight,
       tempX - espessura, tempY - chairSeatHeight - espessura,
       tempX - espessura, tempY - espessura);
}

// Chair
void drawChair(){
  
  // Jump
  if(jumping){
    if(chairY <= iniChairY){
      chairY -= speed;
      speed -= gravity;  
    }else{
      jumping = false;
      chairY = iniChairY;
      speed = 20;
    }
  }
  
  strokeJoin(ROUND);
  strokeWeight(1);
  
  // Legs
  drawLeg(chairX - chairDepth + espessura, chairY - chairDepth);
  drawLeg(chairX - chairDepth + chairWidth - espessura, chairY - chairDepth);    
  drawLeg(chairX, chairY);
  drawLeg(chairX + chairWidth - espessura, chairY);  

  // Seat
  fill(main);
  rect(chairX, chairY - chairSeatHeight, chairWidth, -espessura);
  fill(shade);
  quad(chairX, chairY - chairSeatHeight - espessura,
       chairX - chairDepth, chairY - chairSeatHeight - chairDepth - espessura,
       chairX - chairDepth, chairY - chairSeatHeight - chairDepth,
       chairX, chairY - chairSeatHeight);

  fill(main);
  quad(chairX, chairY - chairSeatHeight - espessura,
       chairX - chairDepth, chairY - chairSeatHeight - chairDepth - espessura,
       chairX - chairDepth + chairWidth, chairY - chairSeatHeight - chairDepth - espessura,
       chairX + chairWidth, chairY - chairSeatHeight - espessura);

  // Back
  fill(main);
  rect(chairX - chairDepth + espessura, chairY - chairSeatHeight - chairDepth,
       chairWidth, -chairBackHeight);
  fill(shade);
  quad(chairX - chairDepth + espessura, chairY - chairSeatHeight - chairDepth,
       chairX - chairDepth + espessura, chairY - chairSeatHeight - chairDepth - chairBackHeight,
       chairX - chairDepth, chairY - chairSeatHeight - chairDepth - chairBackHeight - espessura,
       chairX - chairDepth, chairY - chairSeatHeight - chairDepth - espessura);
  
  quad(chairX - chairDepth + espessura, chairY - chairSeatHeight - chairDepth - chairBackHeight,
       chairX - chairDepth, chairY - chairSeatHeight - chairDepth - chairBackHeight - espessura,
       chairX - chairDepth + chairWidth, chairY - chairSeatHeight - chairDepth - chairBackHeight - espessura,
       chairX - chairDepth + espessura + chairWidth, chairY - chairSeatHeight - chairDepth - chairBackHeight);

  // Face
    //Eyes
    fill(shade);
    ellipse(chairX - chairDepth + espessura + chairWidth/2 - 8, chairY - chairSeatHeight - chairDepth - chairBackHeight/2,
            8, 8);
    ellipse(chairX - chairDepth + espessura + chairWidth/2 + 8, chairY - chairSeatHeight - chairDepth - chairBackHeight/2,
            8, 8);
    
    // Mouth
    noFill();
    stroke(shade);            
    //strokeWeight(5);
    arc(chairX - chairDepth + espessura + chairWidth/2, chairY - chairSeatHeight - chairDepth - chairBackHeight/2,
            50, 50, 0, PI);            
}


/*----------- DRAW LOOP -----------*/
void draw(){
  background(255);
  
  // Wall
  drawWall();
  
  // Chair
  drawChair();
  
  // Balloon
  if(jumping){
    drawBalloon();
  }
}


