
//drawing variables
boolean bez = true;
float toolBarTop = width/4;

//bezier quality variables
int blue = 0;
int blue2 = 0;
int green2 = 0;
int alpha = 0;
int alpha2 = 0;
float weight = 1;

//bezier end point variables
float wDiv1 = 2;
float hDiv1 = 4;
float wDiv2 = 6;
float hDiv2 = 6;

int x4 = 0;
int y4 = 0;
int x8 = 0;
int y8 = 0;

void setup() {
  size (800, 800);
  background(0);
}
  
  void draw() {
    //toolbar
    drawButtons();
    
    //create beziers
    drawCheck();
    drawBez();
 
  }
  
  //changes color of beziers
 void mouseClicked() {
  blue = blue + 10;
  blue2 = blue2 + 20;
  green2 = green2 + 10;
  weight = random(.5,2);
 }
 void mousePressed() {
  if(mouseY > toolBarTop){ //see if the mouse is below the toolbar line
  if(mouseX < width/2){ // check to see if mouse is over the point button
   bez = false; // this means that the pencil tool is selected
  }
  else if(mouseX > width/2){ //check to see if the mouse is over the bez button
    bez = true; //this means that the bez tool is selected
  }
  else{}
 }
 else {
 }
}

 function drawCheck(){
 if(mouseY < toolBarTop){ //checks to see if the mouse is above the toolbar to avoid drawing in the toolbar
 if(bez){
     stroke(0); //set stroke color to black 
 } 
 else {
  stroke(0);  // set the fill to black 
 }
   
 
}


}

//adds red overlay for layering effect
 void keyPressed () {
   if (key == 'l' ) {
   fill(25, 0, 0, 50);
     rect(0, 0, width, height);  
   }
    if (key == 's') {
    saveDrawing();
  }
  

//resets bezier colors to original red
   if (key == 'n') {
     blue = 0;
     blue2 = 0;
     green2 = 0;
     wDiv1 = 2;
     hDiv1 = 4;
      wDiv2 = 6;
      hDiv2 = 6;
   }
 }
 
  function drawPoint() {
   noStroke();
 fill(170, 0, 0, 255);
 ellipseMode(CENTER);
 ellipse(mouseX, mouseY, 5, 5);

 }
 //function that draws the beziers
 function drawBez() {
   if (bez) {
   int x1 = mouseX;
 int y1 = mouseY;
    int x2 = mouseX + (width - width/6);
    int y2 = mouseY + width/6;
    int x3 = mouseX - width/20;
    int y3 = mouseY;
    int x4 = width/wDiv1;
    int y4 = height/hDiv1;
    int alpha1 = 255;
   
   int x5 = mouseX + width/4;
   int y5 = mouseY;
   int x6 = mouseX + (width - width/6);
   int y6 = mouseY + width/6;
   int x7 = mouseX - width/30;
   int y7 = mouseY;
   int x8 = width/wDiv2;
   int y8 = height/hDiv2;
   int alpha2 = random(0, 50);
   
    noFill();
    strokeWeight(weight);
    stroke(90, 0, blue, alpha1);
    smooth();
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  //  stroke(170, green2, blue2, alpha2);
  // bezier(x5, y5, x6, y6, x7, y7, x8, y8);
   } 
   else {
   drawPoint();
 }
 }
 

 
 
/* function changePos(){
 //want to make new end points with mouse keyboard combo
  if(keyPressed && mousePressed) {
    if(key == 'c') {
    wDiv1 = random(0.25,4.25);
    hDiv1 = random(0.5,4.5);
    wDiv2 = random(0.25,4.25);
    hDiv2 = random(0.5,4.5);
    }
    } 
 }
 */
 
 void drawButtons(){
 
 noFill();
 rect(0, 0, width/2, toolBarTop); //draw black button, the pencil tool
 fill(170, 0, 0);
 ellipseMode(CENTER);
 ellipse(width/4, toolBarTop/2, 5, 5);

 rect(width/2, 0, width/2, toolBarTop); //draw white button, the eraser tool
  stroke(90, 0, 0);
 strokeWeight(2);
 
 line(0, toolBarTop, width, toolBarTop); // draw a line indicating where the toolbar starts
 line(width/2, toolBarTop, width/2, 0); //draw a  line separating the two buttons
}
 function saveDrawing() {
  saveFrame("images/beziers-###.png"); //when running on the web it will put the PNG in a new browser tab
}

 

 
  
  
    



