
int outsideCircleW= 40; //starting max width of the outside ellipses
int insideCircleW= 20; //starting max width of inside ellipses

int lineX=100; //starting max x value of generating lines
int lineY=100; //starting max y value of generating lines

void setup () {
  size(800, 800);
  background(230);
  frameRate(80);
}

void draw () {
  //draw the border and buttons
  drawBorder();
  drawButtons();
//When the user clicks and draws within the grey square... 
if (mouseX>20 && mouseX<780 && mouseY>20 && mouseY<740){
  if (mousePressed) {
   //a random ellipse with be drawn with another ellipse inside of it
      drawEllipses();
   //random lines will generate from the area where the mouse is being pressed
      generateLines();
  }
  
  //If the user presses the "plus" key while drawing, the ellipses and lines will grow
  if (mousePressed && keyPressed && key=='=') {
    growEllipses();
    growLines();
  }
  
  //If the user presses the "minus" key while drawing, the ellipses and lines will shrink
  if (mousePressed && keyPressed && key=='-') {
    shrinkEllipses();
    shrinkLines();
  }
}
}

//For buttons:
void mouseClicked() {
  //if the user clicks the "RESET BRUSH SIZE" button the ellipses and lines will return to original sizes:
  if (mouseX>15 && mouseX<200 && mouseY>740 && mouseY<800) {
    resetEllipses();
    resetLines();
  }
  //if the user clicks the "CLEAR" button the drawing will be cleared:
  if (mouseX>590 && mouseX<690 && mouseY>740 && mouseY<800) {
    fill(230);
    rect(0, 0, 800, 800);
    drawBorder();
    drawButtons();
  }
  //if the user clicks the "SAVE" button the drawing will be saved:
  if (mouseX>695 && mouseX<770 && mouseY>740 && mouseY<800) {
    drawBorder();
    saveDrawing();
  }
}


//KEYBOARD COMMANDS---------------------------------------------------
void keyPressed() { 
  //hit the "l" key to create a new layer
  if (key=='l') {
    fill(230, 150);
    rect(0, 0, 800, 800);
  }
  
  //hit the "r" key to have the lines and ellipses reset to original size
   if (key=='r') {
    resetLines();
    resetEllipses();
  }
  
  //hit the spacebar and reset the drawing
  if (key==' ') {
    fill(230);
    rect(0, 0, 800, 800);
    drawBorder();
    drawButtons();
  }
  
  //hit the "s" key and save my image
  if (key=='s') {
    drawBorder();
    saveDrawing();
  }
}

//FUNCTIONS---------------------------------------------------------

//As the user draws, ellipses with random diameters are made:
function drawEllipses() { 
  strokeWeight(1); //stroke of ellipses
  stroke(20, 0, 40, 50); //purple
  ellipseMode(CENTER);
  //outside ellipse:
  fill(255, 200);
  ellipse(mouseX, mouseY, random(outsideCircleW), random(outsideCircleW));
  //inside ellipse:
  fill(random(200), 0, random(100), 50);
  ellipse(mouseX, mouseY, random(insideCircleW), random(insideCircleW));
}

//While the mouse is held down and the "+" key is pressed, the ellipses become bigger:
function growEllipses() {
  outsideCircleW++;
  insideCircleW++;
}

//While the mouse is held down and the "-" key is pressed, the ellipses become smaller:
function shrinkEllipses() {
  if (outsideCircleW>=10 && insideCircleW>=5) {
  outsideCircleW--;
  insideCircleW--; 
  } 
}

//When the r key is pressed, the ellipses return to original size:
function resetEllipses() { 
  outsideCircleW=40;
  insideCircleW=20;
}

//As the user draws, random lines are generated from the location of the mouse
function generateLines() { 
  noFill();
  strokeWeight(random(3)); //lines have random stroke weights up to 3
  stroke(random(200), 0, random(100), random(50)); 
    //If the mouse is in the bottom right quarter of the screen, the lines will go in the direction of that corner
     if (mouseX>=width/2 && mouseX<width && mouseY>=height/2 && mouseY<height) {
        line(mouseX, mouseY, mouseX+random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY+random(lineY));
     }
     //If the mouse is in the bottom left quarter of the screen, the lines will go in the direction of that corner
     if (mouseX<=width/2 && mouseX<width && mouseY>=height/2 && mouseY<height) {
        line(mouseX, mouseY, mouseX-random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY+random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY+random(lineY));
     }
     //If the mouse is in the top left quarter of the screen, the lines will go in the direction of that corner
     if (mouseX<=width/2 && mouseX<width && mouseY<=height/2 && mouseY<height) {
        line(mouseX, mouseY, mouseX-random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX-random(lineX), mouseY-random(lineY));
     }
     //If the mouse is in the top right quarter of the screen, the lines will go in the direction of that corner
     if (mouseX>=width/2 && mouseX<width && mouseY<=height/2 && mouseY<height) {
        line(mouseX, mouseY, mouseX+random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY-random(lineY));
        line(mouseX, mouseY, mouseX+random(lineX), mouseY-random(lineY));
     }
}

//While the mouse is held down and the "+" key is pressed, the lines become longer as the ellipses become bigger:
function growLines() {
  lineX++;
  lineY++;
}

//While the mouse is held down and the "-" key is pressed, the lines become shorter as the ellipses become smaller:
function shrinkLines() {
  if (lineX>=50 && lineY>=50) {
  lineX--;
  lineY--;
  }
}

//draws the white border:
function drawBorder() {
  fill(255);
  noStroke();
  rect(0, 0, width, 20);
  rect(0, 0, 20, height);
  rect(780, 0, 20, height);
  rect(0, 740, width, 60);
}

//Draws the buttons and text at bottom of screen:
function drawButtons() {
  textSize(18);
  fill(100, 0, 50);
  text("RESET BRUSH SIZE", 40, 775);
  
  textSize(14);
  fill(100);
  text("(Hold + or - key to change brush size)", 240, 775);
  
  textSize(18);
  fill(100, 0, 50);
  text("CLEAR", 610, 775);
 
  textSize(18); 
  fill(100, 0, 50);
  text("SAVE", 710, 775);
}

//To save drawing:
function saveDrawing() {
  saveFrame("images/lines-###.png"); //when running on the web it will put the PNG in a new browser tab
}



