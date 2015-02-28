
/**
 * Click. 
 * 
 * Move the mouse to position the shape. 
 * Press the mouse button to invert the color. 
 */


void setup() {
size(400, 250);
noStroke();

color lawn = color(73, 237, 24);
color redcentre = color(791, 003, 0);
color outside = color(234, 234, 130);
color webster = color(87, 24, 237);
color cafe = color(237, 24, 216);
color oval = color(73, 237, 24);
color walkway = color(165, 153, 24);
color newton = color(135, 209, 100);
color main = color (230, 55, 55);
color walkway2 = color(165, 153, 24);
// These statements are equivalent to the statements above.
// Programmers may use the format they prefer.
//color inside = #CC6600;
//color middle = #CC9900;
//color outside = #993300;

fill(outside);
rect(0, 0, 500, 300);
fill(redcentre);
rect(170, 100, 140, 40);
fill(lawn);
rect(180, 35, 60, 40);
fill(webster);
rect(250, 35, 100, 40); 
fill(cafe);
rect(145, 35, 30, 40);
fill(walkway);
rect(0, 78, 500, 20);
fill(oval);
ellipse(20, 180, 250, 150);
fill(newton);
rect(170, 140, 20, 50);
fill (main);
rect (195, 150, 130, 60);
fill (walkway2);
rect (150, 78, 15, 200);

}

void draw() {
  if(mousePressed) {
    stroke(0);
  } else {
    stroke(500);

  }
  line(mouseX-3, mouseY, mouseX+3, mouseY);
  line(mouseX, mouseY-3, mouseX, mouseY+3); 
    
}
    

