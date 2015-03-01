

// good bezier curve
// use for T2 active drawing 

boolean isDrawing; 
int lastX, lastY; 
int lastX1, lastY2; 

void setup ()
{
  lastX = mouseX;
  lastY = mouseY;



  size(500, 500);
  background(0);
  smooth();
  noFill();
  stroke(0);
  isDrawing = false;
}

void draw ()
{


  fill(0, 0, 0, 10); // fade
  rect(0, 0, width, height); // fade

  if (isDrawing == true) {
    float a = random(100, 200);
    stroke(a, 255, mouseX, mouseY); 
    line(lastX, lastY, mouseX, mouseY);

    beginShape();

    fill(255, 10); // fade
    rect(0, 0, width, height); // fade

    float d = dist(mouseX, mouseY, lastX, lastY); 
    d = abs(d/4); 

    vertex(lastX, lastY);
    //bezierVertex(25, 25, 100, 50, 50, 100); //normal bezier
    //bezierVertex(20, 130, 75, 140, 120, 120); //normal bezier

    bezierVertex(mouseX, mouseY, d*2, lastX, lastY, d*2); //bezier curve tracked
    bezierVertex(mouseX, d*2, d, mouseY, d*6, d); //mouse input 
    noFill(); 

    endShape();

    lastX = mouseX;
    lastY = mouseY;


  }
}

void mousePressed() 

{
  isDrawing = true;
}

void mouseReleased() 

{
  isDrawing = false;
}



