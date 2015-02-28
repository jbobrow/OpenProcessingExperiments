
//Table table2;
Table table1;
//Table table3;
String captureName1 ="rom_1.trc";
//String captureName2 =("bat_theswing3clean.trc");
//String CaptureName3 =("bench_sit1clean.trc");
float frameTotal;
float markerTotal;
int currentFrame = 0;
float framePercent = 0;

void setup() {
  size(1080, 720);
  table1 = loadTable(captureName1, "tsv");

  //table2 = loadTable(captureName2, "tsv");
  // table3 = loadTable(CaptureName3, "tsv");

  frameTotal = table1.getFloat(2, 2);
  markerTotal = table1.getFloat(2, 3);
  //  background(250, 222, 5);
  frameRate(30);
}

void draw() {


  //background(213, 234, 232);
  fill (0, 10);
  rect (0, 0, width, height);
  scale(.35);
  rotate(PI);
  translate(-1800, -1000);



  if (currentFrame < frameTotal) {
    framePercent = currentFrame/frameTotal;
    for (int counter = 0; counter < markerTotal; counter = counter + 1) {
      //  float xValue = table2.getFloat(6 + currentFrame, 2 + (counter * 3));
      // float yValue = table2.getFloat(6 + currentFrame, 3 + (counter * 3));
      float xValue1 = table1.getFloat(6 + currentFrame, 2 + (counter * 3));
      float yValue1 = table1.getFloat(6 + currentFrame, 3 + (counter * 3));
      // float xValue2 = table3.getFloat(6 + currentFrame, 2 + (counter * 3));
      // float yValue2 = table3.getFloat(6 + currentFrame, 3 + (counter * 3));

      // println(xValue1 + " " + yValue1);
      //this lets you know where the capture volume will take place



      //top left
      pushMatrix();
      scale(.25);
      translate(4500, 2000);
      snowFlake(xValue1, yValue1, 75);
      popMatrix();
      //top right
      pushMatrix();
      scale(.15);
      translate(-6000, 3000);
      snowFlake(xValue1, yValue1, 85);
      popMatrix();

      //bottom left side
      pushMatrix();
      scale(.15);
      translate(6000, -5000);
      snowFlake(xValue1, yValue1, 90);
      popMatrix();

      //bottom right
      pushMatrix();
      scale(.10);
      translate(-8000, -5000);
      snowFlake(xValue1, yValue1, 70);
      popMatrix();

      //left middle
      pushMatrix();
      scale(.15);
      translate(9000, -1000);
      snowFlake(xValue1, yValue1, 80);
      popMatrix();

      snowFlake(xValue1, yValue1, 20);
    }
  }
  currentFrame++;
  if (currentFrame > frameTotal) {
    currentFrame =0;
  }
}

void snowFlake(float xValue1, float yValue1, int size) {

  int speed = 1;
  xValue1 = xValue1 + speed;
  
  pushMatrix();
  scale(.50);
  fill (199, 94, 95);
  ellipse (xValue1, yValue1, size, size);
  ellipse(xValue1, -yValue1, size, size);
  popMatrix();

  pushMatrix();
  translate(185, -180);
  rotate (radians(90));
  scale(.50);
  fill (199, 94, 95);
  ellipse (xValue1, yValue1, size, size);
  ellipse(xValue1, -yValue1, size, size);
  popMatrix();

  pushMatrix();
  translate(80, -100);
  rotate (radians(45));
  scale(.40);
  fill (199, 66, 51);
  ellipse (xValue1, yValue1, size, size);
  ellipse(xValue1, -yValue1, size, size);
  popMatrix();

  pushMatrix();
  translate(70, 120);
  rotate (radians(-45));
  scale(.40);
  fill (199, 66, 51);
  ellipse (xValue1, yValue1, size, size);
  ellipse(xValue1, -yValue1, size, size);
  popMatrix();
}



