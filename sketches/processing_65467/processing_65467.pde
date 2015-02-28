
//String imageName = "";
//String imageNamePrevPrev = "x";
//String imageNamePrev = "x";
//String imageNamePrevNext = "x";
PImage existingDrawingPrev, existingDrawing, existingDrawingNext;

int fillSwitch = 1;
int galleryNum = 0;
int flipDir = 0;
int push = 0;
int pushDelta;

void Gallery() {
  if (flipDir == -1) {
    push = push + pushDelta;
    if (push > width) {
      flipDir = 0;
      push = 0;
      galleryNum--;
    }
  } 
  else if (flipDir == 1) {
    push = push - pushDelta;
    if (push < -width) {
      flipDir = 0;
      push = 0;
      galleryNum++;
    }
  }
  galleryNum = constrain(galleryNum, 1, dataByDate.length - 1);

  dataByDateLinePrev = split(dataByDate[max(galleryNum - 1, 0)], '\t');
  dataByDateLine = split(dataByDate[galleryNum], '\t');
  dataByDateLineNext = split(dataByDate[min(galleryNum + 1, dataByDate.length-1)], '\t');

  //SERIES + TITLE
  textFont(font2);
  fill(128);
  textAlign(LEFT, TOP);
  text(dataByDateLinePrev[1], -width - 5 + push, 5);
  text(dataByDateLine[1], 5 + push, 5);
  text(dataByDateLineNext[1], width + 5 + push, 5);

  //DATE
  fill(0);
  textAlign(RIGHT, TOP);
  text(dataByDateLinePrev[3] + " " + dataByDateLinePrev[4] + " " + dataByDateLine[5], -5 + push, 5);
  text(dataByDateLine[3] + " " + dataByDateLine[4] + " " + dataByDateLine[5], width - 5 + push, 5);
  text(dataByDateLineNext[3] + " " + dataByDateLineNext[4] + " " + dataByDateLineNext[5], width + width -5 + push, 5);

  //DIMENSIONS + IMAGE
  noStroke();
  fill(0);
  float[] dimensionsPrev = float(trim(split(dataByDateLinePrev[7], 'x')));
  float[] dimensions = float(trim(split(dataByDateLine[7], 'x')));
  float[] dimensionsNext = float(trim(split(dataByDateLineNext[7], 'x')));

  rectMode(CENTER);
  //println(galleryNum);
  rect(-width/2 + push, height/2, dimensionsPrev[1]*10, dimensionsPrev[0]*10);
  rect(width/2 + push, height/2, dimensions[1]*10, dimensions[0]*10);
  rect(width/2 + width + push, height/2, dimensionsNext[1]*10, dimensionsNext[0]*10);

  imageMode(CENTER);
  
/*if(push == 0){
  if ((dataByDateLine.length >= 13) && (dataByDateLine[12].length() > 3)) {//Is there an image to load?
    if (dataByDateLine[12] != imageNamePrev) {
      existingDrawing = loadImage(dataByDateLine[12] + ".jpg");
    }
    //image(existingDrawing, width/2 + push, height/2, dimensions[1]*10, dimensions[0]*10);
    //imageNamePrev = dataByDateLine[12];
  }
}*/

  //TITLE
  textAlign(CENTER, TOP);
  fill(yellow);
  text(dataByDateLine[2], width/2, height/2 + dimensions[0]*5);

  //LEGEND
  float sumToPresent = 0;
  noStroke();
  rectMode(CORNER);
  for (int i = 0; i < yearOccurance.length; i++) {
    if (fillSwitch == 1) {
      fill(200);
    }
    else {
      fill(150);
    }
    rect((sumToPresent/2826)*width, height-50, (float(yearOccurance[i])/2826)*width, 30);
    sumToPresent = sumToPresent + float(yearOccurance[i]);
    //println(sumToPresent);
    fillSwitch = fillSwitch*-1;
  }

  //MARK AVAILABLE IMAGES
  /*for (int i = 0; i < data.length; i++) {
    String[] dataByDataItem = split(dataByDate[i], '\t');
    if (dataByDataItem.length >= 13) {
      if (dataByDataItem[12].length() > 3) {
        stroke(255, 204, 0, 80);
        strokeWeight(1);
        line((float(i)/2826)*width, height-50, (float(i)/2826)*width, height - 20);
      }
    }
  }*/

  //CURSOR
  stroke(0);
  strokeWeight(5);
  strokeCap(PROJECT);
  line((float(galleryNum)/2826)*width, height-50, (float(galleryNum)/2826)*width, height-20);

  if ((float(galleryNum)/2826)*width < 100) textAlign(LEFT);
  if (((float(galleryNum)/2826)*width < 100) && ((float(galleryNum)/2826)*width < 1000)) textAlign(CENTER);
  if ((float(galleryNum)/2826)*width > 900) textAlign(RIGHT);
  textAlign(CENTER, TOP);
  textFont(font2);
  text(dataByDateLine[5], (float(galleryNum)/2826)*width, height - 25);
}


