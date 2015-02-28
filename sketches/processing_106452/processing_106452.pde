
PFont myFont; //load my font
String[] rawData;
String[][] data;
color masons = color(139, 0, 0);
color totals = color(47, 79, 79);

void setup() {
  size(2000, 1000);
  //smooth ();
  myFont = loadFont("BookAntiqua-48.vlw");
  rawData = loadStrings("simpledata.csv");
  println(rawData);
  splitData();//this calls the splitData function
}

void draw(){
  background(255, 248, 220);
  
  drawCirclesTPpl();//total people
  drawCirclesM();//total masons
  drawCirclesTPen();//totalpennies
  drawCirclesMPen();//total made by masons
  
  //drawPieGraph();

}

void splitData() {
  data = new String [rawData.length][6]; //make sure to correct the column width once the final data is added
  for (int i=0; i<rawData.length; i++) {

    String [] pieces = split(rawData[i], ",");
    for (int j=0; j<pieces.length; j++) {
      data [i][j] = pieces[j];
    }
  }
}
//==============================================================
//This void draws the circles that represent the total people
void drawCirclesTPpl() {

  //Loop through our rows of data
  for (int i = 0; i < rawData.length; i++) {

    //Draw an ellipse with its size based on number of pennies.
    fill(totals, 30);
    ellipse(width/2-400, height/2, int(data[i][5])*2, int(data[i][5])*2);
  }
}

//This void draws the circles that represent the total masons
void drawCirclesM() {

  //Loop through our rows of data
  for (int i = 0; i < rawData.length; i++) {

    //Draw an ellipse with its size based on number of pennies.
    //ellipseMode(CORNER);
    fill(masons, 30);
    ellipse(width/2-200, height/2, int(data[i][4])*5, int(data[i][4])*5);
  }
}


//This void draws the circles that represent the total pennies
void drawCirclesTPen() {

  //Loop through our rows of data
  for (int i = 0; i < rawData.length; i++) {

    //Draw an ellipse with its size based on number of pennies.
    //ellipseMode(CORNER);
    fill(totals, 30);
    ellipse(width/2, height/2, int(data[i][3])/5, int(data[i][3])/5);
  }
}

//This void draws the circles that represent the amount of money the masons made
void drawCirclesMPen() {

  //Loop through our rows of data
  for (int i = 0; i < rawData.length; i++) {

    //Draw an ellipse with its size based on number of pennies.
    //ellipseMode(CORNER);
    fill(masons, 30);
    ellipse(width/2+200, height/2, int(data[i][2])/2, int(data[i][2])/2);
  }
}
//==============================================================================
void drawPieGraph() {
//We need a variable that contains the sum of all of our data points
  //We use this in order to find out how much of the pie each piece will take.
  float totalGross = 0;

  //We will loop through only the first 6 of the data points. We don't want a pie chart with 30 pieces!
  //Add up all of the data points to find the total.
  for (int i = 0; i < 5; i++) {
    totalGross += int(data[i][1]);
  }

  //This variable will be used to offset the angle in order to draw each piece of the pie.
  float totalAngle = 0;

  //Loop through our six data points again.
  for (int i = 0; i < 5; i++) {

    //We need to do a little math to find the size of the wedge. 
    //Our current data point divided by the total gives us a percentage.
    //Multiply that by 360 to find the angle (a circle has 360 degrees)
    float angle = (int(data[i][1])/totalGross)*360;

    fill(i*20);
    stroke(255);
    //The pieces of the pie will be drawn one after the other, with each piece starting at the
    //angle in which the other piece ended. This will complete the circle.
    arc(width/2, height/2, 500, 500, radians(totalAngle), radians(totalAngle+angle));

    //Each time we need to increase the totalAngle by the number of degrees in the piece we just drew.
    //This will allow us to have consistent placement for the pieces.
    totalAngle+=angle;
  }
}




