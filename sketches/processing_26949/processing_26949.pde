
Table currData, data1, data2, data3, data4;
int dataMin = 0, dataMax = 500;

float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;

int rowCount;

String currName;
int binSize = 2;
int countInterval = 50; 

PFont plotFont; 


void setup() {
  size(720, 405);
  
  data1 = new Table("isyh_data_M spotting M.tsv");
  data2 = new Table("isyh_data_M spotting F.tsv");
  data3 = new Table("isyh_data_F spotting M.tsv");
  data4 = new Table("isyh_data_F spotting F.tsv");
  currData = data3;
  currName = "F spotting M";
  setMetadata();
  
  

  // Corners of the plotted time series
  plotX1 = 120; 
  plotX2 = width - 80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height - 70;
  labelY = height - 20;
  
  float plotW = plotX2 - plotX1;
  
  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);

  smooth();
}

void setMetadata() {
  rowCount = currData.getRowCount();
  
//  dataMin = 0;
  // find the maximum value in the table
//  int tableMax = MIN_INT;
//  for (int row = 0; row < rowCount; row++) {
//   int value = currData.getInt(row,1);
//   if (value > tableMax) {
//      tableMax = value;
//    }
//  }
//  dataMax = (tableMax / countInterval  +1) * countInterval;
}

void draw() {
  background(234);
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1, plotY1, plotX2, plotY2);
  
  drawTitle();
  drawAxisLabels();

  noStroke();
  fill(#5679C1);
  drawDataBars();
  drawCountLabels();
  
//  drawYearLabels();
}


void drawTitle() {
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text(currName, (plotX1+plotX2)/2, plotY1 - 20);
}


void drawAxisLabels() {
  fill(0);
  textSize(13);
  textLeading(15);
  
  textAlign(CENTER, CENTER);
  text("Number of\noccurrences\nof word", labelX, (plotY1+plotY2)/2);
  textAlign(CENTER);
  text("Words, sorted by frequency, bin size "+binSize, (plotX1+plotX2)/2, labelY);
}


int countIntervalMinor = 5;   // Add this above setup()

void drawCountLabels() {
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  
  stroke(128);
  strokeWeight(1);

  for (int v = dataMin; v <= dataMax; v += countIntervalMinor) {
    if (v % countIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % countInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        // Draw major tick and label on both sides
        text(floor(v), plotX1 - 10, y + textOffset);
        line(plotX1 - 4, y, plotX1, y);     
        text(floor(v), plotX2 + 30, y + textOffset);
        line(plotX2+3, y, plotX2 + 7, y); 
        if (v > dataMin) {
          // Draw white bars across grid
          stroke(255);
          line(plotX1+1, y, plotX2, y);
        }
        stroke(128);
      } else {
        //line(plotX1 - 2, y, plotX1, y);     // Draw minor tick
      }
    }
  }
}



void drawDataBars() {
  noStroke();
  rectMode(CORNERS);
  int barWidth = 520 * binSize / 100 - 1;
  String mouseoverLabel = "";
  for (int count = 0; count < 100/binSize; count++) {
      float value = 0.0;
      for (int i = 0; i < binSize; i++) {
        value += currData.getInt(count*binSize + i, 1);
      }
      float x = map(count, 100/binSize, 0, plotX1, plotX2) - 2*binSize + 1;
      float y = map(value/binSize, dataMin, dataMax, plotY2, plotY1);
      rect(x-barWidth/2, y, x+barWidth/2, plotY2);
      
      if (abs(mouseX - x) < barWidth/2 && mouseY > plotY1 && mouseY > y) {
        if (binSize <= 2) {
          textSize(13);
          textLeading(12);
        } else {
          textSize(9);
          textLeading(10);
        } 
        textAlign(CENTER, TOP);
        for (int i = 0; i < min(binSize,3); i++) {
          mouseoverLabel += currData.getString(count*binSize + i,0) + '\n';
        }
        if (binSize > 3) {
          mouseoverLabel += "...";
        }
        text(mouseoverLabel, x, plotY2);
      }
  }
}




void keyPressed() {
  if (key == '1') {
    currData = data1;
    currName = "M spotting M";
  } else if (key == '2') {
    currData = data2;
    currName = "M spotting F";
  } else if (key == '3') {
    currData = data3;
    currName = "F spotting M";
  } else if (key == '4') {
    currData = data4;
    currName = "F spotting F";
  } else {
    if (key == '+' && binSize < 10) {
      binSize += 1;
    } else if (key == '-' && binSize > 1) {
      binSize -= 1;
    }
    return;
  }
  setMetadata();
  
  
}

