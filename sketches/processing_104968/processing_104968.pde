
// Declaring vars
int chairX;
int chairY;
int chairWidth;
int chairSeatHeight;
int chairBackHeight;
int chairDepth;
int espessura;
color main;
color shade;

void setup(){
  size(1024, 768);
  background(255);
  
  // Intializing vars
  chairX = width/2;
  chairY = height/2;
  chairWidth = 100;
  chairSeatHeight= 100;
  chairBackHeight = 140;
  chairDepth = 60;
  espessura = 15;
  main = color(251, 176, 59);
  shade = color(188, 132, 44);  
}

void drawChair(){
  //drawing
  // Legs
  fill(shade);  
  rect(chairX, chairY, espessura, -chairSeatHeight);
  rect(chairX + chairWidth, chairY, -espessura, -chairSeatHeight);
  rect(chairX - chairDepth, chairY - chairDepth, espessura, -chairSeatHeight);
  rect(chairX - chairDepth + chairWidth, chairY - chairDepth, -espessura, -chairSeatHeight);  

  // Seat
  fill(shade);
  rect(chairX, chairY - chairSeatHeight, chairWidth, -espessura);
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
  rect(chairX - chairDepth, chairY - chairSeatHeight - chairDepth - espessura,
       chairWidth, -chairBackHeight);
}

void draw(){
  background(255);
  drawChair();
}


