
/* 3.3 lerp() function */

float x, y, x1, y1; // store current and next line vertices
float drag; // intertia - how much the drawing lags behind the mouse
float drawColour; //colour will change relative to mouse movement speed
boolean penDown; // only draw if the pen is down

void setup() {
  
  size (800,800) ;
  
  //Drag of the pen - how much it lags behind the mouse
  drag = 0.15;
  
  x = width/2;
  y = height/2;
  x1 = x;
  y1 = y;
  
  //draw smooth
  smooth();
  
  //Start with pen down
  penDown = true;
  
  background(255);
}

void draw() {
  
  // Calculate new draw vertex on an interpolated vector between old vertex and mouse position
  x1 = lerp(x,mouseX,drag);
  y1 = lerp(y,mouseY,drag);
    
  // Calculate distance from old to new vertex, as a measure of mouse speed
  // Will use to set draw colour
  float drawDist = dist(x,y,x1,y1);
  
  //Set draw colour according to distance moved
  drawColour = map(drawDist,0, 35,220,100);
  stroke(drawColour);
  
  //Calculate strokeWeight based on draw distance - the faster the mouse moves, the thicker the line
  strokeWeight(map(drawDist,0,35,1,7));
  
  noFill();
 
  // Draw line from old to new pos
  if (penDown) {
    line (x,y,x1,y1);
  }
   
  
  strokeWeight(1);
  //ellipse(x,y,drawDist,drawDist);
  
  // Set current vertex to be previous vertex
  x = x1;
  y = y1;
  
  //Introduce cyclic effect to drag
  //drag = abs(map(sin(frameCount/10.0),0, 1, 0.02,0.4));
  
}

void keyReleased() {
  switch (key){
    case 'c':
      clear();
      background(255);
      break;
    case 's':
      saveFrame("calligraphic" + frameCount + ".png");
      println("Image Saved.");
      break;
    case 'p':
      penDown = !(penDown); //Toggle pendown state
      println ("Pen Down = " + penDown);
      break;
  }
  
  if (keyCode == UP) {
      if (drag < 0.9) {
        drag += 0.05;
        println ("Pen drag = " + drag);
      }
  }
  if (keyCode == DOWN) {
      if (drag > 0.05) {
        drag -= 0.05;
        println ("Pen drag = " + drag);
      }
  }
}
