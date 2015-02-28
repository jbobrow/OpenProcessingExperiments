
int[] age = new int[15];
float[] shortTerm = new float[15];
float[] longTerm = new float[15];

int bottomMargin = 100, topMargin = 50, leftMargin = 50, rightMargin = 50;
int circleSize = 10;
float shortTermAvg = 0, longTermAvg = 0;

void setup() {
  size(1000, 600);
  background(255);
  textFont(createFont("ComicSansMS-Bold-48", 20));

  fill(0); 
  strokeWeight(6);
  line (leftMargin, height - bottomMargin, width - rightMargin, height - bottomMargin);
  line (leftMargin, height - bottomMargin, leftMargin, topMargin);

  text("Low", 5, height - bottomMargin - 10);
  text("High", 5, topMargin + 15);

  fill (0);
  text("Age", leftMargin, height - 70);

  int ageNumber=10;
  int xPos=100;

  for (int i=0;i<10;i++) 
  {
    fill (0);
    text(ageNumber, xPos, height - 70);
    xPos+=100;
    ageNumber+=10;
  }

  String[] data = loadStrings("data.csv");

  for (int i=0;i<data.length;i++) {
    String[] newLine = split(data[i], ",");

    age[i] = int(newLine[0]);
    shortTerm[i] = float(newLine[1]);
    longTerm[i] = float(newLine[2]);
  }

  displayLegend();
  
  smooth();

  for (int i=0;i<age.length;i++) {
    
    float x = map(age[i], 4, 89, 50, 900);
    float shortTermY = map(shortTerm[i], 0, 1, height - bottomMargin, topMargin);
    float longTermY = map(longTerm[i], 0, 1, height - bottomMargin, topMargin);
    
    shortTermAvg += shortTerm[i];
    longTermAvg += longTerm[i];
    
    stroke(0);
    strokeWeight(1);
    if (shortTermY < longTermY)
      line(x,shortTermY,x,height - bottomMargin);
    else if (shortTermY > longTermY)
      line(x,longTermY,x,height - bottomMargin);
    
    noStroke();
    
    fill(255, 0, 0);
    ellipse(x, height-bottomMargin, circleSize, circleSize);

    fill(0, 255, 0);
    ellipse(x, shortTermY, circleSize, circleSize);

    fill(0, 0, 255);
    ellipse(x, longTermY, circleSize, circleSize);
  }
  
  //*******************************************************************
  shortTermAvg /= age.length;  
  longTermAvg /= age.length;
  
  strokeWeight(2);
  
  stroke(0,255,0);
  float shortTermAvgY = map(shortTermAvg, 0, 1, height - bottomMargin, topMargin);
  line(leftMargin,shortTermAvgY,width - rightMargin,shortTermAvgY);
  
  stroke(0,0,255);
  float longTermAvgY = map(longTermAvg, 0, 1, height - bottomMargin, topMargin);
  line(leftMargin,longTermAvgY,width - rightMargin,longTermAvgY);
  //*******************************************************************
}

void draw(){
}

void displayLegend() {
  
  int startX=350, startY=50;
  noFill();
  stroke(0);
  rect(startX, startY, 250, 90);

  fill(0);
  text("Age: ", startX + 15, startY + 30);
  text("Short Term Memory: ", startX + 15, startY + 50);
  text("Long Term Memory: ", startX + 15, startY + 70);

  noStroke();
  fill(255, 0, 0);
  ellipse(startX + 65, startY + 25, circleSize, circleSize);

  fill(0, 255, 0);
  ellipse(startX + 210, startY + 45, circleSize, circleSize);

  fill(0, 0, 255);
  ellipse(startX + 210, startY + 65, circleSize, circleSize);
}

