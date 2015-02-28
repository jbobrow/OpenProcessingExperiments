
// Declaring vars
// Not changing
int chairX;
int chairY;
int iniChairWidth;
int iniChairBackHeight;
int chairSeatHeight;
int chairDepth;
int espessura;
color main;
color shade;

// Changing
int chairWidth;
int chairBackHeight;

void setup(){
  size(1024, 768);
  background(255);
  noStroke();
  
  // Intializing vars
  // Not changing
  chairX = 200;
  chairY = 600;
  iniChairWidth = 100;
  iniChairBackHeight = 100;
  chairSeatHeight= 100;
  chairDepth = 60;
  espessura = 15;
  main = color(251, 176, 59);
  shade = color(188, 132, 44);

  // Changing  
  chairWidth = 100;
  chairBackHeight = 140;  
}

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

void mouseMoved(){
  if(mouseX > chairX + iniChairWidth && mouseX < width){
    chairWidth = mouseX - chairX;
  }
  
  if(mouseY < chairY - chairSeatHeight - chairDepth - iniChairBackHeight && mouseY > 0){
    chairBackHeight = -mouseY + chairY - chairSeatHeight - chairDepth;
  }  
}

void drawChair(){

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

void draw(){
  background(255);
  //noCursor();
  
  // Wall
  noFill();
  stroke(shade);
  line(0, chairY - chairDepth - espessura, width, chairY - chairDepth - espessura);  
  
  // Chair
  drawChair();
}


