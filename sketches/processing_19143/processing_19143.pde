
  int blueStroke = 20;

void setup() {
  size(600,600);
  background(255);
  smooth();
  colorMode(HSB, 360, 100, 100);
  
  
  //The following creates the grid in background
  //The noLoop() in draw() requires me to initiate increments (i think?)
  
  for(int gridX = 0; gridX < 600; gridX +=30){
    stroke(300);
    line(gridX, 0, gridX, 600);
  }
  
    for(int gridY = 0; gridY < 600; gridY +=30){
    stroke(300);
    line(0, gridY, 600, gridY);
  }
}

void draw(){
  noFill();
  stroke (300);
  ellipse(mouseX, mouseY, 15, 15);
  stroke(240, blueStroke, 99);
  line(mouseX,mouseY,pmouseX,pmouseY);
noLoop(); //do not repeat draw()
}

void mousePressed() {
  redraw(); //if the mouse is pressed, repeat draw() once
  
 //if the mouse is pressed add 5 to blueStroke
  blueStroke += 5;
 
 //if blueStroke is greater than 100 then make blueStroke 20
  if (blueStroke > 100) {
    blueStroke = 20;
    } else {
    blueStroke = blueStroke;
    }
  
}

void keyPressed() {
 //when any key is pressed, save it!
   save("grid.jpg"); 
}

