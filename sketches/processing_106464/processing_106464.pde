
int count = 510;
int level = 0;
int[] x = new int[count];
int[] y = new int[count];
PImage moocWorld;
PFont calibri;
String[]displayString = new String [7];



void setup () {
  size(1000, 800);
  colorMode(HSB, 360, 100, 100);
  //  background(300, 100, 100);
  for (int i=0; i<count; i++) {
    x[i]= int(random(0, width));
    y[i]= int(random(0, height));
  }
  moocWorld = loadImage("moocWorldHigh.jpg");
  calibri = loadFont("Calibri-20.vlw");
  displayString[0] = "Click the Mooc World to Open Enrollment";
  displayString[1] = "Click the Mooc World again to watch the First Lecture";
  displayString[2] = "Click the Mooc World to take the First Quiz";
  displayString[3] = "Click the Mooc World to attempt the Final Exam";
  displayString[4] = "Click the Mooc World to see if you Passed";
  displayString[5] = "Click the Mooc World to show the results";
  displayString[6] = "Out of 12,725 enrolled students 313 successfully completed the course";
  
}

void draw() {

  image (moocWorld, 0, 0, width, height);

//This section opens enrollment when you click on the earth
  if (level==1) {
    for (int i=0; i<count; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));
      //    drawSmiley (x[i], y[i]);
      smooth();
      fill(51, 100, 100);
      ellipse(x[i], y[i], 30, 30);
      fill(0);
      ellipse(x[i]-5, y[i]-4, 2, 2);
      ellipse(x[i]+5, y[i]-4, 2, 2);
      stroke(0);
      strokeWeight(1);
      noFill();
//      line(x[i]-7, y[i]+4, x[i]+7, y[i] +4);
      bezier(x[i]-7, y[i]+4, x[i]-3, y[i]+6, x[i]+3, y[i]+6, x[i]+7, y[i]+4);

      //    containment
      if (y[i] <= 0) {
        y[i]= 10;
      }
      if (y[i] >= height) {
        y[i]= height-10;
      }
      if (x[i] <= 0) {
        x[i]= 10;
      }
      if (x[i] >= width) {
        x[i]= width-10;
      
      }
    }
  }
  textFont(calibri, 26);
  fill(360);
  text(displayString[level], 100, 700);
}


void mouseClicked() {
  float distance;
  distance = dist(mouseX, mouseY, 565, 465);
  if (distance < 200) {
    level++;
  } 
}


