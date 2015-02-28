
/**
 * Click. 
 * 
 * Move the mouse to position the shape. 
 * Press the mouse button to invert the color. 
 */
float x, y;
float size = 20.0;

void setup() {
  size(400, 400);
  noStroke();
  frameRate(60);

color lawn = color(53, 113, 62);
color middleroad = color(204, 153, 0);
color redcentre = color(153, 20, 10);
color oval = color (85, 113, 53);

// These statements are equivalent to the statements above.
// Programmers may use the format they prefer.
//color inside = #CC6600;
//color middle = #CC9900;
//color outside = #993300;

fill(lawn);
rect(200, 0, 150, 100);
fill(middleroad);
rect(0, 100, 400, 60);
fill(redcentre);
rect(180, 160, 200, 100);
fill(oval);
ellipse (50, 300, 200, 180);
}

void draw() {
  
  if(mousePressed) {
    stroke(255);
    rect(180, 160, 200, 100);
  } else {
    stroke(0);
  }
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  line(mouseX, mouseY-10, mouseX, mouseY+10); 
  
 

    
  
  x = x + 0.8;
  
  if (x > width + size) {
    x = -size;
  } 
  
  translate(x, height/3.1 -size/3.1);
  fill(200);
  rect(-size/2, -size/2, size, size);
  
  // Transforms accumulate.
  // Notice how this rect moves twice
  // as fast as the other, but it has
  // the same parameter for the x-axis value
  translate(x, size);
  fill(0);
  rect(-size/2, -size/2, size, size);
  
}

