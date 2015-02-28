


// Lession One Project


// Step 1: Design a static screen drawing using RGB color and primitive shapes.

void setup () {

  size (1000, 500);
  smooth ();
  frameRate (30);
}


void draw () {

  background (255); 

  ellipseMode(CENTER);
  rectMode(CENTER);

  // The body of the car.
  noStroke();
  fill(225, 0, 0, 255); // R, G, B, Alpha 
  rect(mouseX+37, mouseY+10, 226, 60); // x, y, width, height
  quad(mouseX-17, mouseY-20, mouseX+15, mouseY-90, mouseX+150, mouseY-90, mouseX+150, mouseY-20); // x1, y1, x2, y2, x,3, y3, x4, y4


    // Radius on the hood.
  rectMode (CORNER);
  noStroke ();
  fill (255);
  rect (mouseX-76, mouseY-20, 15, 15);
  ellipseMode (CORNER);
  fill (225, 0, 0, 255);
  ellipse (mouseX-76, mouseY-20, 30, 30);


    // Light in front
  ellipseMode (CENTER);
  fill (mouseX, 0, mouseY, 255);
  ellipse (mouseX-70, mouseY, 15, 15);

  // Light in back
  fill (mouseX, 0, mouseY, 255);
  ellipse (mouseX+141, mouseY, 15, 15);
  
  // Rect to cover 1/2 of lights
  rectMode (CORNER);
  fill (225, 0, 0, 255);
  rect (mouseX-70, mouseY-7, 8, 15);
  rect (mouseX+133, mouseY-7, 8, 15);


  // The front window of the car.
  fill(255);
  quad (mouseX-9, mouseY-20, mouseX+20, mouseY-84, mouseX+60, mouseY-84, mouseX+60, mouseY-20); // x1, y1, x2, y2, x3, y3, x4, y4
  fill (255);

  // The back window of the car.
  fill (255);
  rect (mouseX+71, mouseY-84, 70, 64); // x, y, width, height



  // Wheel house # 1 // Left
  fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-36, mouseY+40, 60, 60); // x, y, width, height



    // Wheel house # 2 // Right
  fill (255);
  ellipse (mouseX+110, mouseY+40, 60, 60); // x, y, width, height
 

    // Tire # 1 // left tire
  fill (0);
  ellipse (mouseX-36, mouseY+40, 45, 45); // x, y, width, height
  //ellipse (mouseX-36, mouseY+40, pmouseX, pmouseY);
  
  
  fill (100);
  ellipse (mouseX-36, mouseY+40, 20, 20);

  // Tire # 2 // right tire
  fill (0);
  ellipse (mouseX+110, mouseY+40, 45, 45);
  fill (100);
  ellipse (mouseX+110, mouseY+40, 20, 20);


  // Radio antenna
  strokeWeight (2);
  stroke (0);
  line (mouseX-45, pmouseY-20, pmouseX-35, mouseY-66); // "pmouse" is either X,y,x,Y   -or-  x,Y,X,y


  // Radio anetenna joint
  noFill ();
  quad (mouseX-47, mouseY-20, mouseX-45, mouseY-20, mouseX-45, mouseY-20, mouseX-43, mouseY-20); // x1, y1, x2, y2, x3, y3, x4, y4



  // Rearview mirror
  strokeWeight (3);
  stroke (125);
  line (mouseX, mouseY-20, mouseX+7, mouseY-29);
  

  fill (125);
  ellipse (mouseX+12, mouseY-29, 8, 5);
  
  
}




// Step 2: Make the static screen drawing dynamic by adding "mousePressed()" , "mouseX, mouseY" and "keyPressed()"

void keyPressed () {
  
 println ("Wrooom!"); 
  
}


