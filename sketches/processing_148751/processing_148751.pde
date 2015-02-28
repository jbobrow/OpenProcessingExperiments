
PFont font;

void setup() {  //setup function called initially, only once
  size(480, 800);
  background(49, 222, 160);  //set background teal
  
  font=loadFont("GillSans-UltraBold-48.vlw");
}

void draw() {  //draw function loops
    fill (54, 195, 128); //sets fill colour
    rect (0, 0, 800, 30); //creates a rectangle at x axis 0, y axis 0, that is 800 pixels wide, 30 pixels high
    
    if (mousePressed){
        fill (random (255), random (255), random (255));
        } 
        else {
        noStroke();
        noFill();
        }
        ellipse(mouseX, mouseY, 80, 80); //sets the ellipse to follow the mouse and be 80 pixels wide, 80 pixels high
 
     fill (#ffffff);
     textFont (font, 15);
     text("DRAW SOMETHING", 10, 20);   //text, x axis     
}

void keyPressed() { 
    if (key == 's') {
        saveFrame("myDrawing-######.jpg"); //if key 's' is pressed, save the image as myDrawing.jpg
    }
}
