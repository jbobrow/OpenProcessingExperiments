

//How we read xls files
import de.bezier.data.*;
XlsReader reader;


//How we write .csv files
PrintWriter output;

//array of cities x and y values
int[][] cities = new int[30][2];
int citynum = 0;//index
//array of paths start and end cities
int[][] paths = new int[465][2];
int pathnum = 0;//index

//distance to a line that the line will light up allowing you to select it
int disttoline = 17;
//distance to a city that will cause the city to grow and allow you to select it
int disttocity = 30;

//a boolean indicating if we are starting or finishing a path
boolean pointSelected = false;
//if a city is selected the number of that city so we can make a path once another is selected
int citySelected = -1;

//the library that allows us to make buttons,sliders,ect.
import controlP5.*;
//Button and text field variable
ControlP5 cp5;

//A varaible that controls how far is the farthest point that each point tries to connect to
int closestPoint = 1000;
//A variable that controls how close the lines can go to other points
int closestLine = 0;

//PrintWriter output;
DropdownList d1;

//a boolean that controls wether or not to autogenerate paths
boolean gen = false;
//a boolean that stops the file from saving when the program starts
//this is due to controlP5 calling each button once on startup
boolean init = false;

void setup ()
{
  size( 1250, 800 );//make a window
  background(102);//give the window a grey background

  fill(155);
  smooth();

  cp5 = new ControlP5(this);//make a button and text field controller

  //the drop down list of boards
  d1 = cp5.addDropdownList("boardSelect")
    .setPosition(300, 715)
      ;
  customize(d1); // customize the board list

  //the point radius slider
  cp5.addSlider("PointRadius")
    .setPosition(100, 770)
      .setRange(180, 1000)
        .setValue(1000)
          ;

  //the line radius slider
  cp5.addSlider("LineRadius")
    .setPosition(100, 750)
      .setRange(0, 80)
        .setValue(0)
          ;

  //create the autogenerate toggle button
  cp5.addToggle("AutoGenerate")
    .setPosition(100, 700)
      .setSize(50, 20)
        .setValue(false)
          .setMode(ControlP5.SWITCH)
            ;

  //create the reset button
  cp5.addButton("reset")//add a button to start the whole program over
    .setValue(0)
      .setPosition(410, 697)
        .setSize(80, 19)
          ;

  //create the save button
  cp5.addButton("savefile")//add a button to start the whole program over
    .setValue(0)
      .setPosition(510, 697)
        .setSize(80, 19)
          ;


  //initialize the program to board1 so that there are points when the program starts.
  reader = new XlsReader(this, "Board1.xls");
  //reader.showWarnings(false);

  //read the file to collect city location data
  makeCities();
}

void draw() {
  init = true;
  strokeWeight(2);
  stroke(102);
  fill(102);
  rect(0, 0, 1250, 800);
  stroke(128, 0, 255); 
  fill(150);
  for (int i = citynum;i >= 0 ;i--) {//draw every point
    ellipse(cities[i][0], cities[i][1], 10, 10);
  }

  for (int i = 0; i < pathnum; i++) {//draw all paths in the array
    drawPath(i);
  }

  fill(128, 0, 255);
  textSize(14);
  text("on", 105, 700);
  text("off", 130, 700);
  textSize(20);
  text(pathnum + " Lines", 400, 750);//display the number of paths

  int ccity = nearCity(mouseX, mouseY);//if the mouse is near any city, make that city bigger
  if (ccity > -1) {
    fill(150, 150, 0);
    ellipse(cities[ccity][0], cities[ccity][1], 15, 15);
  }

  if (pointSelected) {//if a city has been selected, draw a line to the mouse location until the path is
    if (ccity > -1) {//completed or canceled
      line(cities[citySelected][0], cities[citySelected][1], cities[ccity][0], cities[ccity][1]);
    }
    else
      line(cities[citySelected][0], cities[citySelected][1], mouseX, mouseY);
  }
  else {
    int cline = onPath(mouseX, mouseY);
    if (cline > -1) {
      strokeWeight(5);
      stroke(155, 0, 0);
      drawPath(cline);
    }
  }
}

//Reads the selected excel file and adds the x/y coordinates to the array of cities
public void makeCities() {
  citynum=0;
  reader.firstRow();
  reader.firstCell();
  cities[citynum][0] = reader.getInt();
  reader.nextCell();
  cities[citynum][1] = reader.getInt();
  while (reader.hasMoreRows ()) {
    citynum++;
    reader.nextRow();
    reader.firstCell();
    cities[citynum][0] = reader.getInt();
    reader.nextCell();
    cities[citynum][1] = reader.getInt();
  }
  println(citynum+1);
}

//takes a given point x,y and returns any line that they point is on
//if the point is not on any path, then it returns -1
public int onPath(int x, int y) {
  for (int i = 0; i < pathnum; i++) {
    if (pointToLineDistance(cities[paths[i][0]][0], cities[paths[i][0]][1], cities[paths[i][1]][0], cities[paths[i][1]][1], x, y) < disttoline) {
      if (betweenPoints(cities[paths[i][0]][0], cities[paths[i][0]][1], cities[paths[i][1]][0], cities[paths[i][1]][1], x, y)) {
        return i;
      }
    }
  }
  return -1;
}

//returns the distance from point 3 to the line created by points 1 and 2
public double pointToLineDistance(int x1, int y1, int x2, int y2, int x3, int y3)
{
  if (x1==x2) {
    println("hey");
    return Math.abs(x1-x3);
  }
  double normalLength = Math.hypot(x2 - x1, y2 - y1);
  return Math.abs((x3 - x1) * (y2 - y1) - (y3 - y1) * (x2 - x1)) / normalLength;
}

//returns true if point 3 is inside the box created by points 1 and 2
public boolean betweenPoints(int x1, int y1, int x2, int y2, int x3, int y3) {
  if (((x3 < x2 && x3 > x1) || (x3 > x2 && x3 < x1)) && ((y3 < y2 && y3 > y1) || (y3 > y2 && y3 < y1))) {
    return true;
  }
  if (((Math.abs(x1-x3))<3) && ((Math.abs(x1-x3) < disttoline))) {
    return true;
  }
  return false;
}

//returns true if point 3 is either between the x or y values of points 1 and 2
public boolean betweenPointsEither(int x1, int y1, int x2, int y2, int x3, int y3) {
  if (((x3 < x2 && x3 > x1) || (x3 > x2 && x3 < x1)) || ((y3 < y2 && y3 > y1) || (y3 > y2 && y3 < y1))) {
    return true;
  }
  if (((Math.abs(x1-x3))<3) && ((Math.abs(x1-x3) < disttoline))) {
    return true;
  }
  return false;
}

//draws the path p using the cities array
public void drawPath(int p) {
  line(cities[paths[p][0]][0], cities[paths[p][0]][1], cities[paths[p][1]][0], cities[paths[p][1]][1]);
}

//accepts the x,y coordinates of two points and a distance, and returns true if they are within the given distance of each other
public boolean withinDist(int x1, int x2, int y1, int y2, int distance) {
  if (sqrt(pow(x1-x2, 2)+pow(y1-y2, 2)) < distance) {//if within distance return true
    return true;
  }
  else return false;//if not within distance return false
}

//returns the number of the city that the point is near and -1 if the point is not near any city
public int nearCity(int x, int y) {
  for (int i = 0; i <= citynum; i++) {
    if (withinDist(x, cities[i][0], y, cities[i][1], disttocity)) {
      return i;
    }
  }
  return -1;
}

//remove the path from the array with the given index p
public void removePath(int p) {
  for (int i = p; i < pathnum-1;i++) {
    paths[i][0] = paths[i+1][0];
    paths[i][1] = paths[i+1][1];
  }
  pathnum--;
}



//when the mouse is pressed if the point is near a city we want to create a line from that city,
//and if a city is already selected, then we want to create a path to that city from the selected one
//if a city is selected and the mouse is pressed far from anything, we want to unselect the city
//if the mouse is pressed over a select line, then we want to remove that path
public void mousePressed() {
  int current = nearCity(mouseX, mouseY);
  if (current > -1) {
    if (pointSelected) {
      paths[pathnum][0] = current;
      paths[pathnum][1] = citySelected;
      pointSelected = false;
      pathnum++;
    }
    else {
      citySelected = current;
      pointSelected = true;
    }
  }
  else {
    if (pointSelected) {
      pointSelected = false;
    }
    else {
      current = onPath(mouseX, mouseY);
      if (current > -1) {
        removePath(current);
      }
    }
  }
}

//setup the dropdown list to look like the other buttons
public void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().set("Set Board");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  for (int i=1;i<12;i++) {
    ddl.addItem("Board "+i, i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

//when the slider is moved, that we want to set its value to closestLine and re-run autogenerate.
public void LineRadius(float val) {
  closestLine = (int)val;
  autoGenerate();
}

//when the slider is moved, that we want to set its value to closestPoint and re-run autogenerate.
public void PointRadius(float val) {
  closestPoint = (int)val;
  autoGenerate();
}

//when the savePaths is called we want to create a .csv file and save the paths to it
public void savePaths() {
  String savePath = selectOutput();  // Opens file chooser
  if (savePath == null) {
  }
  else {
    int loc = savePath.lastIndexOf("\\");
    savePath = savePath.substring(loc+1);
    if (savePath == null) {
    }
    println(savePath);
    output = createWriter(savePath + ".csv");
    for (int i = 0; i < pathnum; i++) {
      output.println(paths[i][0] + "," + paths[i][1]);
    }
    output.flush();
    output.close();
  }
}

//The function autoGenerate creates paths from each point to every other point, if will obey the parameters
//Line Radius and Poin Radius given by the sliders.  It is intended to give the user a place to start so that they
//do not have to manually create ever path from scratch
public void autoGenerate() {
  if (gen) {
    pathnum=0;
    for (int i = citynum;i > 0 ;i--) {//for everypoint we want to connect to all of the points before it(the -1 is because indexes start at 0 not 1
      for (int k = i-1; k>=0;k--) {//now that we are at point i, we want to draw lines to all other points
        if (withinDist(cities[i][0], cities[k][0], cities[i][1], cities[k][1], closestPoint)) {//if the points are close enough together draw it
          if (toClose(cities[i][0], cities[i][1], cities[k][0], cities[k][1])) {//if the line does not go close to another point, add it to the count
            paths[pathnum][0] = i;
            paths[pathnum][1] = k;
            pathnum++;
          }
        }
      }
    }
  }
}

//returns false if the line created by the two points is to close to any city
public boolean toClose(int x1, int y1, int x2, int y2) {
  for (int i = citynum;i >= 0 ;i--) {
    if (x1==cities[i][0] && y1==cities[i][1] || x2==cities[i][0] && y2==cities[i][1]) {//we do not want to check the two points that form
    }//the line, because they are obviously to close to the line
    else {
      if ((pointToLineDistance(x1, y1, x2, y2, cities[i][0], cities[i][1]) < closestLine) && betweenPointsEither(x1, y1, x2, y2, cities[i][0], cities[i][1])) {
        return false;//return false if any point in the array is near the point we are testing
      }
    }
  }
  return true;
}

//this function is called when the drop down list is used to select a board, it then sets the cities to the points given
//by the respective file
public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    int x = (int)theEvent.getGroup().getValue();
    reader = new XlsReader(this, "Board"+ x + ".xls");
    makeCities();
    pathnum=0;
  }
}

//resets the buttons, sliders, and paths
public void reset(int stuff) {//when the reset button is pressed reset the program
  pathnum = 0;
  cp5.get(Toggle.class, "AutoGenerate").setValue(false);
  cp5.get(Slider.class, "PointRadius").setValue(1000);//clear the txt field
  cp5.get(Slider.class, "LineRadius").setValue(0);//clear the txt field
  closestPoint = 1000;//reset the distance the points can be near each other to far away
  closestLine = 0;//reset the distance the lines can be from other points to 0
  //makeCities();
}

//when the toggle button is clicked, we toggle the boolean dictating if the paths are created automatically
public void AutoGenerate(boolean theFlag) {
  gen = theFlag;
}

//when the saveFile button is clicked, we want to save the paths to a .csv file with the savePaths function
public void savefile(int stuff) {
  if (init == true) {
    savePaths();
  }
}


