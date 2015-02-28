
int greenColor;
int colorThing;
int panda;
int eraser;
int squarebutton;
int black;
int counter;
 
void setup(){
  background(200);
  size(500, 500);
  smooth();
  colorThing = 0;
  panda = 1;
  eraser = 0;
  squarebutton = 0;
  black = 0;
  strokeWeight(.5);
}
 
void draw(){
  fill (100);
  rect(20,20,100,30);
  fill(0);
  text("eraser",50,40);
  counter++;
  if(mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50) {   
    counter = 0;
    if(eraser == 0) {
  eraser = 1;
  panda = 0;
  }
  else {
  eraser = 0;
  panda = 1;
    }
  }
  fill(100);
  rect(200,20,100,30);
  fill(0);
  text("square shape",210,40);
  if(mouseX > 210 && mouseX < 300 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50) {
    counter = 0;
    if(squarebutton == 0) { 
      panda = 1;
      eraser = 0;
      squarebutton = 1;
    }
    else {
      squarebutton = 0;
    }    
  }
  fill(100,100,100);
  rect(380,20,50,30);
    fill(0);
    text("black",390,40);
    if(mouseX > 380 && mouseX < 480 && mouseY > 20 && mouseY < 50 && mousePressed && counter > 50){
      counter = 0;
      if(black == 0) {
        black= 1; 
        }
      else {
        black = 0;
      }
    }
  
    if (panda == 1) {
    if (mousePressed == true) {
      if(black == 1) {
        fill(0);
      }
      else {
      fill(colorThing,greenColor,90);
      }
    if (squarebutton == 1) {
      for(int i = 0; i < 5; i = i+1) {
      rect (pmouseX+i*20, pmouseY+i*20, mouseX-pmouseX, mouseY-pmouseY);
    }
    }
    else
    {
      
      //ellipses
      for(int i = 0; i < 5; i = i+1) {
        ellipse (pmouseX+i*5, pmouseY, mouseX-pmouseX, mouseY-pmouseY);
    }
    }
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
   if (eraser == 1 && mousePressed == true) {
     noStroke();
     fill(200);
     rect(pmouseX,pmouseY,20,20);
   }    
}

//click on any button to go back to default shape and color
