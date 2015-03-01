
int whichToMatch; //0 is red, 1 is green, 2 is blue
color colorToMatch;

int gmax = 255;
int gmin = 0;

//Green: 203 --> lstar says 220
//Red: 109 -- > lstar says 127
//Blue: 77 --> lstar indicated 76

void setup() {
  size(480, 270);
  whichToMatch = round(random(3));
  
  switch(whichToMatch) {
  case 0: //red
    colorToMatch = color(255, 0, 0);
    break;

  case 1: //green
    colorToMatch = color(0, 255, 0);
    break;

  case 2: //blue
  default:
    colorToMatch = color(0, 0, 255);
    break;
  }
}

void draw() {
  //Black background
  background(0);
  noStroke();
  noFill();
  
  //draw instructions
  fill(255);
  textAlign(LEFT);
  text("Click whichever box is flickering the most. If neither appears to be flickering, click the", 4, 16); 
  text("Save Result button",16,32);
  text("Frame rate (anything below 60 may give incorrect results): " + round(100*frameRate)/100,4,48);
  
  //draw squares
  int squareSize = width/3;
  int topOffset = (height - squareSize)/2;
  int leftOffset = (width - 2*squareSize)/3;
  
  if(frameCount%2 == 0){
    fill(gmin);
  } else {
    fill(colorToMatch);
  }
  rect(leftOffset,topOffset,squareSize,squareSize);
  
  if(frameCount%2 == 0){
    fill(gmax);
  } else {
    fill(colorToMatch);
  }
  rect(leftOffset+squareSize+leftOffset,topOffset,squareSize,squareSize);

  fill(255);
  text("Results: (" + round(gmin) + ", " + round((gmax+gmin)/2) + ", " + round(gmax) + ")",4,topOffset+squareSize+16);
  
  textAlign(CENTER);
  text("Save",width/2,topOffset+squareSize+32);
  
  noFill();
  stroke(255);
  rect(squareSize+leftOffset,topOffset+squareSize+20,leftOffset,16);
}

void mouseClicked(){
  int squareSize = width/3;
  int topOffset = (height - squareSize)/2;
  int leftOffset = (width - 2*squareSize)/3;
  
  if(mouseX > leftOffset+squareSize &&
     mouseX < leftOffset+squareSize+leftOffset &&
     mouseY > topOffset+squareSize){
    //TODO: Implement save button
  } else if(mouseX > width/2){
    //clicked right
    int span = gmax - gmin;
    int newmax = gmax - 0.1*(span);
    gmax = newmax;
  } else {
    //clicked left
    int span = gmax - gmin;
    int newmin = gmin + 0.1*(span);
    gmin = newmin;
  }
}

