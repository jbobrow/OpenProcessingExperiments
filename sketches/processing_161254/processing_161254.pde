
  // Pleased to Meet You

PGraphics offScreenbuffer;
PFont f;

void setup() {
  background(255);
  size(600, 600); 
  
  strokeWeight(1); // Thickness of the line
  stroke(130); // Colour of the line
  line(150, 0, 150, 600);
  line(300, 0, 300, 600);
  line(450, 0, 450, 600);
  line(0, 150, 600, 150);
  line(0, 300, 600, 300);
  line(0, 450, 600, 450);
  
  fill(50); // Interior colour of shape
  ellipse(150, 0, 10, 10);
  ellipse(300, 0, 10, 10);
  ellipse(450, 0, 10, 10);
  ellipse(600, 0, 10, 10);
  ellipse(0, 150, 10, 10);
  ellipse(150, 150, 10, 10);
  ellipse(300, 150, 10, 10);
  ellipse(450, 150, 10, 10);
  ellipse(600, 150, 10, 10);
  ellipse(0, 300, 10, 10);
  ellipse(150, 300, 10, 10);
  ellipse(300, 300, 10, 10);
  ellipse(450, 300, 10, 10);
  ellipse(600, 300, 10, 10);
  ellipse(0, 450, 10, 10);
  ellipse(150, 450, 10, 10);
  ellipse(300, 450, 10, 10);
  ellipse(450, 450, 10, 10);
  ellipse(600, 450, 10, 10);
  ellipse(0, 600, 10, 10);
  ellipse(150, 600, 10, 10);
  ellipse(300, 600, 10, 10);
  ellipse(450, 600, 10, 10);
  ellipse(600, 600, 10, 10);

offScreenbuffer = createGraphics(width, height); // create an off-screen graphics buffer

}

void draw() {
  
  background(255); // Erase all previous circle drawings
  
  background(255);
  size(600, 600); 
  
  f = createFont("Timesnewroman", 12, true);
  textFont(f, 12);
  fill(0);
  text("Start Here", 8, 15);
  text("End Here", 540, 590);
  
  strokeWeight(1); // Thickness of the line
  stroke(130); // Colour of the line
  line(150, 0, 150, 600);
  line(300, 0, 300, 600);
  line(450, 0, 450, 600);
  line(0, 150, 600, 150);
  line(0, 300, 600, 300);
  line(0, 450, 600, 450);
  
  fill(50); // Interior colour of shape
  ellipse(150, 0, 10, 10);
  ellipse(300, 0, 10, 10);
  ellipse(450, 0, 10, 10);
  ellipse(600, 0, 10, 10);
  ellipse(0, 150, 10, 10);
  ellipse(150, 150, 10, 10);
  ellipse(300, 150, 10, 10);
  ellipse(450, 150, 10, 10);
  ellipse(600, 150, 10, 10);
  ellipse(0, 300, 10, 10);
  ellipse(150, 300, 10, 10);
  ellipse(300, 300, 10, 10);
  ellipse(450, 300, 10, 10);
  ellipse(600, 300, 10, 10);
  ellipse(0, 450, 10, 10);
  ellipse(150, 450, 10, 10);
  ellipse(300, 450, 10, 10);
  ellipse(450, 450, 10, 10);
  ellipse(600, 450, 10, 10);
  ellipse(0, 600, 10, 10);
  ellipse(150, 600, 10, 10);
  ellipse(300, 600, 10, 10);
  ellipse(450, 600, 10, 10);
  ellipse(600, 600, 10, 10);
  
  if(mousePressed) {
       
  offScreenbuffer.beginDraw(); // start drawing to the buffer
  
  // when you draw to a graphics buffer, use the standard syntax
  // but add the name of the buffer object and a dot, e.g. "offScreenbuffer." before
  // your command
  
  offScreenbuffer.strokeWeight(3); // Thickness of the line
  offScreenbuffer.stroke(0); // Colour of the line
  offScreenbuffer.line(mouseX, mouseY, mouseX, mouseY);
  
  offScreenbuffer.endDraw(); // stop drawing to the buffer, remember everything you drew to the buffer is 
                             // still invisible (i.e. off-screen) at this moment
  
  // Now, make buffer content visible:
  image(offScreenbuffer, 0, 0);
  
  // and draw circle at current mouse position on top:
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY, 15, 15);
     
  }
  
}



