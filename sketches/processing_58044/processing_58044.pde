
// Created by Ryan Carrington
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Picture Window House by Shigeru Ban
 

// Declare two arrays with 50 elements.
int[] xpos = new int[50]; 
int[] ypos = new int[50];
int[] fpos = new int[50]; 
int[] gpos = new int[50];
int[] upos = new int[50]; 
int[] tpos = new int[50];
int[] lpos = new int[50]; 
int[] kpos = new int[50];
int y = 0;
int v = 0;
// Four variables, one for each square's brightness level
float room0 = 0;
float room1 = 0;
float room2 = 0;
float room3 = 0;
float room4 = 0;
float room5 = 0;
float room6 = 0;
float room7 = 0;
float room8 = 0;
float field1 = 0;
float field2 = 0;
// Starting angle
float theta = 0.0;

void setup() {
  size(600,700);
  
  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
    for (int j = 0; j < xpos.length; j ++ ) {
    fpos[j] = 0; 
    gpos[j] = 0;
  }
}

void draw() {
  background(255);
  
      noStroke();
  fill(0, 150);
  rect (0,0, 600, 1500);
  stroke (255, 255, 255);
  
if (mouseY < 285) {
    field1 = 200;
 }else if (mouseY > 285) {
    field2 = 200;
}

field1 = field1 - 4;
field2 = field2 - 4;

 noStroke(); 
  fill(field1);
  rect(0, 0, 600,285);
  fill(field2);
  rect(0, 285, 600,1000);
  
   // Sea Shore
  theta += 0.01;
  noStroke();
  fill(243,234,96,150);
  float w = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1600/2,5,5);
    // Move along x-axis
    w += .03;
  }
    theta += 0.02;
  noStroke();
  fill(243,234,96,150);
  float w1 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1500/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(243,234,96,150);
  float w2 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1400/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(243,234,96,150);
  float w3 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1300/2,5,5);
    // Move along x-axis
    w += .05;
  }
  
    theta += 0.02;
  noStroke();
  fill(243,234,96,150);
  float w4 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1200/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(244,238,134,150);
  float w5 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1100/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(244,240,175,150);
  float w6 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 1000/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(240,238,201,150);
  float w7 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 900/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(243,242,225,150);
  float w8 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 800/2,5,5);
    // Move along x-axis
    w += .05;
  }
  
    theta += 0.02;
  noStroke();
  fill(240,238,201,150);
  float w9 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 700/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(240,238,201,150);
  float w10 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 600/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(240,238,201,150);
  float w11 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 500/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(201,229,240,150);
  float w12 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 400/2,5,5);
    // Move along x-axis
    w += .05;
  }
    theta += 0.02;
  noStroke();
  fill(165,217,238,150);
  float w13 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 300/2,5,5);
    // Move along x-axis
    w += .05;
  }
  
    theta += 0.02;
  noStroke();
  fill(141,209,236,150);
  float w14 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 200/2,5,5);
    // Move along x-axis
    w += .05;
  }
    
    theta += 0.02;
  noStroke();
  fill(141,209,236, 150);
  float w15 = theta;
  
   // Draws all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 70; i++) {
    // Calculate y value based off of sine function
    float b = sin(w)*300/15;
    // Draw an ellipse
    ellipse(i*10,b + 100/2,5,5);
    // Move along x-axis
    w += .05;
  }

//Balcony with segmented panels  
fill(6,13,15);
strokeWeight (1);
strokeCap(ROUND);
rect(95, 370, 410,115);

fill(240,172,24, 200);
strokeWeight(1);
rect(102, 386, 10, 92);
rect(114, 386, 10, 92);
rect(126, 386, 10, 92);
rect(138, 386, 10, 92);
rect(150, 386, 10, 92);
rect(162, 386, 10, 92);
rect(174, 386, 10, 92);
rect(186, 386, 10, 92);
rect(199, 386, 10, 92);
rect(212, 386, 10, 92);
rect(224, 386, 10, 92);
rect(236, 386, 10, 92);
rect(248, 386, 10, 92);
rect(260, 386, 10, 92);
rect(272, 386, 10, 92);
rect(284, 386, 10, 92);
rect(296, 386, 10, 92);
rect(308, 386, 10, 92);
rect(320, 386, 10, 92);
rect(332, 386, 10, 92);
rect(344, 386, 10, 92);
rect(356, 386, 10, 92);
rect(368, 386, 10, 92);
rect(380, 386, 10, 92);
rect(392, 386, 10, 92);
rect(404, 386, 10, 92);
rect(416, 386, 10, 92);
rect(428, 386, 10, 92);
rect(440, 386, 10, 92);
rect(452, 386, 10, 92);
rect(464, 386, 10, 92);
rect(476, 386, 10, 92);
rect(488, 386, 10, 92);
  
fill(7,8,9);
strokeWeight(0);
strokeCap(ROUND);
rect(0, 225, 600, 150);  
fill(26, 97, 169, 20);
strokeWeight(1);
strokeCap(ROUND);
rect(0, 225, 600, 150);



  // Depending on the mouse location, a different rectangle is displayed.    
  if (mouseX > 100 && mouseX < 200 && mouseY >285 && mouseY <650) {
    room0 = 255;
  } else if (mouseX > 200 && mouseX <300 && mouseY >285 && mouseY <650) {
    room1 = 255 ;
  } else if (mouseX > 300 && mouseX <400 && mouseY > 285 && mouseY <650) {
    room2 = 255;
  } else if (mouseX > 400 && mouseX <500 && mouseY > 285 && mouseY <650) {
    room3 = 255;
  } else if (mouseX > 100 && mouseX <500 && mouseY < 285 && mouseY >50) {
    room4 = 255;

  } else if (mouseX > 500 && mouseX < 600 && mouseY >285 && mouseY < 650){
     room6 = 150;
  } else if (mouseX > 500 && mouseX < 600 && mouseY < 285 && mouseY > 50){
     room7 = 150;
  } else if (mouseX > 15 && mouseX < 100 && mouseY > 50 && mouseY <650){
     room8 = 150;
  } 
  
   // All rectangles always fade
  room0 = room0 - 4;
  room1 = room1 - 4;
  room2 = room2 - 4;
  room3 = room3 - 4;
  room4 = room4 - 4;
  room6 = room6 - 6;
  room7 = room7 - 5;
  room8 = room8 - 5;

  // Fill color and draw each rectangle
  noStroke(); 
  fill(room0);
  rect(100, 285, 95,85);
  fill(room1);
  rect(200, 285, 95,85);
  fill(room2);
  rect(300, 285, 95,85); 
  fill(room3);
  rect(400, 285, 95,85);
  fill(room4);
  rect(100, 229, 395, 50);
  fill(room6);
  rect(500, 270,80,100);
  fill(room7);
  rect(500,229,80, 35);
  fill(room8);
  rect(15,229, 80,140);
  
//Components within the rooms

//stairs
fill(230);
rect(250,234, 10,25);
fill(210);
rect(260,234, 10,25);
fill(170);
rect(270,234, 10,25);
fill(140);
rect(280,234, 10,25);
fill(110);
rect(290,234, 10,25);
fill(80);
rect(300,234, 10,25);
fill(60);
rect(310,234, 10,25);
fill(40);
rect(320,234, 10,25);
fill(20);
rect(330,234, 10,25);
fill(10);
rect(340,234, 10,25);


fill(7,8,9, 500);
strokeWeight(1);
strokeCap(ROUND);
int x = 15;
int c = 285;
rect(125, c, x, x);
rect(140, c, x, x);
rect(155, c, x, x);
rect(205, c, x, x);
rect(220, c, x, x);
rect(235, c, x, x);
rect(250, c, x, x);
rect(320, c, x, x);
rect(335, c, x, x);
rect(350, c, x, x);
rect(420, c, x, x);
rect(435, c, x, x);
rect(450, c, x, x);
rect(90, 305, 18, 60);
rect(500, 235, 15, 30);

// Moving sun/orb
  for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // New location
  xpos[xpos.length-30] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    if (mouseY<285) {
    fill(229,243,249,100);
    ellipse(xpos[i],ypos[i],i,i);
  }else if (mouseY>285) {
    fill (249,248,200,100);
     ellipse(xpos[i],ypos[i],i,i);
  }}
  
    for (int j = 0; j < xpos.length-1; j ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    fpos[j] = fpos[j+1];
    gpos[j] = gpos[j+1];
  }
  
  // New location
  fpos[fpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  gpos[gpos.length-30] = mouseY;
  
  // Draw everything
  for (int j = 0; j < fpos.length; j ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    if (mouseY<285) {
    fill(229,243,249,100);
    ellipse(fpos[j],gpos[j],j,j);
  }else if (mouseY>285) {
    fill (249,248,200,100);
     ellipse(fpos[j],gpos[j],j,j);
  }}
   for (int q = 0; q < upos.length-1; q ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    upos[q] = upos[q+1];
    tpos[q] = tpos[q+1];
  }
  
  // New location
  upos[upos.length-20] = mouseX; // Update the last spot in the array with the mouse location.
  tpos[tpos.length-1] = mouseY;
  
  // Draw everything
  for (int q = 0; q < upos.length; q ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    if (mouseY<285) {
    fill(229,243,249,100);
    ellipse(upos[q],tpos[q],q,q);
  }else if (mouseY>285) {
    fill (249,248,200,100);
     ellipse(upos[q],ypos[q],q,q);
  }}
  
    for (int e = 0; e < kpos.length-1; e ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    kpos[e] = kpos[e+1];
    lpos[e] = lpos[e+1];
  }
  
  // New location
  kpos[kpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  lpos[lpos.length-20] = mouseY;
  
  // Draw everything
  for (int e = 0; e < kpos.length; e ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    if (mouseY<285) {
    fill(229,243,249,100);
    ellipse(kpos[e],lpos[e],e,e);
  }else if (mouseY>285) {
    fill (249,248,200,100);
     ellipse(kpos[e],lpos[e],e,e);
  }}
}

//Lower Level
void mouseDragged() {

//Lower Balcony 
fill(6,13,15);
strokeWeight (1);
strokeCap(ROUND);
rect(95, 370, 410,115);

//Slabs on lower balcony
fill(240,172,24, 200);
strokeWeight(1);
rect(97, 371, 405, 10);
rect(97, 384, 405, 7);
rect(97, 394, 405, 7);
rect(97, 404, 405, 7);
rect(97, 414, 405, 7);
rect(97, 424, 405, 7);
rect(97, 434, 405, 7);
rect(97, 444, 405, 7);
rect(97, 454, 405, 7);
rect(97, 464, 405, 7);
rect(97, 474, 405, 7);


//Main House
  fill(7,8,9);
strokeWeight(0);
strokeCap(ROUND);
rect(0, 225, 600, 150);  
fill(26, 97, 169, 20);
strokeWeight(1);
strokeCap(ROUND);
rect(0, 225, 600, 150);

if (mouseX > 100 && mouseX <500 && mouseY > 50 && mouseY <650) {
    room5 = 255;
 }else if (mouseX > 500 && mouseX < 600 && mouseY >285 && mouseY < 650){
     room6 = 150;
  }else if (mouseX > 500 && mouseX < 600 && mouseY < 285 && mouseY > 50){
     room7 = 150;
  } else if (mouseX > 15 && mouseX < 100 && mouseY > 50 && mouseY <650){
     room8 = 150;
  } 
  
 
 room5 = room5 - 4;
 room6 = room6 - 5;
 room7 = room7 - 5;
 room8 = room8 - 5;
 
  // Fill color and draw each rectangle
  fill(room5);
  rect(100, 229, 395, 140);
  fill(room6);
  rect(500, 270,80,100);
  fill(room7);
  rect(500,229,80, 35);
  fill(room8);
  rect(15,229, 80,140);
  
  //stairs
fill(10);
rect(290,234, 10,25);
fill(20);
rect(300,234, 10,25);
fill(40);
rect(310,234, 10,25);
fill(60);
rect(320,234, 10,25);
fill(80);
rect(330,234, 10,25);
fill(110);
rect(340,234, 10,25);
fill(140);
rect(350,234, 10,25);
fill(170);
rect(360,234, 10,25);
fill(210);
rect(370,234, 10,25);
fill(230);
rect(380,234, 10,25);

//Furniture within space
fill(7,8,9, 500);
strokeWeight(1);
strokeCap(ROUND);
rect(500,270,80, 18);
rect(500,325, 18, 40);
rect(120,240, 110, 10);
rect(120,260, 110, 25);
rect(90, 305, 18, 60);

}

void keyTyped() {
//  saveFrame("top-####.tif");
}



