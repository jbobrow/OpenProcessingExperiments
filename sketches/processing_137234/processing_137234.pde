
//
// Mirrors. Everything is about mirrors. 
// Every event (line, rectangle, ellipse or letter) is reflected in 3 times. The space is divided in four areas and every area is a reflection of the other. 
//

// Mouse:
// The mouse always selects the location of the element to draw (shape, line or letter).
// For the shapes (rect, ellipse and line) the mouse pressed is needed.
//


// Keys:
//
// Change font size:
//   UP key: increase font size.
//   DOWN key decrease font size.
//
// Change colors: (The colors are stored in an array. It can be considered a circular array)
//   LEFT key: select the previous color in the array.
//   RIGHT key: select the next color in the array.
//
// Change shape:
//   ALT key: switch between the shapes: rect, ellipse, line.
//
// Others:
//   ENTER or RETURN key: save the frame to a png.
//   DELETE or BACKSPACE key: clear the frame.


import java.util.Calendar;

// font vars. max and min sizes and increments.
PFont f;
int fontSize;
int fontMaxSize = 300;
int fontMinSize = 8;
int fontSteps = 4;

//colors used in the sketch
color[] myColors ={ color(10, 80, 20, 10),
                    color(70, 70, 90, 10),
                    color(230, 70, 55, 10),
                    color(120, 50, 80, 10),
                    color(360, 99, 60, 10)
                   };
// The same colors, but the alpha value is out (full opaque).
color[] myColorsText ={ color(10, 80, 20),
                    color(70, 70, 90),
                    color(230, 70, 55),
                    color(120, 50, 80),
                    color(360, 100, 60)
                   };
// set the current color
int currentColorIndex;

int currentShape;

void setup(){
  size(800, 700);
  colorMode(HSB, 360, 100, 100, 100);
  //smooth();
  
  background(360);
  currentColorIndex = 0;
  
  fontSize = 16;
  
  f = createFont("Arial",16,true);
  textFont(f,fontSize);
  
  currentShape = 0;
}

void draw(){
  if(mousePressed){
    
    noFill();
    
    strokeWeight(3);
    stroke(myColors[currentColorIndex]);
    
    int x1, y2;
    if (mouseX >= width/2) x1 = width/2 - (mouseX-width/2) ;
    else x1 = (width/2 - mouseX)+width/2;
    
    if (mouseY >= height/2) y2 = height/2 - (mouseY-height/2);
    else y2 = (height/2 - mouseY)+height/2;
    
    int wid = (int) map(mouseX, 0, width, 0, width/2);
    int hei = (int) map(mouseY, 0, height, 0, height/2);
    
    //println("wid:"+wid+" hei:"+hei);
    
    //pushMatrix();
    if (currentShape == 0) {
      ellipse(mouseX,mouseY, wid,hei);
      ellipse(x1,mouseY, wid,hei);
      ellipse(mouseX,y2, wid,hei);
      ellipse(x1,y2, wid,hei);
    } else if (currentShape == 1) {
      rect(mouseX-wid/2,mouseY-hei/2, wid,hei);
      rect(x1-wid/2,mouseY-hei/2, wid,hei);
      rect(mouseX-wid/2,y2-hei/2, wid,hei);
      rect(x1-wid/2,y2-hei/2, wid,hei);
    } else if (currentShape == 2) {
      line(mouseX,mouseY, width/2,height/2);
      line(x1,mouseY, width/2,height/2);
      line(mouseX,y2, width/2,height/2);
      line(x1,y2, width/2,height/2);
    }
    //popMatrix();
    
  }
}

void keyReleased(){
  
  
  // key options: BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE
  // clear
  if (key == DELETE || key == BACKSPACE ) background(360);
  // save frame
  if (key == ENTER  || key == RETURN    ) saveFrame("sketch_"+getTimestamp()+".png");
  
  
  // keyCode options: ALT, CONTROL, SHIFT, UP, DOWN, LEFT, RIGHT
  if (key == CODED) { 
    if (keyCode == UP) { //increase font size
      fontSize += fontSteps;
      changeFontSize();
    } else if (keyCode == DOWN) { //decrease font size
      fontSize -= fontSteps;
      changeFontSize();
    } else if(keyCode == LEFT){ //change color
      currentColorIndex--;
      changeColor();
    } else if(keyCode == RIGHT){ //change color
      currentColorIndex++;
      changeColor();
    } else if(keyCode == ALT){ //change shape
      currentShape++;
      if (currentShape > 2) currentShape=0;
    } 
  }
  else {
    drawMirrorsText(mouseX,mouseY, key);
  }
  
}


void changeColor(){
  // myColors and myColorsText need to have the same lenght
  if (currentColorIndex > myColors.length-1 ) currentColorIndex=0;
  if (currentColorIndex < 0) currentColorIndex=myColors.length-1;
  
  println("Current Color:"+currentColorIndex);
}

void changeFontSize(){
  if (fontSize < fontMinSize) fontSize = fontMinSize;
  if (fontSize > fontMaxSize) fontSize = fontMaxSize;
  
  println("Current Text Size:"+fontSize);
}


void drawMirrorsText(int x, int y, char text){
  
  textFont(f,fontSize);
  fill(myColorsText[currentColorIndex]);
  
  pushMatrix();
  scale(1, 1);
  text(text, mouseX, mouseY);
  popMatrix();
  
  pushMatrix();
  scale(-1, 1);
  int x1;
  if (mouseX >= width/2) x1 = width/2 - (mouseX-width/2) ;
  else x1 = (width/2 - mouseX)+width/2;
  text(text, -x1, mouseY);
  popMatrix();
  
  pushMatrix();
  scale(1, -1);
  int y2;
  if (mouseY >= height/2) y2 = height/2 - (mouseY-height/2);
  else y2 = (height/2 - mouseY)+height/2;
  //println(y2);
  text(text, mouseX, -y2);
  popMatrix();
  
  pushMatrix();
  scale(-1, -1);
  text(text, -x1, -y2);
  popMatrix();  
  
}

// returns the timestamp to save the file
String getTimestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


