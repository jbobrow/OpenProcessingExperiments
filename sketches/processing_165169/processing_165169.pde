
PImage[] pics = new PImage[4]; // holds tetris blocks
PFont font;

void setup(){
  size(600,600,P2D);
  colorMode(HSB,360,100,100);
  font = loadFont("28DaysLater-100.vlw");
  textFont(font);
  
  // tetris block images
  pics[0] = loadImage("tetris_blue.png"); //138 x 395
  pics[1] = loadImage("tetris_red.png"); //206 x 316
  pics[2] = loadImage("tetris_green.png"); //206 x 315
  pics[3] = loadImage("tetris_yellow.png"); //275 x 316
}



int isSelected = 0;
float SIZE=1; // for the size selector for the brushes
float Weight=0; // weight for stroke in B2
float distance = 0; // distance for line in B2
float dimen = 0; // dimensions for ellipses in B2
int frame = 0; // array frame for BLOCKZ()
float HUE = 0;
color FILL=color(0,0,0);



void draw(){
  cursor(CROSS);  // default cursor
  color FILL=color(HUE,99,99); // for the color selector for the brushes
  
  
  // BRUSH FUNCTION CALLS
  
  if(mouseX < 570){                             // can't draw around sliders
    if(mouseY > 60 || mouseX > 360){            // can't draw around buttons
      
      if(isSelected==1 && mousePressed==true){
        Airbrush(SIZE,FILL);                    // draws points randomnly around mouse
      }
      
      if(isSelected==2 && mousePressed==true){
        paintSplatter(FILL);                    // draws a blobby/splatty line
      }
      
      if(isSelected==3 && mousePressed==true){
        tetrisBlue(SIZE);                       // draws blue tetris block
      }
      
      if(isSelected==4 && mousePressed==true){
        tetrisRed(SIZE);                        // draws red tetris block
      }
      
      if(isSelected==5 && mousePressed==true){
        tetrisGreen(SIZE);                      // draws green tetris block
      }
      
      if(isSelected==6 && mousePressed==true){
        tetrisYellow(SIZE);                      // draws yellow tetris block
      }
      
      if(isSelected==7 && mousePressed==true){
        BLOCKZ(SIZE);                            // Shit gets crazy
      }
    }
  }
  
  
  
  // USER INTERFACE DRAW
  
  // Color Selector
  noStroke();              // Draw black rectangle for slider
  fill(0);
  rect(570, 0, 50, 370);
  stroke(360);  // Draw color indicator
  strokeWeight(1);
  fill(FILL);
  rect(570, HUE, 30, 10);
  if(mouseY <360 && mouseY >0){   // Check if mouse in color select region
    if(mouseX > 570){
      if(mousePressed == true){    // Check if mouse clicked
        noStroke();               // Draw indicator rectangle and set color
        fill(FILL);
        rect(570, mouseY, 30,10);
        HUE = mouseY;
      }
    }
  }
  
  // Size Selector
  noStroke();              // Draw white rectangle for slider
  fill(360);
  rect(570, 400, 50, 600);
  noStroke();
  fill(0);
  rect(570, SIZE+400, 30, 10);
  if(mouseY <600 && mouseY >400){   // Check if mouse in size select region
    if(mouseX > 570){
      if(mousePressed == true){     // Check if mouse clicked
        noStroke();                 // Draw indicator rectangle and set size
        fill(0);
        rect(570, mouseY, 30,10);
        SIZE = mouseY - 400;
      }
    }
  }
      
  
  if(isSelected!=1){    // draw B1 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(5,5,45,45);
  }
  if(isSelected!=2){    // draw B2 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(55,5,45,45);
  }
  if(isSelected!=3){    // draw B3 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(105,5,45,45);
  }
  if(isSelected!=4){    // draw B4 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(155,5,45,45);
  }
  if(isSelected!=5){    // draw B5 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(205,5,45,45);
  }
  if(isSelected!=6){    // draw B6 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(255,5,45,45);
  }
  if(isSelected!=7){    // draw B7 not selected
    stroke(0);
    strokeWeight(1);
    fill(360);
    rect(305,5,45,45);
  }
  
  
  
  
  // SELECT WITH MOUSE
  
  if(mouseY < 50 && mouseY > 5){   // mouse in button y range
    
    if(mouseX < 50 && mouseX > 5){ // mouse over button 1
      cursor(HAND);                // selection available
      if(mousePressed == true){    // mouse pressed button 1
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);              // change color of button, B1 is selected
        rect(5,5,45,45);
        isSelected = 1;
      } 
    }
    
    if(mouseX < 100 && mouseX > 55){ // mouse over B2
      cursor(HAND);                  // selection available
      if(mousePressed == true){      // mouse pressed B2
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);                // change color of button, B2 is selected
        rect(55,5,45,45);
        isSelected = 2;
      } 
    }
    
    if(mouseX < 150 && mouseX > 105){ // mouse over B3
      cursor(HAND);                   // selection available
      if(mousePressed == true){       // mouse pressed B3
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);                 // change color of button, B3 is selected
        rect(105,5,45,45);
        isSelected = 3;
      } 
    }
    
    if(mouseX < 200 && mouseX > 155){ // mouse over B4
      cursor(HAND);                   // selection available
      if(mousePressed == true){       // mouse pressed B4
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);                 // change color of button, B4 is selected
        rect(155,5,45,45);
        isSelected = 4;
      } 
    }
    
    if(mouseX < 250 && mouseX > 205){ // mouse over B5
      cursor(HAND);                   // selection available
      if(mousePressed == true){       // mouse pressed B5
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);                 // change color of button, B5 is selected
        rect(205,5,45,45);
        isSelected = 5;
      } 
    }
    
    if(mouseX < 300 && mouseX > 255){ // mouse over B6
      cursor(HAND);                   // selection available
      if(mousePressed == true){       // mouse pressed B6
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);                 // change color of button, B6 is selected
        rect(255,5,45,45);
        isSelected = 6;
      } 
    }
    
    if(mouseX < 350 && mouseX > 305){ // mouse over B7
      cursor(HAND);                   // selection available
      if(mousePressed == true){       // mouse pressed B7
        stroke(0);
        strokeWeight(1);
        fill(0,0,60);                 // change color of button, B7 is selected
        rect(305,5,45,45);
        isSelected = 7;
      } 
    }
  }
  
  
  
  
  // SELECT WITH KEYBOARD
  
  if(keyPressed){
    if(key=='1'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B1 is selected
      rect(5,5,45,45);
      isSelected = 1;
    }
    if(key=='2'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B2 is selected
      rect(55,5,45,45);
      isSelected = 2;
    }
    if(key=='3'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B3 is selected
      rect(105,5,45,45);
      isSelected = 3;
    }
    if(key=='4'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B4 is selected
      rect(155,5,45,45);
      isSelected = 4;
    }
    if(key=='5'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B5 is selected
      rect(205,5,45,45);
      isSelected = 5;
    }
    if(key=='6'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B6 is selected
      rect(255,5,45,45);
      isSelected = 6;
    }
    if(key=='7'){
      stroke(0);
      strokeWeight(1);
      fill(0,0,60);              // change color of button, B7 is selected
      rect(305,5,45,45);
      isSelected = 7;
    }
  }
  pushMatrix();                  // draw icon for B3
  translate(122,10);
  scale(0.1);
  image(pics[0], 0,0);
  popMatrix();
  pushMatrix();                  // draw icon for B4
  translate(167,13);
  scale(0.1);
  image(pics[1], 0,0);
  popMatrix();
  pushMatrix();                  // draw icon for B5
  translate(217,13);
  scale(0.1);
  image(pics[2], 0,0);
  popMatrix();
  pushMatrix();                  // draw icon for B6
  translate(265,13);
  scale(0.1);
  image(pics[3], 0,0);
  popMatrix();
  fill(0);
  text("?", 325, 30);
}



// BRUSH FUNCTIONS

//Brush 1
void Airbrush(float SIZE, color FILL){
  for(int i = -SIZE; i < SIZE+1; i++){
    stroke(FILL);
    point(mouseX+random(i*-1), mouseY+random(i));
  }
  for(int i = -SIZE; i < SIZE+1; i++){
    stroke(FILL);
    point(mouseX+random(i), mouseY+random(i));
  }
}

//Brush 2
void paintSplatter(color FILL){
  distance = dist(pmouseX,pmouseY,mouseX,mouseY);
  dimen = random(30-distance);
  if(10-distance/4 < 1){
    Weight = 1+random(3);
  } 
  else{
    Weight = 10-distance/4;
  }
  if(distance < 10){
    noStroke();
    fill(FILL);
    ellipse(mouseX,mouseY,dimen,dimen);
  }
  strokeWeight(Weight);
  strokeCap(ROUND);
  stroke(FILL);
  line(pmouseX,pmouseY,mouseX,mouseY);
}

//Brush 3
void tetrisBlue(float SIZE){
  pushMatrix();
  translate(mouseX,mouseY);
  scale(SIZE/50);
  image(pics[0],0,0);
  popMatrix();
}

//Brush 4
void tetrisRed(float SIZE){
  pushMatrix();
  translate(mouseX,mouseY);
  scale(SIZE/50);
  image(pics[1],0,0);
  popMatrix();
}

//Brush 5
void tetrisGreen(float SIZE){
  pushMatrix();
  translate(mouseX,mouseY);
  scale(SIZE/50);
  image(pics[2],0,0);
  popMatrix();
}

//Brush 6
void tetrisYellow(float SIZE){
  pushMatrix();
  translate(mouseX,mouseY);
  scale(SIZE/50);
  image(pics[3],0,0);
  popMatrix();
}

//Brush 7
void BLOCKZ(float SIZE){
  pushMatrix();
  translate(mouseX,mouseY);
  scale(random(SIZE/50));
  rotate(random(TWO_PI));
  image(pics[int(random(4))]);
  popMatrix();
}


