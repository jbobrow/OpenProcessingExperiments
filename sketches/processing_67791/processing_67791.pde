

//The variable to store the image we are working with
PImage b;

//An array of x,y values that will be our points
int[][] points = new int[35][2];
//A variable to count the number of points so that the program does not attempt to index beyond the array
public int numPoints = 0;
//A variable to count the number of lines so that we can 
int lineNum = 0;

//A font variable so that we can make a font to use when writing text on the image.
PFont font;
//The button and text field library
import controlP5.*;
//Button and text field variable
public ControlP5 cp5;
//A varaible that controls how far is the farthest point that each point tries to connect to
public int closestPoint = 10000;
//A variable that controls how close the lines can go to other points
public int closestLine = 0;

void setup()
{
  size(900, 500);//make the window
  background(102);
  smooth();
  stroke(255);
  b = loadImage("Picture201289123831.jpg");//import the image
  image(b, 0, 0);
  font = loadFont("TheSerif-Plain-96.vlw"); //import the font
  textFont(font, 26); 

  cp5 = new ControlP5(this);//make a button and text field controller

  cp5.addTextfield("PointRadius")//add a text field for the point radius
    .setPosition(650, 100)
      .setSize(100, 40)
        .setFont(createFont("arial", 20))
          .setAutoClear(false)
            ;

  cp5.addTextfield("LineRadius")//add a text field for the line radius
    .setPosition(650, 160)
      .setSize(100, 40)
        .setFont(createFont("arial", 20))
          .setAutoClear(false)
            ;

  cp5.addButton("Picture1")//add a button to switch to the first image
    .setValue(0)
      .setPosition(650, 220)
        .setSize(100, 19)
          ;

  cp5.addButton("Picture2")//add a button to switch to the second image
    .setValue(0)
      .setPosition(650, 240)
        .setSize(100, 19)
          ;

  cp5.addButton("reset")//add a button to start the whole program over
    .setValue(0)
      .setPosition(650, 300)
        .setSize(100, 19)
          ;
}


void draw() 
{
  stroke(102);
  fill(102);
  rect(0,0,625,600);
  image(b, 0, 0);
  fill(255, 35, 0);
  for (int i = numPoints-1;i > 0 ;i--) {//for everypoint we want to connect to all of the points before it(the -1 is because indexes start at 0 not 1
    for (int k = i-1; k>=0;k--) {//now that we are at point i, we want to draw lines to all other points
      if (withinDist(points[i][0], points[k][0], points[i][1], points[k][1], closestPoint)) {//if the points are close enough together draw it
        if (midPointTest(points[i][0], points[k][0], points[i][1], points[k][1])) {//if the line does not go close to another point, add it to the count
          stroke(128, 0, 255);
          lineNum++;
        }
        else {
          stroke(128, 100, 100); //if the line does go to close to another point, do not count it and make it red
        }
        line(points[i][0], points[i][1], points[k][0], points[k][1]);//draw lines that are short enough
      }
    }
  }
  stroke(128, 0, 255); 
  for (int i = numPoints-1;i >= 0 ;i--) {//draw every point
    ellipse(points[i][0], points[i][1], 10, 10);
  }
  text(lineNum + " lines", 30, 60);//display on the screen the total number of non-red lines
  lineNum = 0;//reset the number of lines for the next time draw is called
}

//accepts the x,y coordinates of two points and a distance, and returns true if they are within the given distance of each other
public boolean withinDist(int x1, int x2, int y1, int y2, int distance) {
  if (sqrt(pow(x1-x2, 2)+pow(y1-y2, 2)) < distance) {//if within distance return true
    return true;
  }
  else return false;//if not within distance return false
}

//creates 7 points along the line between the two given points x and y values, and if any other point in the array
//is within the lineradius, then this function will return false, if every point is far enough away, then it will return true
public boolean midPointTest(int xa, int xb, int ya, int yb) {
  int[][] tests = new int[7][2];
  tests[0][0] = midPoint(xa, xb);//middle
  tests[0][1] = midPoint(ya, yb);
  tests[1][0] = midPoint(xa, tests[0][0]);//left quarter
  tests[1][1] = midPoint(ya, tests[0][1]);
  tests[2][0] = midPoint(tests[0][0], xb);//right quarter
  tests[2][1] = midPoint(tests[0][1], yb);
  tests[3][0] = midPoint(xa, tests[1][0]);//left most
  tests[3][1] = midPoint(ya, tests[1][1]);
  tests[4][0] = midPoint(tests[2][0], xb);//right most
  tests[4][1] = midPoint(tests[2][1], yb);
  tests[5][0] = midPoint(tests[0][0], tests[1][0]);//left mid
  tests[5][1] = midPoint(tests[0][1], tests[1][1]);
  tests[6][0] = midPoint(tests[0][0], tests[2][0]);//right mid
  tests[6][1] = midPoint(tests[0][1], tests[2][1]);
  for (int i = numPoints-1;i >= 0 ;i--) {
    if (xa==points[i][0] && ya==points[i][1] || xb==points[i][0] && yb==points[i][1]) {//we do not want to check the two points that form
    }//the line, because they are obviously to close to the line
    else {
      for (int k = 6;k>=0;k--) {//check all 7 points that we created along the line
        if (withinDist(tests[k][0], points[i][0], tests[k][1], points[i][1], closestLine)) {
          return false;//return false if any point in the array is near the point we are testing
        }
      }
    }
  }
  return true;//if every point passed, return true
}

//takes two values in the same dimension and return the value between those two.
//this is used to create the midpoint between two points by running this function on the x then y values of those points
public int midPoint(int x1, int x2) {
  return x2+((x1-x2)/2);
}


//When the mouse is clicked, add a point at that location untill the array of points is full
public void mousePressed() {
  if (numPoints < 35 && mouseX < 625) {// if the click was on the image and there is space in the array
    println(mouseX);
    println(mouseY);
    points[numPoints][0] = mouseX;//set the x and y into the array making a point
    points[numPoints][1] = mouseY;
    numPoints++;//add 1 to the point counter
    println(numPoints);
  }
}

public void PointRadius(String theText) {//when a pointradius is entered, set the variable to the given number
  closestPoint = Integer.valueOf(theText);
}

public void LineRadius(String theText) {//when a lineradius is entered, set the variable to the given number
  closestLine = Integer.valueOf(theText);
}

public void Picture1(int stuff) {//when the picture one button is pressed upload that image and reset the program
  b = loadImage("Picture201289123831.jpg");
  reset(1);
}

public void Picture2(int stuff) {//when the picture two button is pressed upload that image and reset the program
  b = loadImage("Picture201289143532.jpg");
  reset(1);
}

public void reset(int stuff) {//when the reset button is pressed reset the program
  numPoints = 0;//reset the number of points
  cp5.get(Textfield.class, "PointRadius").clear();//clear the txt field
  cp5.get(Textfield.class, "LineRadius").clear();//clear the txt field
  closestPoint = 10000;//reset the distance the points can be near each other to far away
  closestLine = 0;//reset the distance the lines can be from other points to 0
}


