
void setup() {
  size(720, 480);
  background(0);
  fill(255);
  ellipseMode(CENTER);
  stroke(255);
  smooth();
}

float x, y;
float x2, y2;
float gridSize = 40;


void draw() {
  background(0);

  fill(255);
 
  stroke(255);  
  // CC - http://www.openprocessing.org/sketch/20116
  x2 = (noise(frameCount * 0.01) * width/2 ) + width/2;
  y2 = noise(frameCount * 0.01 + 30) * height;
  // END
  for (y = 1; y < height/gridSize; y++) 
  {  
    for (x = 1; x < width/(gridSize); x++) 
    { 
      //line(x1, y1, x2, y2)    
      if (mousePressed) {
        line(x*gridSize, y*gridSize, mouseX, mouseY);
      } 
      else {
        line(x*gridSize, y*gridSize, x2, y2);
      }
    }
  }
  noStroke();
  if (mousePressed)  {
    noCursor();
    fill(0);
    ellipse(mouseX, mouseY, 5, 5);
    x2 = mouseX;
    y2 = mouseY;
  } 
  else {
    cursor();
  }
  
}

void keyPressed() {
    if(keyCode == ENTER) {
     saveFrame("line-######.png");
    } 
}
