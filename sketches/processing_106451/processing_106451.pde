
PFont myFont; //load my font
String[] rawData;
String[][] data;
color masons = color(139, 0, 0);
color totals = color(47, 79, 79);

void setup() {
  size(1000, 1000);
  //smooth ();
  myFont = loadFont("BookAntiqua-48.vlw");
  rawData = loadStrings("simpledata.csv");
  println(rawData);
  splitData();//this calls the splitData function
}

void draw(){
  background(255, 248, 220);
  
  drawLineGraphTPpl ();
  drawLineGraphM ();
  drawLineGraphTPen ();
  drawLineGraphMP ();
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

//=====================================================================================
void drawLineGraphTPpl (){
  //this draws a line graph of the total workers.
  
  //We need a counter to move our points every time we draw. Like the bar chart,
  //we should start at the right and work left, going from high values to low values
  int counter = width-100;

  //This simple calculation makes my chart proportionate to the size of my screen
  int pointDist = int((width-100)/rawData.length);

  //First we will loop through all of the data
  for (int i=0; i<rawData.length; i++) {

    //We need to map the values of the data. Instead of being from 0 to 1000, as they
    //are now, we should change the range to be proportionate to our sketch.
    //This will be the y value of our points and lines.
    float point = map(float(data[i][5]), 0, 1000, height-50, 50);

    //We start at every point after 0, because we cannot draw a line from the first
    //element to anything before it - there is nothing before it!
    if (i>0) { 

      //Like the first point, let's map the values of the array. This time we are
      //changing the values of the part of the array that is directly previous to the
      //point we are working with. This is because lines must be draw from one point
      //to another, so we need to sets of values.
      float prevPoint = map(float(data[i-1][5]), 0, 1000, height-50, 50);

      //Draws the line from one point to the other using the counter and point values.
      strokeWeight(3);
      line(counter, prevPoint, counter-pointDist, point);

      //Draw a circle on each data point for emphasis.
      fill(255);
      ellipse(counter, prevPoint, 10, 10);

      //Let's create a variable that finds the distance between each point and the mouse.
      //We'll use this to detect hover later.
      float distPoint = dist(counter, prevPoint, mouseX, mouseY);

      if (distPoint < 10) {

        //Write the relevant data on the screen when you hover
        fill(0);
        textAlign(CENTER);
         text(data[i-1][0] + data[i-1][1] + ", " + " Number of people hired: " + data[i-1][5], width/2, height-10);

        //Draw a filled box when you hover
        fill(100);
        ellipse(counter, prevPoint, 10, 10);
      }

      //Iterate the counter. Remember we are drawing from right to left!
      counter-=pointDist;
    }
  }
}

//=====================================================================================
void drawLineGraphM (){
 //This draws a line graph of the masons.
 
  //We need a counter to move our points every time we draw. Like the bar chart,
  //we should start at the right and work left, going from high values to low values
  int counter = width-100;

  //This simple calculation makes my chart proportionate to the size of my screen
  int pointDist = int((width-100)/rawData.length);

  //First we will loop through all of the data
  for (int i=0; i<rawData.length; i++) {

    //We need to map the values of the data. Instead of being from 0 to 1000, as they
    //are now, we should change the range to be proportionate to our sketch.
    //This will be the y value of our points and lines.
    float point = map(float(data[i][4]), 0, 1000, height-50, 50);

    //We start at every point after 0, because we cannot draw a line from the first
    //element to anything before it - there is nothing before it!
    if (i>0) { 

      //Like the first point, let's map the values of the array. This time we are
      //changing the values of the part of the array that is directly previous to the
      //point we are working with. This is because lines must be draw from one point
      //to another, so we need to sets of values.
      float prevPoint = map(float(data[i-1][4]), 0, 1000, height-50, 50);

      //Draws the line from one point to the other using the counter and point values.
      strokeWeight(3);
      line(counter, prevPoint, counter-pointDist, point);

      //Draw a circle on each data point for emphasis.
      fill(masons, 60);
      ellipse(counter, prevPoint, 10, 10);

      //Let's create a variable that finds the distance between each point and the mouse.
      //We'll use this to detect hover later.
      float distPoint = dist(counter, prevPoint, mouseX, mouseY);

      if (distPoint < 10) {

        //Write the relevant data on the screen when you hover
        fill(masons);
        textAlign(CENTER);
        text(data[i-1][0] + data[i-1][1] + ", " + " Number of masons hired: " + data[i-1][4], width/2, height-20);

        //Draw a filled box when you hover
        fill(masons);
        ellipse(counter, prevPoint, 10, 10);
      }

      //Iterate the counter. Remember we are drawing from right to left!
      counter-=pointDist;
    }
  }
}

//=====================================================================================
void drawLineGraphTPen (){
  //this draws a line graph of the total workers.
  
  //We need a counter to move our points every time we draw. Like the bar chart,
  //we should start at the right and work left, going from high values to low values
  int counter = width-100;

  //This simple calculation makes my chart proportionate to the size of my screen
  int pointDist = int((width-100)/rawData.length);

  //First we will loop through all of the data
  for (int i=0; i<rawData.length; i++) {

    //We need to map the values of the data. Instead of being from 0 to 1000, as they
    //are now, we should change the range to be proportionate to our sketch.
    //This will be the y value of our points and lines.
    float point = map(float(data[i][3]), 0, 1000, height-50, 50);

    //We start at every point after 0, because we cannot draw a line from the first
    //element to anything before it - there is nothing before it!
    if (i>0) { 

      //Like the first point, let's map the values of the array. This time we are
      //changing the values of the part of the array that is directly previous to the
      //point we are working with. This is because lines must be draw from one point
      //to another, so we need to sets of values.
      float prevPoint = map(float(data[i-1][3]), 0, 1000, height-50, 50);

      //Draws the line from one point to the other using the counter and point values.
      strokeWeight(3);
      line(counter, prevPoint, counter-pointDist, point);

      //Draw a circle on each data point for emphasis.
      fill(255);
      ellipse(counter, prevPoint, 10, 10);

      //Let's create a variable that finds the distance between each point and the mouse.
      //We'll use this to detect hover later.
      float distPoint = dist(counter, prevPoint, mouseX, mouseY);

      if (distPoint < 10) {

        //Write the relevant data on the screen when you hover
        fill(0);
        textAlign(CENTER);
         text(data[i-1][0] + data[i-1][1] + ", " + " Total wages paid to all workers: " + data[i-1][3] + " pennies", width/2, height-20);

        //Draw a filled box when you hover
        fill(100);
        ellipse(counter, prevPoint, 10, 10);
      }

      //Iterate the counter. Remember we are drawing from right to left!
      counter-=pointDist;
    }
  }
}
//=====================================================================================
void drawLineGraphMP (){
  //this draws a line graph of the total workers.
  
  //We need a counter to move our points every time we draw. Like the bar chart,
  //we should start at the right and work left, going from high values to low values
  int counter = width-100;

  //This simple calculation makes my chart proportionate to the size of my screen
  int pointDist = int((width-100)/rawData.length);

  //First we will loop through all of the data
  for (int i=0; i<rawData.length; i++) {

    //We need to map the values of the data. Instead of being from 0 to 1000, as they
    //are now, we should change the range to be proportionate to our sketch.
    //This will be the y value of our points and lines.
    float point = map(float(data[i][2]), 0, 1000, height-50, 50);

    //We start at every point after 0, because we cannot draw a line from the first
    //element to anything before it - there is nothing before it!
    if (i>0) { 

      //Like the first point, let's map the values of the array. This time we are
      //changing the values of the part of the array that is directly previous to the
      //point we are working with. This is because lines must be draw from one point
      //to another, so we need to sets of values.
      float prevPoint = map(float(data[i-1][2]), 0, 1000, height-50, 50);

      //Draws the line from one point to the other using the counter and point values.
      strokeWeight(3);
      line(counter, prevPoint, counter-pointDist, point);

      //Draw a circle on each data point for emphasis.
      fill(masons, 50);
      ellipse(counter, prevPoint, 10, 10);

      //Let's create a variable that finds the distance between each point and the mouse.
      //We'll use this to detect hover later.
      float distPoint = dist(counter, prevPoint, mouseX, mouseY);

      if (distPoint < 10) {

        //Write the relevant data on the screen when you hover
        fill(masons);
        textAlign(CENTER);
         text(data[i-1][0] + data[i-1][1] + ", " + " Total wages paid to masons: " + data[i-1][2] + " pennies", width/2, height-30);

        //Draw a filled box when you hover
        fill(masons);
        ellipse(counter, prevPoint, 10, 10);
      }

      //Iterate the counter. Remember we are drawing from right to left!
      counter-=pointDist;
    }
  }
}



