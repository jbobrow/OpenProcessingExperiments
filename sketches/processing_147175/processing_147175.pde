
//Stephen Campbell data plotting application.
//To change the data, edit basicdata.txt.

//Variables
String points[];
float x[];
float y[];
String fields[];
float values[];
int l, r, t, b;
int pointdiameter = 15; //Point diameter in pixels.
PFont font;

void setup()
{
  size(640, 480); //Set screen size to 640x480.
  noLoop();
  
  //Create coordinates for the graph's size.
  l = 40;
  r = width-10;
  b = height-10;
  t = 40;
  
  points = loadStrings("basicdata.txt"); //Read data to an array of strings.
  points = subset(points, 6); //Trim off the first 5 lines, the data starts on line 6.
  points = trim(points); //Remove whitespace from beginning and end.
  x = new float[points.length]; //Allocate space to store the data so it can be plotted.
  y = new float[points.length]; //Do the same for the Y axis.

  for(int i = 0; i < points.length; i++) //For each line...
  {
    fields = splitTokens(points[i]); //...Split the numbers by whitespace.
    values = float(fields);
    x[i] = values[0];
    y[i] = values[1];
    println(x[i]+", "+y[i]);
  }
  
  //Load font from data folder.
  font = loadFont("Ubuntu-20.vlw");
  
}

void draw()
{
  background(200, 200, 200);
  
  //Axis labels
  pushMatrix();
  translate(25,height/2);
  textFont(font,20);
  fill(0);
  rotate(-HALF_PI);
  text("X axis",0,0);
  popMatrix();
  
  text("Y axis",width/2,25);
  
  //Background rectangle
  stroke(0);
  fill(255);
  rectMode(CORNERS); //Set rectangle to use corner coordinates for its size.
  rect(t,l,r,b); //Draw rectangle.

  for(int i = 0; i < x.length; i++)
  {
    float point_x = map(i,0,x.length,l+10,r-10);
    float pMax = max(x);
    float pMin = min(x);
    float point_y = map(y[i],pMin,pMax,b-10,t+10);
    line(point_x, point_y, point_x, b);
    fill(100,180,220);
    ellipse(point_x, point_y, pointdiameter, pointdiameter);

  }
}


