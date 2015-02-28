
// Creates new Triangle object
Triangles triangles = new Triangles();

// Used to check whether mouse is held down
boolean mouse = false;

// For setting random background colour
int bgColour1 = int(random(255));
int bgColour2 = int(random(255));
int bgColour3 = int(random(255));

void setup(){
  size(600, 600);
  smooth();
}

void draw(){
  background(bgColour1, bgColour2, bgColour3);
  triangles.drawTriangles();
  
  // While mouse is held
  if(mouse==true){
    // Randomise background colours
    bgColour1 += int(random(-15, 15));
    bgColour2 += int(random(-15, 15));
    bgColour3 += int(random(-15, 15));
    
    // Move the triangles around the mouse
    triangles.changeAngle(10.0);
  }
}

class Triangles{
  float angle;
  float xCoord;
  float yCoord;
  
  public Triangles(){
    angle = 0;
  }
  
  public void drawTriangles(){
    // Use sin and cos to make the triangles move in a circle around the mouse
    xCoord = mouseX + cos(radians(angle))*50;
    yCoord = mouseY + sin(radians(angle))*50;
    
    // Fill triangle with a random colour
    fill(random(255), random(255), random(255));
    
    // Draws two triangles next to the mouse
    triangle(xCoord-25, yCoord+25, xCoord, yCoord-25, xCoord+25, yCoord+25);
    triangle(xCoord-100, yCoord-25, xCoord-75, yCoord+25, xCoord-50, yCoord-25);
  }
  
  // Used to change the direction of the triangles' movement
  public void changeAngle(float newAngle){
    angle += newAngle;
  }
}

void mousePressed(){
  mouse = true;
}

void mouseReleased(){
  mouse = false; 
}


