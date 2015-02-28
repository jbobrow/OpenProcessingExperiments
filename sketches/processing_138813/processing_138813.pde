
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/138693*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//drawing variables
boolean bez = true;
boolean dot = false;

//toolbar variables
float toolBarTop = width/4;
 

//bezier quality variables
int blue = 1;
int blue2 = 0;
int green2 = 0;
float alpha1 = 0;
float alpha2 = 0;
float weight = 1;


//setting bezier mouse click points
float x4 = random(0.25,4.25);
float y4 = random(0.25,4.25);
    

void setup() {
  size (800, 800);
  background(0);
  
}
  
  void draw() {
    //toolbar
    drawButtons();
    
    //create beziers
    if(mousePressed) {
    drawBez();
    }
  }
  
  //changes color of beziers
 void mouseClicked() {
   
    colChange();
    if(dot) {
    dot = false;
   drawDot();
  
    }
     toolbarCheck();
   
}

 


//adds red overlay for layering effect
 void keyPressed () {
   if (key == 'l' ) {
     
   layerChange(); 
   
   }
    if (key == 's') { //save drawing
      
    saveDrawing();
    
  }
  

//resets bezier colors to original red
   if (key == 'n') {
     
   colReset();
   
   }
 }
 
 
 // Functions
 
 void toolbarCheck() {
   
      if(mouseY < toolBarTop){ //see if mouse is above toolbar line
   bez = false; // this means that the pencil tool is selected
   dot = true;
  
  
  }
 
 }


void colReset() { //resets bezier colors to original red
  
  blue = 0;
  blue2 = 0;
  green2 = 0;
      
      }
      
      
void layerChange() { //adds red overlay for layering effect
  noStroke();
  fill(25, 0, 0, 50);
     rect(0, 0, width, height); 
     
}


void colChange() {  //changes color of beziers
 blue = blue + 10;
 blue2 = blue2 + 20;
 green2 = green2 + 10;
 weight = random(.5,2);
}





  void drawDot() {
    x4 = mouseX;
    y4 = mouseY;
   noStroke();
 fill(90, 0, blue, 175);
 ellipseMode(CENTER);
 ellipse(mouseX, mouseY, 3, 3);
 bez = true;
 dot = false;

 }
 //function that draws the beziers
 void drawBez() {
   if(bez && mouseY > toolBarTop) {
    int x1 = mouseX;
    int y1 = mouseY;
    int x2 = mouseX + (width - width/6);
    int y2 = mouseY + width/6;
    int x3 = mouseX - width/20;
    int y3 = mouseY;
    
   alpha1 = random(1, 75);
   alpha2 = random(1, 50);
   
    noFill();
    strokeWeight(weight);
    stroke(90, 0, blue, alpha1);
    smooth();
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  //  stroke(170, green2, blue2, alpha2);
  // bezier(x5, y5, x6, y6, x7, y7, x8, y8);
   } 
   else {
   
 }
 }
 

 
 

 
 void drawButtons(){  // draws button at top of screen
   smooth();
 alpha1 = random(1, 75);
 stroke(90, 0, blue, 175);
 noFill();
 ellipse(width/2, toolBarTop/2+5, 30, 30);
 strokeWeight(1);
 fill(90, 0, blue, 175);
 ellipseMode(CENTER);
 ellipse(width/2, toolBarTop/2+5, 10, 10);
;
 

}
 void saveDrawing() { //saves drawing
  saveFrame("images/beziers-###.png"); //when running on the web it will put the PNG in a new browser tab
}

 

 
  
  
    




