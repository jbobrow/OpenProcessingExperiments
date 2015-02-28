
// modelab.nu Processing Tutorial - Marius Watz, 2010


// declare variables
float x,y,rad;

void setup() {
  size(920, 400); // create a window with 400x400 pixel size
  background(50); // clear the background with 20% gray
  smooth(); // turn on anti-aliasing for smooth outlines
}

void draw() {
  
  // draw 20 random circles with connecting lines around the mouse 
  // position if mouse button is pressed

  if(mousePressed) {
    stroke(random(255),random(255),random(255)); // set stroke color to random gray
    fill(random(255),random(255),random(255)); // set stroke color to random gray

    rad=random(2,6); // set random radius    
    // set rad to larger size 80% of the time
    if(random(100)>80) rad=random(10,20);
    
    for(float i=0; i<20; i=i+1) {
      x=mouseX+random(-10,10)*rad;
      y=mouseY+random(-10,10)*rad;
      line(x,y, mouseX,mouseY);
      ellipse(x,y, rad,rad);      
    }
  }  
}
