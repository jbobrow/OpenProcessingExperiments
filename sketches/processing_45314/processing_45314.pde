
/*
AC11004 - Group 9 - Week 8 Project.

Brief - Develop a 2D Data Visualisation with user interaction if possible.

Developers:

Duncan Hamilton
Robert Mason
Martina Peeva

*/



//Reference variables
BufferedReader reader;
String line;
ArrayList gridAndMag;
PFont fontA;
PImage backgroundmap;


void setup() {
  //Initialise variables
  boolean done=false;
  fontA = loadFont("Arial-ItalicMT-12.vlw");
  backgroundmap = loadImage("mapbackOP.jpg");
  size (900, 450);
  gridAndMag = new ArrayList();//Creates a new Array of Objects. Dynamic in size so dont have to set initial size as with conventional arrays.
  
  /*Following code segment extracted and modified from the processing
   reference library for reading a .CSV file.
   URL: http://processing.org/reference/BufferedReader.html
   */

  // Open the file from the createWriter() example
  reader = createReader("earthquakes.csv");//Opens up our .CSV file.  

  //If next statement fails, rather than throwing an error it jumps to the following "Catch" statement.
  try {
    line = reader.readLine();//Sets "line" to equal the first row of our file.
  }
  //If nothing is found in the "try" method, the catch is called and the line is set to NULL.
  catch (IOException e) {
    e.printStackTrace();
    line = null;
 }
  

   while (!done) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty.
      done=true;
    } 

    else {
      //Goes through our "line" read from the file and assigns each column a name called pieces.
      //So column 1 in our spreadsheet is now referenced in our program as pieces[0], column 2 = pieces[1]... etc...
      String[] pieces = split(line, ",");

      float x = float(pieces[1]);//Sets x to be the value in column 2 (Longnitude).
      x= (float)map(x, -180, 180, 0, width);//Maps Longnitude to our canvas size.
      float y = float(pieces[0]);//Sets y to be the value in column 1 (Latitude).
      y= (float)map(y, 90, -90, 0, height);//Maps Latitude to our canvas size.
      float m = float(pieces[2]);//Sets m to value in column 3 (Magnitude).
      String loc = (pieces[5]);//Sets loc to value in column 6 (Location).
      String date = (pieces[6]);//Sets date to value in column 3 (Date and Time).
      gridAndMag.add(new eq(x, y, m, loc, date));//Adds a new object of class "eq" to the array "gridAndMag" with the parameters read from the .CSV file.
    }
  }
}

//Draws our fancy world map, draws the earthquake ellipses on screen and calls the hover function.
void draw() {
  //Initialise variables
  int i =0;
  
  background(backgroundmap);
  textFont(fontA, 12);
  fill(255);

  text("Earthquakes from the last 7 days - Hover over a point to see details  ->", 10, 10);
  text("Magnitude is shown at pointer. Full details are printed at the bottom of screen.", 400, 10);
  

  stroke(255);//White border for our earthquakes

  /*
  Loop to go through our Array of earthquakes, up to the max size of the array.
  Sets "p" to a new Earthquake at position "i" in the array. 
  Then calls the get functions of class eq to get the x, y, magnitude so the ellipse can be drawn to represent the Earthquake.
  */
 
  for  (i=0;  i<gridAndMag.size(); i++) {

    eq p = (eq) gridAndMag.get(i);//Makes a new instance of class "eq" called "p" and sets its data to what is stored in position "i" of the array.

    stroke(255);
    fill(p.getM()*70, p.getM()*40, 60);
    ellipse(p.getX(), p.getY(), ((p.getM())*2), ((p.getM())*2));//Draws our "Earthquake", the higher the magnitude, the bigger the ellipse.

    p.hover();//User interaction method call.
  }
}

//Class for our "Earthquakes", setters and getters for X and Y, Magnitude and Location.
class eq {
  //Initilise variables for class eq
  float x;
  float y;
  float m;
  String loc;
  String date;

/*
  Method that recieves parameters from our Array when a new Earthquake (eq) is created.
   "Gets" the x, y , magnitude and location from the Array Object creation in the setup function.
*/

  public eq(float x, float y, float m, String loc, String date) {
    this.x=x;
    this.y=y;
    this.m=m;
    this.loc=loc;
    this.date=date;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getM() {
    return m;
  }

  public String getLoc() {
    return loc;
  }

  public String getDate() {
    return date;
  }
 
/*
   Method to allow user interaction using the mouse.
   Displays the Magnitude, Location and Time of the earthquake
   at the bottom of the screen if the user hovers over a point with the mouse.
   Also displays the Magnitude at the mouse pointer location.
*/
  void hover() {
    float distance = dist(mouseX, mouseY, x, y); 
    if (distance < 2) {
      fill(255, 0, 0);
      text(m, mouseX, mouseY+30);
      fill(0);
      text("Magnitude: " + m, 10, 440);
      text("Location: " + loc, 120, 440);
      text("Date and Time: " + date, 450, 440);
    }
  }
}


