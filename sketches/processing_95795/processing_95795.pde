
int numX = 6;
int numL = 8;

float[] dataHolder = new float[1920];
float[] paramHolder = new float[numL];

float[] buttonX = new float[numX];
float[] buttonY = new float[numX];
float[] plotArea = {0.13, 0.98, 0.9, 0.15};
float alpha = 85;

float buttonWidth = 75;
float buttonHeight = 20;

float numXTick = 12;
float numYTick = 4;
float xTickLoc, yTickLoc;

float eqnX = 10;

float[][] X = new float[1920][numX];
float[][] Y = new float[1920][numX];
int[] indices = new int[1920];
float[][] params = new float[numL][numX+1];
String[] labels = {"d_avg", "c_avg", "BQ_dif", "BS_avg", "BC_avg", "rs"};
String[] contrasts = {"Forgotten", "Remembered", "Hits", "Misses", "FAs", "CRs", "Subs. Mem.", "Succ. Retr."};

float smallPoint = 4;
float largePoint = 8;
color[] colors = {#E41A1C, #377EB8, #4DAF4A, #984EA3, #FF7F00, #FFFF33, #A65628, #F781BF};
int dimChoice = 0;
int oldChoice = 0;
int counter = 0;
int curind = numL+1;

float[] px = new float[1920];
float[] nx = new float[1920];
float[] py = new float[1920];
float[] ny = new float[1920];
float[][] mins = new float[numX][2];
float[][] maxs = new float[numX][2];

int xMin, xMax, yMin, yMax;

PFont normalFont, axisFont, sigFont;
String[] label = new String[6];
String Label;

boolean showLine = false;
boolean flag = false;

void setup() {

  // File IO
  for (int i = 0; i < numX; i++) {
    dataHolder = float(loadStrings("X" + i + ".txt"));
    for (int j = 0; j < 1920; j++) {
      X[j][i] = dataHolder[j];
    }
    mins[i][0] = min(dataHolder);
    maxs[i][0] = max(dataHolder);
  }

  for (int i = 0; i < numX; i++) {
    dataHolder = float(loadStrings("Y" + i + ".txt"));
    for (int j = 0; j < 1920; j++) {
      Y[j][i] = dataHolder[j];
    }
    mins[i][1] = min(dataHolder);
    maxs[i][1] = max(dataHolder);
  }
  
  for (int i = 0; i < numX+1; i++) {
    paramHolder = float(loadStrings("params" + i + ".txt"));
    for (int j = 0; j < numL; j++) {
      params[j][i] = paramHolder[j];
    }
  }
  
  indices = int(loadStrings("inds.txt"));
  
  normalFont = loadFont("LucidaSans-14.vlw");
  axisFont = loadFont("LucidaSans-12.vlw");
  sigFont = loadFont("LucidaSans-Demi-14.vlw");
  
  label[0] = "y = ";
  label[2] = " +\n";
  label[4] = "*";

  // Window sizing
//  if ((float(displayWidth)/float(1200)) < (float(displayHeight)/float(400))) {
//    size(displayWidth, int(float(400)*(float(displayWidth)/float(1200))));
//  } 
//  else {
//    size(int(float(1200)*(float(displayHeight)/float(400))), displayHeight);
//  }

  size(864, 288, P2D); // JS fixed-size version

  for (int i = 0; i < numX; i++) {
    buttonX[i] = (width/2) + ((float(i)-float(numX-1)/2)*buttonWidth*1.5);//int(int((1-plotArea[1])*width));
    buttonY[i] = (plotArea[3]/2)*height;//(height/2) + ((float(i)-float(numX-1)/2)*30);
  }

  xMin = int(plotArea[0]*width);
  xMax = int(plotArea[1]*width);
  yMin = int(plotArea[2]*height);
  yMax = int(plotArea[3]*height);
  
  xTickLoc = (xMax-xMin+20)/(numXTick-1);
  yTickLoc = (yMin-yMax+20)/(numYTick-1);

  // Set drawing variables

  //  frameRate(1);

  cursor(CROSS);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  smooth();

  float mindist = MAX_FLOAT;
  for (int i = 0; i < 1920; i++) {
    if (dist(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), mouseX, mouseY)<largePoint/2) {
      if (dist(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), mouseX, mouseY)<mindist) {
        mindist = dist(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][1], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), mouseX, mouseY);
        curind = indices[i];
      }
    }
  }
} // End setup()

void draw() {

  if (counter > 0) {
    counter--;
  }

  background(#222222);
  
  textFont(axisFont);
  fill(#BBBBBB);
  stroke(#BBBBBB, alpha);
  strokeWeight(2);
  for (int i = 0; i < numXTick; i++) {
    text(nfp(map(i, 0, (numXTick-1), mins[dimChoice][0], maxs[dimChoice][0]), 1, 3), (xMin-10)+float(i)*xTickLoc-10, (yMin+10)+10);
  }
  for (int i = 0; i < numYTick; i++) {
    text(nfp(map(i, 0, (numYTick-1), mins[dimChoice][1], maxs[dimChoice][1]), 1, 3), (xMin-10)-35, (yMin+10)-float(i)*yTickLoc);
    line(xMin-10, (yMin+10)-float(i)*yTickLoc, xMax+10, (yMin+10)-float(i)*yTickLoc);
  }
  
  strokeWeight(4);
  stroke(#000000);
  line(xMin-10, yMin+10, xMin-10, yMax-10);
  line(xMin-10, yMin+10, xMax+10, yMin+10);
  
  noStroke();
  fill(#444444);
  rect(buttonX[0], buttonY[0], buttonWidth, buttonHeight);
  rect(buttonX[1], buttonY[1], buttonWidth, buttonHeight);
  rect(buttonX[2], buttonY[2], buttonWidth, buttonHeight);
  rect(buttonX[3], buttonY[3], buttonWidth, buttonHeight);
  rect(buttonX[4], buttonY[4], buttonWidth, buttonHeight);
  rect(buttonX[5], buttonY[5], buttonWidth, buttonHeight);

  fill(#999999);
  textFont(normalFont);
  for (int i = 0; i < numX; i++) {
    text(labels[i], buttonX[i], buttonY[i]);
  }

  fill(#FFFFFF);
  text(labels[dimChoice], buttonX[dimChoice], buttonY[dimChoice]);

  noFill();

  if (counter > 0) {

    for (int i = 0; i < 1920; i++) {
      if (indices[i] == curind) {
        stroke(colors[indices[i]-1], alpha);
        ellipse(px[i]*counter/20 + nx[i]*(20-counter)/20, py[i]*counter/20 + ny[i]*(20-counter)/20, largePoint, largePoint);
      } 
      else {
        stroke(colors[indices[i]-1], alpha);
        ellipse(px[i]*counter/20 + nx[i]*(20-counter)/20, py[i]*counter/20 + ny[i]*(20-counter)/20, smallPoint, smallPoint);
      }
    }
  } 
  else {

    for (int i = 0; i < 1920; i++) {
      if (indices[i] == curind) {
        if (showLine) {
          stroke(colors[indices[i]-1], alpha);
        } else {
          stroke(colors[indices[i]-1], 255);
        }
        ellipse(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), largePoint, largePoint);
      } 
      else {
        stroke(colors[indices[i]-1], alpha);
        ellipse(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), smallPoint, smallPoint);
      }
    }
  }
    
  if (curind <= numL) {
    textAlign(LEFT, CENTER);
    fill(colors[curind-1]);
    textFont(normalFont);
    label[1] = nfp(params[curind-1][numX], 1, 3);
    label[3] = nfp(params[curind-1][dimChoice], 1, 3);
    label[5] = labels[dimChoice];
    Label = join(label, "");
    //          println(joined);
    text(Label, eqnX, mouseY);
    text(contrasts[curind-1], eqnX, mouseY-25);
    textAlign(CENTER, CENTER);
    
    if (showLine) {
      stroke(colors[curind-1]);
      strokeWeight(3);
      line(xMin, map(params[curind-1][numX]+mins[dimChoice][0]*params[curind-1][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), xMax, map(params[curind-1][numX]+maxs[dimChoice][0]*params[curind-1][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax));
    }
    
  }
} // End draw()

void mouseClicked() {

  flag = false;

  // Check for position relative to a series of buttons
  for (int option = 0; option < numX; option++) {
    if ((abs(mouseX-buttonX[option])<=buttonWidth/2)&(abs(mouseY-buttonY[option])<=buttonHeight/2)) {
      if (dimChoice != option) {
        oldChoice = dimChoice;
        dimChoice = option;
        counter = 20;
        flag = true;
        for (int i = 0; i < 1920; i++) {
          px[i] = map(X[i][oldChoice], mins[oldChoice][0], maxs[oldChoice][0], xMin, xMax);
          nx[i] = map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax);
          py[i] = map(Y[i][oldChoice], mins[oldChoice][1], maxs[oldChoice][1], yMin, yMax);
          ny[i] = map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax);
        }
      }
    }
  }
  
  if (!flag) {
    float mindist = MAX_FLOAT;
      for (int i = 0; i < 1920; i++) {
        if (dist(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), mouseX, mouseY)<largePoint/2) {
          if (dist(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][dimChoice], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), mouseX, mouseY)<mindist) {
            mindist = dist(map(X[i][dimChoice], mins[dimChoice][0], maxs[dimChoice][0], xMin, xMax), map(Y[i][1], mins[dimChoice][1], maxs[dimChoice][1], yMin, yMax), mouseX, mouseY);
            curind = indices[i];
          }
        }
      }
  }
  
}

void keyPressed() {
  showLine = !showLine;
}
