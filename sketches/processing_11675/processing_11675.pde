
float light = 255;
boolean stars = false;
boolean lighton = true;
String s = "TURN OFF THE CITY LIGHTS BY CLICKING ANYWHERE IN THE WINDOW AND THEN MOVE THE MOUSE AROUND TO DRAW STARS! CLICK AGAIN TO TURN LIGHTS BACK ON!";

void setup () {
  // set the size of the window and background colour
  size (521,320);
  background(0);
  smooth();
  frameRate(30);
  // sketch instructions
  textSize(10);
  text(s, 10, 10, 500, 40);
}


void mousePressed () {
   // setting the conditions to determine if the stars would be drawn
  if (lighton) {
    // when mouse is clicked, and if they lighton is true, set it to false, change the buildings colour and allow stars to be drawn
    light = 110;
    stars = true;
    lighton = false;
    }
    else {
    // when mouse is clicked, if the lighton is false, set it to true, change the colour of the building to white, and set a black background to clear the sky of stars
    // text would also disappear
    light = 255;
    lighton = true;
    stars = false;
    fill(0);
    rect(0,0,521,320);
      }
}

void draw () {
  
  // if the stars boolean is true, enable the drawing of stars, else do nothing
  if (stars) {
      fill(255);
      rect(mouseX,mouseY,2,2);
  }
  
  // cityscape buildings, with the fill set as a changeable variable
  fill(light);
  rect(0,220,40,100);
  rect(40,200,40,150);
  rect(80,210,40,130);  
  rect(120,250,40,120);
  rect(160,220,40,100);
  rect(200,210,40,130);  
  rect(240,200,40,150);
  rect(280,250,40,120);
  rect(320,210,40,130);  
  rect(360,220,40,100);
  rect(400,200,40,150);
  rect(440,210,40,130); 
  rect(480,220,40,100);
  }

