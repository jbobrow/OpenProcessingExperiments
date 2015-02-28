
//set varibles: 
//import processing.pdf.*; // calling the import file processing library 
//float angle = 0; // name to call for the ability to change the angle 
// int line1= ; // integer for option of line 1 
// int line2= ; // integer for option of line 2 
// int line3= ; // int for option of line 3 
// int aline= ; // array line 

//intd1 = ellipse (mouseX, mouseY, 50, 50);
int state = 0;



//set up everything to be drawn
void setup() {
  size (600, 600); // size of canvas
  stroke(0); // the line 
  strokeWeight(random(5)); // the thickness of the line
  background(255); // background color 
  smooth(); // style of line
} 

void draw() {
  //Three drawing options

  //Line option one symetrical black ink tool: 
  //  point (mouseX, mouseY);// (some for the line to start from) 
  //  point ((10-mouseX), mouseY); // (point for line to start from) 
  //  //strokeWeight(()); // line weight for this drawing tool 
  //  stroke(0, 5);// stroke color 

  if (key=='1') { 
    state= 1;
  } 

  if (state==1) { 
    drawingTool1();
    
  } 
  
 if (key == '2') { 
     state= 2;
 } 
 
  if (state== 2) { 
    drawingTool2();
  }
  
   if (key== '3') { 
     state= 3;
 } 
  
    if (state== 3) { 
    drawingTool3();
  }
  
 if (key== '4'){
   state=4; 
 } 
 
 if (state== 4){ 
   drawingTool4(); 
 } 
 
 if (key=='5'){
   state= 5; 
   
 } 
 
 if (state== 5){
   drawingTool5(); 
} 
}

 


// this coorisponds to the symetrical line line 1 ////
void mouseDragged() {
  stroke (0, 90);
  strokeWeight(1);
  line(pmouseX, pmouseY, mouseX, mouseY); // line 
  line((600-pmouseX), pmouseY, (600-mouseX), mouseY); // line opposite
}

//this corrisponds to the symetrical line line d1//
void mouseClicked() { // changing backgrond color when mouse clicked 
  background(255);
}

void  drawingTool1(){
ellipse (mouseX, mouseY, 50, 50);
fill(0013);
}

void drawingTool2(){
   ellipse (mouseX, mouseY, 100, 100);
   fill(0050);
   //smooth(); /// I can add stroke weight and color etc//
 
}


void drawingTool3(){ 
   ellipse(mouseX, mouseY, 25, 10);
   fill(0070);
//  stroke(0,10); 
//  smooth(); /// I can add stroke weight and color etc//
} 

void drawingTool4(){ 
  ellipse(mouseX, mouseY, 50, 100);
  fill(4350);
  ellipse(mouseX, mouseY, 20, -5);
  smooth();
//  background(255);
//  frameRate (70); 
} 

void drawingTool5(){ 
stroke(0);
strokeWeight(random(10));
point(mouseX,mouseY);
point((600-mouseX),mouseY);
strokeWeight(12);
stroke(0,40);
point (mouseX, mouseY);// (some for the line to start from) 
point ((10-mouseX), mouseY); // (point for line to start from) 
//strokeWeight(()); // line weight for this drawing tool  
 
} 

//Key Pressed (or words first start with keys) 
// If B Key is pressed line changes color to blue
//If G key is pressed change line color to green 
// If Y key is pressed chane line color to yellow 
// If R key is pressed change line color to red 

//Word Written to change line quality 
//If om is written change to line option 2 
// If paz is written change line to option 3 

// Notes: 
//I need lines to be called only if they are through the key pressed.
//I think this means that I need to make each type of line its own function. 
// I would like to add a song that plays in the background. 


