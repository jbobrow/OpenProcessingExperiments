
import org.gicentre.utils.multisketch.*;

float dataMin, dataMax;
float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;

//Set the time data
int [] time = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
int timeInterval = 1;
int timeMin = 0;
int timeMax = 24;
int volumeInterval = 10;
int volumeIntervalMinor = 10;

float lineX = 120;//To start next to the Y axis

PFont plotFont;

void setup ()
{
  size(700,400);
  background(255);
  plotX1 = 120; 
  plotX2 = width - 80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height - 70;
  labelY = height - 25;
  dataMin = 0;
  dataMax = ceil (50/volumeInterval)*volumeInterval;
  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);
  
  smooth();
  PopupWindow win = new PopupWindow(this,new AnotherSketch()); 
  win.setVisible(true);
  PopupWindow win1 = new PopupWindow(this,new newSketch()); 
  win1.setVisible(true);
}
  
void draw ()
{  
  // Show the plot area as a white box  
  //fill(255);
  rectMode(CORNERS);
  stroke(#5679C1);
  strokeWeight(1);
  //rect(plotX1, plotY1, plotX2, plotY2);  
  line (plotX1,plotY1,plotX2,plotY1);
  stroke(2);
  smooth();
  fill(224);
  noStroke();
  rect(0,0,width,plotY1);
  rect(0,0,plotX1,height);
  rect(0,height,width,plotY2);
  rect(plotX2,0,width,height);
  stroke(2);
  smooth();
  fill(0);
  
  
  drawAxisLabels();
  drawYearLabels();
  drawVolumeLabels();
  drawTitle();
  drawDataLine();
  smooth();

}

void drawTitle() {
  fill(0,0,255);
  textSize(20);
  textAlign(LEFT);
  String title = "Sensor 1";
  text(title, plotX1, plotY1 - 10);
}
  
void drawYearLabels() 
{
  fill(0,0,255);
  textSize(10);
  textAlign(CENTER);
  
  // Use thin, gray lines to draw the grid
  
  
  
  for (int row = 0; row < 25; row++) {
    if (time[row] % timeInterval == 0) {
      float x = map(time[row], timeMin, timeMax, plotX1, plotX2);
      text(time[row], x, plotY2 + textAscent() + 10);
      stroke(#5679C1);
      strokeWeight(0.00001);
      line(x, plotY1, x, plotY2);
      line(plotX1,plotY2,plotX2,plotY2);
      line(plotX2,plotY1,plotX2,plotY2);
      stroke(0);
      strokeWeight(1);
      line(x, plotY2+4, x, plotY2);
    }
  }
}

  void drawAxisLabels() 
{
  fill(0,0,255);
  textSize(13);
  textLeading(15);
  
  textAlign(CENTER, CENTER);
  text("Graus Celsius\n (ºC)", labelX, (plotY1+plotY2)/2);
  textAlign(CENTER);
  text("Time (h)", (plotX1+plotX2)/2, labelY);
} 

void drawVolumeLabels() {
  fill(0,0,255);
  textSize(10);
  textAlign(RIGHT);
  
  stroke(0);
  strokeWeight(1);

  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
    if (v % volumeIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % volumeInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        if (v == dataMin) {
          textOffset = 0;                   // Align by the bottom
        } else if (v == dataMax) {
          textOffset = textAscent();        // Align by the top
        }
        text(floor(v), plotX1 - 10, y + textOffset);
        line(plotX1 - 4, y, plotX1, y);     // Draw major tick
        line(plotX1-2, y+27, plotX1, y+27);  //line to draw midle lines
      } else {
        //line(plotX1 - 2, y, plotX1, y);     // Draw minor tick
      }
    }
  }
}

void mousePressed() 
{
  println("Coordinates: " + mouseX +"," + mouseY);
}


void drawDataLine() {  
  stroke(#5679C1);
  strokeWeight(5);
  noFill();
  if(pmouseY>60 && pmouseY<(height-70))
  {
  line (lineX,mouseY,lineX,pmouseY); 
  lineX ++;
  delay(20);
  }
  
  if (lineX>width-80)
  {
    lineX=120;
    background (255);
   }
}



