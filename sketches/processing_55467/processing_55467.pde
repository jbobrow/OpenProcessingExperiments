
//Sketch by Karen Vertierra//
//Inspired by Samantha Stone: www.openprocessing.org/sketch/36326//

void setup () {
  size (400, 400);
}
 
void draw () {
  if (mousePressed) { //house scene appears when clicked
    background(#79BD8F);
    smooth();
    noStroke();
    ellipseMode(CORNER);
    fill(#FFFF9D); //moon yellow
    ellipse(31, 17, 116, 116);
    fill(#79BD8F); //moon cover
    ellipse(67, 17, 116, 116);
    fill(#FFFF9D); //body of house
    rect(20, 215, 173, 118);
    fill(#FF6138); //roof of house
    triangle(107, 109, 22, 216, 194, 215);
    fill(#FF6138); //garage door
    rect(32, 254, 95, 79);
    fill(#FF6138); //front door
    rect(138, 286, 41, 47);
    fill(#00A388); //ground
    rect(0, 333, 400, 68);
    fill(#FF6138); //tree branch 1
    rect(261, 200, 10, 133);
    fill(#00A388); //tree top 1
    triangle(269, 74, 204, 262, 337, 263);
    fill(#FF6138); //tree branch 2
    rect(326, 231, 8, 102);
    fill(#FFFF9D); //tree top 2
    triangle(333, 135, 282, 278, 384, 279);

  }
 
  else {  // black and white city scene with windows and background changing color with mouse
 
    colorMode(RGB, width);
    background(121, 189+mouseX, 143+mouseY); //as mouse moves, background changes according to mouse X and Y values
    noStroke();
    smooth();
    ellipseMode(CORNER);
    fill(255, 255+mouseX, 157+mouseY);//sun
    ellipse(36, 30, 89, 88);
    fill(51, 204+mouseX, 153+mouseY); //ground line
    rect(0, 333, width, 68);
    fill(0, 163+mouseX, 136+mouseY); //building 1
    rect(-27, 193, 47, 140);
    fill(255, 255+mouseX, 157+mouseY); //building 2
    rect(20, 158, 78, 175);
    fill(255, 97+mouseX, 56+mouseY); //building 3
    rect(98, 184, 73, 149);
    fill(0, 163+mouseX, 136+mouseY); //building 4
    rect(171, 246, 77, 87);
    fill(255, 255+mouseX, 157+mouseY); //building 5
    rect(248, 91, 78, 242);
    fill(255, 97+mouseX, 56+mouseY); //building 6
    rect(326, 133, 73, 200);
  }
  
}


