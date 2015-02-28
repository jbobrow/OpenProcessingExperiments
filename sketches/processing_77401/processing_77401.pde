
//Drawing Program//Midterm//Hannah Kim

int greenColor;
int colorThing;
int pandabrush;
int eraser;
int squarebutton;
int black;
int counter;
int sinebutton;
PImage myimg;
 
void setup(){
  background(255);
  size(500, 500);
  smooth();
  colorThing = 0;
  pandabrush = 1;
  eraser = 0;
  squarebutton = 0;
  sinebutton = 0;
  black = 0;
  strokeWeight(.5);
  myimg = loadImage("dottie.png");
}
 
 
void draw(){
  
//frieze pattern of dot  
  for (int i = 0; i < 30; i++) {
     pushMatrix();
       translate(i*20+20,475);
          if(i % 2 == 1){
          translate(0,-3);
          rotate(radians(180));
          } else {
            rotate(radians(0));
          }
          image(myimg,0,0);
     popMatrix();
  }
  
  
//eraser button
  fill (100);
  rect(20,20,100,30);
  fill(0);
  text("eraser",50,40);
  counter++;
  if(mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50) {   
    counter = 0;
    if(eraser == 0) {
  eraser = 1;
  pandabrush = 0;
  }
  else {
  eraser = 0;
  pandabrush = 1;
    }
  }
  
//square button
  fill(100);
  rect(170,20,70,30);
  fill(0);
  text("square",185,40);
  if(mouseX > 170 && mouseX < 240 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50) {
    counter = 0;
    if(squarebutton == 0) { 
      pandabrush = 1;
      eraser = 0;
      squarebutton = 1;
    }
    else {
      squarebutton = 0;
    }    
  }
  
//sine button
  fill(100);
  rect (270,20,70,30);
  fill(0);
  text("sine", 290,40);
  if(mouseX > 280 && mouseX < 350 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50) {
    counter = 0;
    if(sinebutton == 0) {
      pandabrush = 1;
      eraser = 0;
      sinebutton = 1;
    }
    else{
      sinebutton = 0;
    }
  }
  
  
//black button
  fill(100,100,100);
  rect(380,20,70,30);
    fill(0);
    text("black",400,40);
    if(mouseX > 380 && mouseX < 450 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50){
      counter = 0;
      if(black == 0) {
        black= 1; 
        }
      else {
        black = 0;
      }
    }
    
//conditional for color
    if (pandabrush == 1) {
    if (mousePressed == true) {
      if(black == 1) {
        fill(0);
      }
      else {
      fill(colorThing,greenColor,90);
      }
      
      
//conditional for square button
    if (squarebutton == 1) {
      for(int i = 0; i < 5; i = i+1) {
      rect (pmouseX+i*3, pmouseY+i*5, mouseX-pmouseX, mouseY-pmouseY);
    }
  }
    else
    {
      
      
//conditional for sine button
  if (sinebutton == 1) {
    for(int i = 0; i < 5; i = i++) {
      ellipse (mouseX+40*sin(mouseX/5), mouseY+50*tan(mouseY/10), 10, 10);
    }
  }
  else
    {
      
      
//conditional for ellipse button
      for(int i = 0; i < 5; i++) {
        ellipse (pmouseX+i*3, pmouseY, i*2,i*2);
    }
    }
    
    
//conditional for color
      colorThing ++;
      greenColor ++;
      }
      if(mouseX > 100 && mouseX < 150 && mouseY > 150 && mouseY < 170){
      if (mousePressed){
      fill(255,0,0);
      } else {
      fill(0,0,255);
      }
      }
}
    }
   
 //conditional for eraser button  
   if (eraser == 1 && mousePressed == true) {
     noStroke();
     fill(255);
     rect(pmouseX,pmouseY,20,20);
   }    
}

/*class BrushButton {
  int brushlocationX;
  int brushlocationY;
  boolean brushshape;
  int brushsize;
  
//constructor
BrushButton(int _brushlocationX, int _brushlocationY, boolean _brushshape, int _brushsize) {
  brushlocationX = _brushlocationX;
  brushlocationY = _brushlocationY;
  brushshape = _brushshape;
  brushsize = _brushsize;
}

//methods
void coordinates () {
  if(mouseX > brushlocationX && mouseX < brushlocationX + brushsize && mouseY > brushlocationY && mouseY < brushlocationY + brushsize){
    currentShape = brushshape;
  }
}
 
void display () {
  fill(255);
  rect (brushlocationX, brushlocationY, brushsize, brushsize);
  fill(0);
  
  if(brushshape = false) {
      ellipse (brushlocationX, brushlocationY, 20, 20);
    }
  else if (brushshape = true) {
      rect (brushlocationX+(brushsize/4), brushlocationY+(brushsize/4), brushlocationX+(brushsize/4), brushlocationY+(brushsize/4));
    }
}
  

}
*/


