
void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  fill(120);

  text("mouseX = " + mouseX, 50, 30); // What the X value of the mouse actually is
  // Drawing a rectangle that follows the normal values 0...600
  text("map(mouseX, 0, 600, 1, 600)", 50, 50); 
  //Changing the colors based on mouseY position in the range
  //if (mouseY <200) {
    //fill(229, 161, 245);
  //} else if (200 <= mouseY && mouseY < 400) {
    //fill(245, 59, 146);
  //} else if (400 <= mouseY && mouseY < 600) {
    //fill(85, 17, 247);
  //}
  //Changing the color in a grayscale
  //fill(map(mouseY,0,600,0,255),255,255);
  //Changing the R color in the scale
  //fill(map(mouseY,0,600,0,255),255,255);
  //Changing the G color in the scale
  //fill(255,map(mouseY,0,600,0,255),255);
  //Changing the B color in the scale
  fill(255,255,map(mouseY,0,600,0,255));
  rect(50, 70, map(mouseX, 0, 600, 1, 600), 50);  

  int x = int(map(second(),1,60,0,600));
  ellipse(x,100,10,10);


  // Drawing a rectangle that using map to nicely reduce 0-600 to 0-100
  text("map(mouseX, 0, 600, 1, 100)", 50, 200); 
  rect(50, 220, map(mouseX, 0, 600, 1, 100), 50);
  //flip the rectangle
  text("map(mouseX, 0, 600, 0, 600)", 50, 350);
  rect(width-50, 370, -map(mouseX, 0, 600, 0, 600), 50);
}
