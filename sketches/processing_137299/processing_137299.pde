

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
    //create beziers
    if (mousePressed) {
    drawBezier();
  }
 changePos();
  }
  
  //changes color of beziers
 void mouseClicked() {
  blue = blue + 10;
  blue2 = blue2 + 20;
  green2 = green2 + 10;
  weight = random(.5,2);
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
   //other possible keyboard color controls
   /*  if (key == 'b' ) {
     blue = blue + 10;
     blue2 = blue2 + 50;
   }
   if (key == 'g') {
     green2 = green2 + 20;
   }
*/
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
 //function that draws the beziers
 function drawBezier() {
    int x1 = mouseX;
    int y1 = mouseY;
    int x2 = mouseX + (width - width/6);
    int y2 = mouseY + width/6;
    int x3 = mouseX - width/20;
    int y3 = mouseY;
    int x4 = width/wDiv1;
    int y4 = height/hDiv1;
    int alpha1 = random(0, 75);
   
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
    stroke(170, green2, blue2, alpha2);
   bezier(x5, y5, x6, y6, x7, y7, x8, y8);
   
   //other bezier points for reference
   //bezier(350, 100, 500, 200, 130, 200, 300, 300);
   // bezier(150, 450, 75, 100, 400, 450, 300, 300);
 }
 function changePos(){
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
 function saveDrawing() {
  saveFrame("images/beziers-###.png"); //when running on the web it will put the PNG in a new browser tab
}

 

 
  
  
    


