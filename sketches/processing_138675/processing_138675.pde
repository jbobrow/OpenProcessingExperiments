
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/137299*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//bezier quality variables
int blue = 0;
int blue2 = 0;
int green2 = 0;
 int alpha1 = random(0, 75);
 int alpha2 = random(0, 50);
float weight = 1;

//bezier end point variables
float wDiv1 = 2;
float hDiv1 = 4;
float wDiv2 = 6;
float hDiv2 = 6;



  
void setup() {
  
  size (800, 800);
  background(0);
}
  
  void draw() {
    
  drawBezier(); // draw beziers
 
 changePos(); // change position of point

  }
  

 void mouseClicked() {
    colChange(); // change color of beziers

}
//adds red overlay for layering effect
 void keyPressed () {
  
   if (key == 'l' ) {
      layerEffect();
    
   }
    if (key == 's') {
    saveDrawing();
  }
  
//resets bezier colors to original red
   if (key == 'n') {
     colReset();
   
   }
 }
 
 // Functions
 
 //function that draws the beziers
 int drawBezier() {
    int x1 = mouseX;
    int y1 = mouseY;
    int x2 = mouseX + (width - width/6);
    int y2 = mouseY + width/6;
    int x3 = mouseX - width/20;
    int y3 = mouseY;
    int x4 = width/wDiv1;
    int y4 = height/hDiv1;
   
   
   int x5 = mouseX + width/4;
   int y5 = mouseY;
   int x6 = mouseX + (width - width/6);
   int y6 = mouseY + width/6;
   int x7 = mouseX - width/30;
   int y7 = mouseY;
   int x8 = width/wDiv2;
   int y8 = height/hDiv2;
   if (mousePressed) {
   
   
    noFill();
    strokeWeight(weight);
    stroke(90, 0, blue, alpha1);
    smooth();
  //  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    stroke(170, green2, blue2, alpha2);
   bezier(x5, y5, x6, y6, x7, y7, x8, y8);
  
   }
 }
 
 
 void changePos(){
 //want to make new end points with mouse keyboard combo
  if(keyPressed && mousePressed) {
    if(key="c") {
    wDiv1 = random(0.25,4.25);
    hDiv1 = random(0.5,4.5);
    wDiv2 = random(0.25,4.25);
    hDiv2 = random(0.5,4.5);
    }
    } 
 }
 
 
 void layerEffect() { // red overlay
    fill(25, 0, 0, 50);
     rect(0, 0, width, height);
 }
 
 
 void colChange() { // change color of beziers
     blue = blue + 10;
  blue2 = blue2 + 20;
  green2 = green2 + 10;
  weight = random(.5,2); 
 }
 
 
 void colReset() {
   blue = 0;
     blue2 = 0;
     green2 = 0;
     wDiv1 = 2;
     hDiv1 = 4;
      wDiv2 = 6;
      hDiv2 = 6;
 }
 
 
 function saveDrawing() {
  saveFrame("images/beziers-###.png"); //when running on the web it will put the PNG in a new browser tab
}

 

 
  
  
    



