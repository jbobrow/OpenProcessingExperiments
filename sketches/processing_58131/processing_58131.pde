
// Created by Tansy Mak
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University

//number of blocks in the x-direction
int numXBlock = 7;
//number of blocks in the y-direction
int numYBlock = 8;
//pixel spacing between the blocks
int spacing = 7;
//the starting suffix to the filename for the image saved at keypress
int saveSuffix = 1;

void setup() {
  size(400, 800);
  stroke(255);
  strokeWeight(spacing);
  fill(0);
  float horDist =width/numXBlock;
  float verDist = height/numYBlock;
  for (int i = 0; i < numXBlock; i++)
  {
    for (int j = 0; j < numYBlock; j++)
    {
      rect((i*horDist), (j*verDist), horDist, verDist);
    }
  }
}

void draw() {
}

//Acts if mouse is pressed, depending on which button and how many times
void mousePressed() {
  strokeWeight(1);
  float xBlock = width/numXBlock;
  float yBlock = height/numYBlock;

  //Draw the white block divisions on single click.
  if (mouseEvent.getClickCount()==1) drawDiv(xBlock, yBlock);
  //Draw new black block on double click.
  if (mouseEvent.getClickCount()==2) drawWhiteBlock(xBlock, yBlock);
  //Draw white block if right clicked.
  if (mouseEvent.getButton()==MouseEvent.BUTTON3) drawBlackBlock(xBlock, yBlock);
}

//Draws the divisions within the blocks
void drawDiv(float xBlock, float yBlock) {
  strokeWeight(spacing);
  stroke(255, 255, 255);
  line(mouseX, mouseY, ((floor(mouseX/xBlock))*xBlock)+(spacing/2), mouseY);
  line(mouseX, mouseY, ((ceil(mouseX/xBlock))*xBlock)-(spacing/2), mouseY);
  line(mouseX, mouseY, mouseX, (floor(mouseY/yBlock)*yBlock)+(spacing/2));
  line(mouseX, mouseY, mouseX, (ceil(mouseY/yBlock)*yBlock)-(spacing/2));
}

//Draws a white block, creating a "void"
void drawWhiteBlock(float xBlock, float yBlock) {
  fill(255, 255, 255);
  rect((floor(mouseX/xBlock)*xBlock)+(spacing/2), (floor(mouseY/yBlock)*yBlock)+(spacing/2), xBlock-spacing, yBlock-spacing);
}

//Draws a black block to erase the previous divisions
void drawBlackBlock(float xBlock, float yBlock) {
  noStroke();
  fill(0);
  rect((floor(mouseX/xBlock)*xBlock)+(spacing/2)+1, (floor(mouseY/yBlock)*yBlock)+(spacing/2)+1, xBlock-(spacing), yBlock-(spacing));
}


