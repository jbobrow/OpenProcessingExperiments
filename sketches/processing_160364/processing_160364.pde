
int circleWidth;
int screenDimension;


void setup() {
  screenDimension=400;
  circleWidth=25;
  size(screenDimension, screenDimension);
}

void draw() {

  background(255, 255, 255);

  //Cursor 
  fill(255, 0, 0);
  noStroke();
  ellipse(mouseX, mouseY, circleWidth, circleWidth);

  //circles
  noStroke();
  //blue
  fill(0, 0, 255);
  ellipse(screenDimension*.25, screenDimension*.25, circleWidth, circleWidth);
  //green
  fill(0, 255, 0);
  ellipse(screenDimension*.75, screenDimension*.25, circleWidth, circleWidth);
  //yellow
  fill(255, 255, 0);
  ellipse(screenDimension*.25, screenDimension*.75, circleWidth, circleWidth);
  //purple
  fill(255, 0, 255);
  ellipse(screenDimension*.75, screenDimension*.75, circleWidth, circleWidth);

  //top left

  if (mouseX >= screenDimension*.20 
    && mouseX <= screenDimension*.30 
    && mouseY >= screenDimension*.20 
    && mouseY <= screenDimension*.30) 
  {
    fill(0, 0, 255);
    ellipse(mouseX, mouseY, circleWidth*3, circleWidth*3);
  } else {
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, circleWidth, circleWidth);
  }

  //top right

  if (mouseX >= screenDimension*.70 
    && mouseX <= screenDimension*.80 
    && mouseY >= screenDimension*.20 
    && mouseY <= screenDimension*.30) 
  {
    fill(0, 255, 0);
    ellipse(mouseX, mouseY, circleWidth*3, circleWidth*3);
  } else {
    ellipse(mouseX, mouseY, circleWidth, circleWidth);
  }

  //bottom right 

  if (mouseX >= screenDimension*.70 
    && mouseX <= screenDimension*.80 
    && mouseY >= screenDimension*.70 
    && mouseY <= screenDimension*.80) 
  {
    fill(255, 0, 255);
    ellipse(mouseX, mouseY, circleWidth*3, circleWidth*3);
  } else {
    ellipse(mouseX, mouseY, circleWidth, circleWidth);
  }

  //bottom left

  if (mouseX >= screenDimension*.20 
    && mouseX <= screenDimension*.30 
    && mouseY >= screenDimension*.70 
    && mouseY <= screenDimension*.80) 
  {
     fill(255, 255, 0);
    ellipse(mouseX, mouseY, circleWidth*3, circleWidth*3);
  } else {
    ellipse(mouseX, mouseY, circleWidth, circleWidth);
  }
}

