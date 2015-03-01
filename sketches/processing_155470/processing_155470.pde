
//NanumGothic
PFont Mnanum;
float margin = 100;
float beziter = 500;

void setup() {
  size(1000, 1000);
  smooth();
  Mnanum = createFont("NanumGothic", 15, false);}

void draw() {
  background(0);  
  //  BarChart("numbers1.csv", 50, 150, 300, 125, 10, 110, 75, 255, 0);
  //  Bar("proName.csv", 150, 50, 125, 300, 10, 110, 75, 255, 0);
  //  Bar("proName2.csv", 150, 400, 125, 300, 145, 32, 175, 255, 0);
  //  BarChart("proName3.csv", 500, 50, 300, 700, 45, 76, 220, 255, 1);
  //  BarChart("proNumber.csv", 500, 50, 500, 900, 45, 76, 220, 111, 0);
  //  BarChart("proNumber.csv", 200, 800, 600, 600, 255, 0);
  BarChart("proNumber.csv", margin, height-margin, width-margin*2, height-margin, 255, 0);
}
void BarChart(String fileName, float xPos, float yPos, float xScale, float yScale, int a1, int LabelPlacement) {

  float xMax;
  float xMin = 0;
  noStroke();

  for (int c1 = 0; c1 < 1; c1++) {
    float xStart = xPos;
    String[] lines = loadStrings(fileName);

    for (int i = 0; i < lines.length; i++) {

      String[] values = split(lines[i], ",");
      xMax = max(int(values));
      xMin = min(int(values));
      float valueCount = values.length;  
      
      textFont(Mnanum);
      fill(255);
      textAlign(CENTER, CENTER);
      text("0", margin, 80);
      text("100", width-margin, 80);
      text("50", width/2, 80);
      stroke(255);
      strokeWeight(3);
      line(margin, 90, width-margin, 90);

      for (int i2 = 0; i2 < valueCount; i2++) {

        float yEndpoint = 100;
        float xValues = int(values[i2]);
        float xEndpoint = makeXpoint(xValues);
        /*
        if (xEnd > xScale) {
         xEnd = xScale;
         }
         */
        float xGap = xScale / valueCount;
        float xLines = xGap-5;
        strokeWeight(.5);
        stroke(255, 30);
        //        line(xPos, yPos, xEndpoint, yEndpoint);
        noFill();
        bezier(xPos, yPos, beziter, beziter, beziter, beziter, xEndpoint, yEndpoint);
        //        quad(xPos, yPos, xPos, yPos-ysclhght, xPos + xWidth, yPos-ysclhght, xPos + xWidth, yPos);
        /*
        if (LabelPlacement < 1) {
         //Above the Columns.
         text(pieces[i2], xPos + (xWidth/2), yPos-(ysclhght+8));
         } else {
         text(pieces[i2], xPos + (xWidth/2), yPos+8);
         }
         */
        xPos = xPos + xGap;
      }
    }
    // Reset for infinite redrawing data
    xPos = xStart;
  }
}
float makeXpoint ( float xEndpoint ) {
  return map(xEndpoint, 0, 100, margin, width-margin);
}



