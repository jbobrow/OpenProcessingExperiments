
int outsideCircleW= 50; //max width of the outside ellipses
int insideCircleW= 25; //max width of inside ellipses

//floats to draw line
float oldX;
float oldY;

void setup () {
  size(800, 800);
  smooth();
  background(230);
  frameRate(50);
}

void draw () {
//When the mouse is pressed...  
  if (mousePressed) {
   //a random ellipse with be drawn with another ellipse inside of it
      drawEllipses();
   //a line will be drawn where the mouse is dragged
      drawLine();
   //more random lines will generate from the area where the mouse is being pressed
      generateLines();
  }

oldX=mouseX;
oldY=mouseY;
}

//FUNCTIONS---------------------------------------------------------

function drawEllipses() { //creates ellipses where user draws path
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

function drawLine() { //the basic purple line drawn when mouse is dragged
  strokeWeight(4);
  line(mouseX, mouseY, oldX, oldY);
}

function generateLines() { //as the user draws, random lines are generated from the location of the mouse
  noFill();
  strokeWeight(random(3)); //lines have random stroke weights up to 3
  stroke(random(200), 0, random(100), random(100)); 
  line(mouseX, mouseY, mouseX+random(100), mouseY+random(100));
  //bezier(mouseX, mouseY, mouseX+random(50), mouseY+50, mouseX+50, mouseY+5,  mouseX+30, mouseY+random(50));

}


  
//SAVING DRAWING
void keyPressed() { //hit the "s" key and save my image
  if (key=='s')
  {
    saveDrawing();
  }
}

function saveDrawing() {
  saveFrame("images/lines-###.png"); //when running on the web it will put the PNG in a new browser tab
}



