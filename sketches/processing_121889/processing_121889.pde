
//Hill walking data visualisation

//Array indexes
public static final int X_COORDINATE = 0;
public static final int Y_COORDINATE = 1;

public static final int NUMBER_OF_FIELDS = 5; //Number of variables in the hill information text document

private static final int LINE_HEIGHT = 15;    //The height of a line of text in the text areas

//Map image location, width and height
private static final int MAP_X = 25;
private static final int MAP_Y = 25;
private static final int MAP_WIDTH = 550;
private static final int MAP_HEIGHT = 550;

private static final int TEXT_PADDING = 15;

//Help dialogue location
private static final int HELP_TEXT_X = 10;
private static final int HELP_TEXT_Y = 10;

//Colour definitions
final color COLOUR_OCEAN = color(92, 193, 164); //Turquoise
final color COLOUR_HILL_MARKER = color(209, 8, 8); //Medium red
final color COLOUR_INFOTEXT_BACKGROUND = color(240, 143, 87, 200); //Semi-transparent light orange (Contrasts with the map and ocean)
final color COLOUR_HELPTEXT_BACKGROUND = color(234, 264, 140, 200); //Semi-transparent lime green

//Declare local variables

PImage UK;

//Zoom and pan variables
float zoomScale = 0;
float scaleFactor;
float translateX;
float translateY;

boolean helpVisible;

public int filterTimesClimbed = 0;

void setup()
{
  size(600, 600);
  
  UK = loadImage("UK.png"); //Map of the UK  
  
  resetView();
  prepareMapData(); //Found in "LoadHills"
  
  helpVisible = true; //The help dialogue should be visible when the application starts
}

void draw()
{  
  //Draw a background rectangle to represent the ocean
  stroke(COLOUR_OCEAN);
  fill(COLOUR_OCEAN);
  rect(0, 0, width, height);
  
  pushMatrix(); //Save the current coordinate system

  translate(translateX, translateY); //Pan
  scale(scaleFactor); //Zoom
  
  image(UK, MAP_X, MAP_Y, MAP_WIDTH, MAP_HEIGHT);
  
  stroke(COLOUR_HILL_MARKER);
  fill(COLOUR_HILL_MARKER);
  
  float x, y;
  
  for(int i = 0; i < hills.length; i++)
  {
    hills[i].plotHill();
  }
  
  popMatrix(); //Restore the previous coordinate system (We do not want to scale anything else)
  
  //Prevent details from being shown before the user uses the mouse
  if(mouseX != 0 && mouseY != 0)
  {
    showClosestwHillInfo();
  }
  
  HelpDialogue();
}

void keyPressed()
{
  if(key == 'h' || key == 'H') //Hide/Display the help dialogue when the H key is pressed
  {
      helpVisible = !helpVisible; //Toggle helpVisible by inverting the boolean
  }
  else if(key == 'r' || key == 'R') //Reset the view when the R key is pressed
  {
    resetView();  
  }
  else if(key == '+' || key == '=') //Adjust the No. of times climbed filter when + or - is pressed
  {
    filterTimesClimbed++;
  }
  else if(key == '-' || key == '_')
  {
    if(filterTimesClimbed > 0) //Prevent "filterTimesClimbed" from being negative
    {
      filterTimesClimbed--;
    }
  }
}  

void mouseWheel(MouseEvent event)
{
  //Zoom in/out to the coordinates under the cursor
  scaleFactor -= event.getAmount() / 10;
  
  //Limit zooming out
  if(scaleFactor < 1) 
  {
    resetView();  
  }
  else
  {
    translateX += (event.getAmount() * mouseX) / 10;
    translateY += (event.getAmount() * mouseY) / 10;
  }
}

void mouseDragged(MouseEvent event)
{
  //When the user clicks and drags, pan by the distance that the mouse is moved
  translateX += mouseX - pmouseX;
  translateY += mouseY - pmouseY;
}

//Restores the initial position of the "camera"
void resetView()
{
  scaleFactor = 1; //Default zoom
  translateX = 0;  //Center the map
  translateY = 0;
}

//Show the help dialogue when the user has not toggled it off
void HelpDialogue()
{
  if(helpVisible)
  {
    String[] lines = 
    {
      "Toggle Help: H",
      "Reset View: R",
      "No. times climbed: +/- (" + filterTimesClimbed + " or more)",
      " ",
      "Zoom: Mouse Wheel",
      "Pan: Click & Drag",
      "Hover over a hill marker for more information."
    };
    
    showTextBox(HELP_TEXT_X, HELP_TEXT_Y, lines, COLOUR_HELPTEXT_BACKGROUND);
  }
}

void showClosestwHillInfo()
{
  //Find the distance between every hill and the mouse
  float[] distances = new float[hills.length];
  for(int i = 0; i < hills.length; i++)
  {
    distances[i] = dist(mouseX, mouseY, hills[i].realX, hills[i].realY);
  }
  
  //Find the closest hill to the cursor
  float min = distances[0];
  int index = 0; //Store the index of the closest hil
  for(int i = 0; i < distances.length; i++)
  {
     if(distances[i] < min)
     {
       min = distances[i];
       index = i;
     }
  }
  
  //Show the closest hill's information when the mouse hovers near it and the hill is visible
  if(min < 10 && hills[index].visible)
  {
    String[] lines =
    {
      "Name: " + hills[index].name,
      "Type: " + hills[index].type,
      "Times Climbed: " + hills[index].timesClimbed
    };
    
    //Determine how wide the rectangle needs to be to prevent text overflow
    float rectWidth = getLongestLine(lines);
    
    final float rectHeight = LINE_HEIGHT * (lines.length + 1);
    
    rectWidth += 15; //Ensure that a suitable amount of text padding is visible
    
    //Find a position to draw the rectangle in, relative to the mouse where the whole rectangle will be visible
    //This is to prevent the rectangle from leaving the edge of the application window
    
    //Store the 4 possible sets of x and y offsets
    //2nd dimention stores rectangleX, rectangleY and the x coordinate of the text
    final float[][] possibleOffsets = 
    {
      {10, -50, 20}, //North East of the mouse
      {10, 20, 20},  //South East of the mouse
      {-rectWidth - 10, 20, -rectWidth}, //South West of the mouse
      {-rectWidth - 10, -50, -rectWidth} //North West of the mouse
    };
    
    float rectX = 0, rectY = 0, textPosX = 0;
    
    //Loop through each possible location, checking if it is suitable
    for(int x = 0; x < possibleOffsets.length; x++)
    {
      rectX = mouseX + possibleOffsets[x][0];
      rectY = mouseY + possibleOffsets[x][1];
      textPosX = mouseX + possibleOffsets[x][2];
      
      //if all edges of the rectangle are inside the application's area
      if(isPointVisible(rectX, rectY) && isPointVisible(rectX + rectWidth, rectY + rectHeight))
      {
        break; //Coordinates are suitable, exit the loop
      }
    }
    
    showTextBox(rectX, rectY, lines, COLOUR_INFOTEXT_BACKGROUND);
  }
}

//Returns true when the point can be seen by the user, false when it can't
boolean isPointVisible(float x, float y)
{
  //If the coordinates are within the visible portion of the sketch
  if(x >= 0 && x <= width && y >= 0 && y <= height)
  {
    return true;
  }
  
  return false;
}

//Find the longest line of text in the array using a standard findmax algorithm
float getLongestLine(String[] array)
{
  float maxLength = textWidth(array[0]);
 
  for(int i = 0; i < array.length; i++)
  {
    if(textWidth(array[i]) > maxLength)
    {
      maxLength = textWidth(array[i]);
    }  
  }
  
  return maxLength;
}

//Draws a rectangle with the specified background colour at the specified location
void showTextBox(float x, float y, String[] textLines, color background)
{
  fill(background);
  stroke(background);
  
  //Using the length of the longest line and the number of lines, determine the width and height of the rectangle
  final float rectWidth = getLongestLine(textLines) + TEXT_PADDING;
  final float rectHeight = (LINE_HEIGHT * (textLines.length + 1));
  
  rect(x, y, rectWidth, rectHeight, 10);
  
  stroke(0);
  fill(0);
  
  //Draw each line of information in the correct position
  for(int i = 0; i < textLines.length; i++)
  {
    text(textLines[i], x + (TEXT_PADDING/2), y + (LINE_HEIGHT * (i + 1)));
  }
}
/*
   The database provided contained locations in the form of OS Grid References, in order to display them on
   top of the map image, it was necesary to convert the OS Grid References to latitudes and longditudes
   
   Running the convertOSToLatLong function for every entry in the database (Just under 2000 times) takes over 10 minutes.
   As a 10 minute loading time is not feasible, we converted all of the OS Grid References once then stored them in a text document.
   
   The final text document contains the coordinates of the hills (On the world map), we used an online batch conversion tool to obtain those values.
   Scaling the coordinates using the map() function, we were then able to produce a relatively accurate map.
   The process of plotting the points on a more accurate basis would have involved a lot of complex mathematics.
*/

//The functions in this document were only using during the initial data processing stage

import java.util.regex.Pattern;
import java.util.regex.Matcher;

//Converts the specified OS Grid Reference to latitude and longitude
float[] convertOSToLatLong(String reference)
{
    //Line 93 of the HTML document always contains: <H3>Lat: 57.558866N Long: 5.472034W  in Great Britain
    final int LINE_NO = 93;
  
    float[] coordinates = new float[2];
    String html[] = loadStrings("http://www.nearby.org.uk/coord.cgi?p=" + reference); //Get the HTML code of the OS Grid Reference to Latitude & Longitude conversion page
    
    //Extract the latitude and longitude from the line of HTML code
    String latitude, longitude;
    latitude = findBetween(html[LINE_NO], "Lat: ", "N");
    longitude = findBetween(html[LINE_NO], "Long: ", "W");
    
    //Store the x and y coordinates for use on the map
    coordinates[X_COORDINATE] = parseFloat(latitude);
    coordinates[Y_COORDINATE] = parseFloat(longitude);
    
    return coordinates;
}

//Using a regular expression, return the string between "s1" and "s2" if "search" contains "s1" and "s2"
String findBetween(String search, String s1, String s2)
{
  String result = "Not found";
  
  Matcher matcher = Pattern.compile(s1 + "(.*?)" + s2).matcher(search);
  if(matcher.find())
  {
    result = matcher.group(1);
  }

  return result;
}
//Offsets to increase hill plotting accuracy
private static final int HILL_ADJUST_X = 30;  
private static final int HILL_ADJUST_Y = 10;

//Coordinate ranges of the hills from the database (Used to scale the points to the map)
private static final int MIN_HILL_X = 67800;
private static final int MAX_HILL_X = 580400;
private static final int MIN_HILL_Y = 158600;
private static final int MAX_HILL_Y = 957300;

//Coordinate ranges of the non transparent part of the map (Where the UK can be seen), used to scale the points to the map
private static final int MIN_MAP_X = 137;
private static final int MAX_MAP_X = 478;
private static final int MIN_MAP_Y = 571;
private static final int MAX_MAP_Y = 24;

//Used to store and display information about each hill
public class Hill
{
  //Declare fields
  float xCoordinate, yCoordinate, mapX, mapY, realX, realY;
  String name, type;
  int timesClimbed;
  boolean visible;
  
  public Hill(float x, float y, String setName, String setType, int setTimesClimbed)
  {
    //Initialise fields
    xCoordinate = x;
    yCoordinate = y;
    name = setName;
    type = setType;
    timesClimbed = setTimesClimbed;
  
    visible = true;
  }  
  
  //Displays a marker on the map to represent the hill and stores the coordinates required by showClosestwHillInfo()
  void plotHill()
  {
    visibleCheck(); //Update visibility status of the hill
    
    if(visible) //If the filters dictate that the hill should be visible
    {
      //Find the scaled coordinate at which to display the marker
      mapX = map(xCoordinate, MIN_HILL_X, MAX_HILL_X, MIN_MAP_X, MAX_MAP_X) + HILL_ADJUST_X;
      mapY = map(yCoordinate, MIN_HILL_Y, MAX_HILL_Y, MIN_MAP_Y, MAX_MAP_Y) + HILL_ADJUST_Y; 
      
      //Rectangles maintain their shape better than ellipses at higher zoom levels
      rect(mapX, mapY, 1/scaleFactor, 1/scaleFactor); //Minimum height and width is 1 pixel
      
      //Store the screen coordinates of the hill markers for use with mouse hovering
      realX = screenX(mapX, mapY);
      realY = screenY(mapX, mapY);
    }
  }
  
  //Maintains the visibility status of the hill's marker based on the current filters
  void visibleCheck()
  {
    //Show the hill if it has been climbed as many or more times than "filterTimesClimbed"
    if(timesClimbed >= filterTimesClimbed)
    {
      if(!visible)
      {
        visible = true;
      }
    } 
    else if(visible)
    {
      visible = false;
    }
  }
}
/*
    This file contains the functions necessary to retrieve and format the hill information
*/

import java.io.FileOutputStream;

//Indexes of the hill information
private static final int HILL_COORDINATE_X = 0;
private static final int HILL_COORDINATE_Y = 1;
private static final int HILL_NAME = 2;
private static final int HILL_TYPE = 3;
private static final int HILL_TIMES_CLIMBED = 4;

public Hill[] hills; 

//Fetches the hill information from the text document and prepares the data for use
void prepareMapData()
{
  //Get the contents of the hill information text document
  ArrayList<String> rawData = new ArrayList<String>();
  rawData = readText("Hill Info.txt");
  
  //Parse through the data, storing each field in a separate index
  String[][] hillData = new String[rawData.size()][NUMBER_OF_FIELDS];
  hillData = formatData(rawData);
  
  //If any of the hills do not have a specified value for number of times climbed, assume 0
  for(int i = 0; i < hillData.length; i++)
  {
    if(hillData[i][HILL_TIMES_CLIMBED].length() < 1)
    {
      hillData[i][HILL_TIMES_CLIMBED] = "0";
    }
  }
  
  hills = new Hill[hillData.length];
  
  //Set up each hill
  for(int i = 0; i < hills.length; i++)
  {
    hills[i] = new Hill(parseFloat(hillData[i][HILL_COORDINATE_X]), parseFloat(hillData[i][HILL_COORDINATE_Y]), hillData[i][HILL_NAME], hillData[i][HILL_TYPE], parseInt(hillData[i][HILL_TIMES_CLIMBED]));
  }
}

//Splits the contents of the text document into the individual variables and returns them in a two dimentional array
//Each entry in "lines" should represent a line of text from a text document
String[][] formatData(ArrayList<String> lines)
{
  //Create a 2D array of strings
  //The first dimention represents a hill
  //The second dimention stores information about each of the hills
  String[][] formattedData = new String[lines.size()][NUMBER_OF_FIELDS];
  
  for(int i = 0; i < lines.size(); i++)
  {
    formattedData[i] = split(lines.get(i), "|"); //Split the variables up, storing the information about each hill
  
    for(int x = 0; x < NUMBER_OF_FIELDS; x++)
    {
      formattedData[i][x] = formattedData[i][x].trim(); //Remove any excess spaces from the hill information
    }
  }
  
  return formattedData;
}

//Reads the contents of the specified file and returns an ArrayList containing each line of the text document
ArrayList<String> readText(String fileName)
{
    ArrayList<String> content = new ArrayList<String>();
    String data;
    
    try //Risky code, handle any Input/Output exceptions
    {
      //Prepare a BufferedReader for use with the specified filename
      BufferedReader reader = createReader(fileName);
      
      data = reader.readLine(); //Retrieve the first line of the text document
      
      //Add the contents of each line to the ArrayList until we reach the end of the file
      while(data != null)
      {
          content.add(data);
          data = reader.readLine();
      }
      
      reader.close(); //Close the BufferedReader as it is no longer required
    }
    catch(IOException e)
    {
      println("There was an error attempting to open and read " + fileName);
    }
    
    return content;
}

//Writes the contents of the specified ArrayList to the specified file
//This function was only used during the initial data processing stage
void writeToFile(ArrayList<String> lines, String fileName)
{
   //Prepare a PrintWriter for use with the specified filename
   PrintWriter printWriter = createWriter(fileName);

   //Store every line of the ArrayList in the buffer
   for(int i = 0; i < lines.size(); i++)
   {
       printWriter.println(lines.get(i));
   }
  
   printWriter.flush(); //Write the contents of the buffer to file.
   printWriter.close(); //Close the PrintWriter as it is no longer required.
}


