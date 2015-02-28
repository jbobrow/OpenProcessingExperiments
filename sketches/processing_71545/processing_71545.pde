
// get 3 ramdom hues for the fill colors
int hue1 = floor(random(1,80));
int hue2 = floor(random(81,160));
int hue3 = floor(random(161,255));

int activeHue = hue1;
int activeShape = 1;
boolean eraser = false; // is the eraser the active color?
boolean activeDraw = false; // has the mouse been clicked to choose a color/tool?
int counter = 0; // Dont draw until the canvas is clicked

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0,0,255); 
} // end setup

void draw() {
  
  // drawing canvas
  strokeWeight(1);
  fill(0,0,230);
  stroke(0,0,210);
  rect(0,0,50,600); 
  
  /*-------- SHAPES --------*/
  
  // Shape 1
  if (activeShape == 1) {
    activeButtonBG(60);
  } 
  else {
    buttonBG(60);
  }
  noStroke();
  fill(0,0,100);
  ellipse(25,76,5,5);
  
  // Shape2
  if (activeShape == 2) {
    activeButtonBG(100);
  } 
  else {
    buttonBG(100);
  }
  noStroke();
  fill(0,0,100);
  ellipse(25,116,20,20);
  
  /*-------- COLORS --------*/
  color color1 = color(hue1, 200, 200);
  color color2 = color(hue2, 200, 200);
  color color3 = color(hue3, 200, 200);
  color activeColor = color(activeHue, 200, 200);
  
  // 1st Color
  if (activeHue == hue1) {
    activeButtonBG(180);
  } else {
    buttonBG(180);
  } 
  noStroke();
  fill(color1);
  ellipse(25,196,15,15);
  
  // 2nd Color 
  if (activeHue == hue2) {
    activeButtonBG(220);
  } else {
    buttonBG(220);
  } 
  noStroke();
  fill(color2);
  ellipse(25,236,15,15);
  
  // 3rd Color
  if (activeHue == hue3) {
    activeButtonBG(260);
  } else {
    buttonBG(260);
  } 
  noStroke();
  fill(color3);
  ellipse(25,276,15,15);
  
  // Eraser
  if (eraser == true) {
    activeButtonBG(300);
  } else {
    buttonBG(300);
  } 
  strokeWeight(1);
  fill(0,0,255);
  ellipse(25,315,15,15);
  
  /*---- CAMERA -----*/
  buttonBG(550);
  noStroke();
  fill(0,0,80);
  rect(18,560,16,12,2,2,2,2);
  rect(23, 557, 6,4);
  fill(0,0,255);
  ellipse(26,566,5,5);
  
  
  /*------- END Buttons ------------ */
  
  // Set a safe area to draw on
  // boolean safeArea = mouseX > 50 && mouseX < 550 && mouseY > 50 && mouseY < 550;
  boolean safeArea = mouseX > 50;
  
  
  if (mousePressed == true) {
    activeDraw = true;
  } else {
    activeDraw = false;
  }
  
  if ( safeArea && activeDraw ) {
    noStroke();
    
    // Set Color 
    if (counter == 0 || eraser == true) { // has mouse been clicked yet
      fill(0,0,255); // Paint same as bg color
    }
    else {
      fill(activeColor);
    }
    
    // Set Shape
    if (activeShape == 1) {
       ellipse(mouseX, mouseY, 5, 5);
    } 
    else {
       ellipse(mouseX, mouseY, 20, 20);
    }
    
  }  
   
} //end draw

// method to draw inactive button backgrounds
void buttonBG( int top ) {
  strokeWeight(1);
  fill(0,0,255); 
  stroke(0,0,210);
  rect(10, top, 30, 30);
} //end buttonBG

// method to draw active button backgrounds
void activeButtonBG( int top ) {
  strokeWeight(2);
  fill(0,0,255); 
  stroke(0,0,180);
  rect(10, top, 30, 30);
} //end activeButtonBG

void mousePressed() {
  counter++;
  
  boolean clickArea1 = mouseX > 10 && mouseX < 40 && mouseY > 60 && mouseY < 90; // 1st Tool
  boolean clickArea2 = mouseX > 10 && mouseX < 40 && mouseY > 100 && mouseY < 130; // 2nd Tool
  boolean clickArea3 = mouseX > 10 && mouseX < 40 && mouseY > 180 && mouseY < 210; // 1st color
  boolean clickArea4 = mouseX > 10 && mouseX < 40 && mouseY > 220 && mouseY < 250; // 2nd color
  boolean clickArea5 = mouseX > 10 && mouseX < 40 && mouseY > 260 && mouseY < 290; // 3nd color
  boolean clickArea6 = mouseX > 10 && mouseX < 40 && mouseY > 300 && mouseY < 330; // Eraser
  boolean clickArea7 = mouseX > 10 && mouseX < 40 && mouseY > 550 && mouseY < 580; // Camera
  
  if (clickArea1) {
    activeShape = 1;
  } 
  if (clickArea2) {
    activeShape = 2;
  }  
  if (clickArea3) {
    activeHue = hue1;
    eraser = false;
  }   
  if (clickArea4) {
    activeHue = hue2;
    eraser = false;
  }
  if (clickArea5) {
    activeHue = hue3;
    eraser = false;
  }
  if (clickArea6) {
    activeHue = 0;
    eraser = true;
  }
  if (clickArea7) {
    save("mydrawing.png");
    activeDraw = false;
  }
} //end mousePressed

void keyPressed() {
  if (key == 32) { // space bar
    save("mydrawing.png");
  }
} //end keyPressed
