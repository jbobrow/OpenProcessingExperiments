
int columns;
int rows;
int circleDia = 150;
int spacing = 10;

int blueStroke = 1;
int blackStroke = 1;
int redStroke = 1;
int yellowStroke = 1;
int greenStroke = 1;

int blueAlpha = 255;
int blackAlpha = 255;
int redAlpha = 255;
int yellowAlpha = 255;
int greenAlpha = 255;

void setup() {
  size(600, 400);
  columns = width/4;
  rows = height/3;
}

void draw() {
  noFill();
  background(255);
  ellipseMode(CENTER);
  
  //top row
  stroke(0, 0, 128, blueAlpha); //blue
  strokeWeight(blueStroke);
  ellipse(columns-spacing, rows, circleDia, circleDia);
  
  stroke(0, 0, 0, blackAlpha); //black
  strokeWeight(blackStroke);
  ellipse(columns*2, rows, circleDia, circleDia);
  
  stroke(255, 0, 0, redAlpha); //red
  strokeWeight(redStroke);
  ellipse(columns*3 + spacing, rows, circleDia, circleDia);
  
  //bottom row
  stroke(255, 255, 0, yellowAlpha); //yellow
  strokeWeight(yellowStroke); 
  ellipse(columns + columns/2, rows*1.5, circleDia, circleDia);
 
  stroke(0, 128, 0, greenAlpha); //green
  strokeWeight(greenStroke);
  ellipse(columns*2 + columns/2+ spacing, rows*1.5, circleDia, circleDia);
  
}

void mouseClicked() {
  blueStroke = ceil(random(8))+2;// keeps stroke between 3-10 (without the +2 it would be between 1 & 8)
  blueAlpha = 255 - map(blueStroke, 3, 10, 0, 200); // doing the subtraction from 255 keeps the alpha between 55-255 
                                                    //and makes larger strokes more transparent (the opposite of what would happen with mapping alone)
  
  
  blackStroke = ceil(random(8))+2;
  blackAlpha = 255 - map(blackStroke, 3, 10, 0, 200);
  
  redStroke = ceil(random(8))+2;
  redAlpha = 255 - map(redStroke, 3, 10, 0, 200);
  
  yellowStroke = ceil(random(8))+2;
  yellowAlpha = 255 - map(yellowStroke, 3, 10, 0, 200);
  
  greenStroke = ceil(random(8))+2;
  greenAlpha = 255 - map(greenStroke, 3, 10, 0, 200);
}



