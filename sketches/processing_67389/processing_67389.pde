
/**
 * Dynamic contact "card"
 * Chris Lindgren
 * v1.0
 */


int x = 30;
int y = 80;
PFont fontA,fontB,fontC;
float theta;

  
void setup() 
{
  size(1000, 500);
  smooth();

  // Create the fonts and its size (in units of pixels)
  fontA = createFont("Nimbus Mono L Bold",62);
  
  // Uncomment this code to see list of available fonts
  //String[] fontList = PFont.list();
  //println(fontList);
}

void draw() {
  background(255,304,102);
  
  // Change font size by following this example: textFont(fontA,12);
  // Use fill() to change the value or color of the text
  
  //Header 1
  textFont(fontA);
  fill(25);
  text("chris lindgren", x-3, y);
  
  //Header 2
  textFont(fontA,24);
  text("University of Minnesota | Writing Studies", x, y+55);
  
  textFont(fontA, 24);
  text("Rhetoric/Writing, New_Media, Proceduracy", x, y+80);
  
  //Header 3
  textFont(fontA, 18);
  text("@lingeringcode", x, y+135);
  textFont(fontA, 18);
  text("www.clindgrencv.com", x, y+155);
  textFont(fontA, 18);
  text("lindg250@umn.edu", x, y+175);
  
  // Frame for Jasper quote
  stroke(255);
  for (int i = 280; i < 500; i++) {
    line(x,y+200,x+333,i);
  }
  fill(85,0,0,95);
  stroke(0,0,0,0);
  rect(x, y+200, x+250, y+15);
  fill(85,0,0,127);
  rect(x+30, y+200, x+250, y+50);
  fill(85,0,0,127);
  rect(x+60, y+200, x+190, y+105);
  fill(85,0,0,200);
  rect(x+90, y+200, x+215, y+140);
    textFont(fontA, 13);
    fill(255);
    text("Take an object.", x+2, y+235);
    text("Do something to it.", x+32, y+265);
    text("Do something else to it.", x+62, y+295);
    text("\"    \"    \"    \"    \"", x+92, y+325);
    textFont(fontA,13);
    text("Jasper Johns,", x+170, y+385);
    text("Notebook [ND], 1965", x+170, y+418);
    
  //Revised from Daniel Shiffman's "Recursive Tree"
  frameRate(30);
  stroke(85,0,0,160);
  // Choose an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width*height) * 90f;
  theta = radians(a); // Convert it to radians
  // Start the fractal from a position in the display window
  translate(width/2,height);
  
  // fractal's starting position
  translate(130,-215);
  
  // Number of recursive branches
  branch(165);
}

void branch(float h) {
  // Control the factor by which the branch size decreases, based on the previous one
  h *= 0.72;
  
  // Sets a limit on the recursive function at a branch size of 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Saves the current state of transformation (i.e. where are we now)
    rotate(PI/2);   // Rotate by a number (Personally, I like PI.)
    rect(0, 0, 2, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Calls itself again to draw x number of new branches based on the conditional
    popMatrix();     // This restores the previous matrix state
    
    // Repeat the same thing, only "branch off" to the left this time
    pushMatrix();
    rotate(-theta/3);
    rect(0, 0, 4, -h);
    translate(0, -h);
    branch(h);
    popMatrix();    
  }
}


