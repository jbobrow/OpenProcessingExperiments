
// Andrew Herman
// Tuesday, May 4th 
// NMD 102, Scott
// Final Project 

public double longitude = -68.6704; //Sets the starting longitude
public double latitude = 44.9007; //Sets the starting latitude

//Sets what angle the camera is at, what direction its facing, and how far its zoomed in.
public double range = 300; 
public double tilt = 46;
public double heading = 50;

//Directs processing to the Google Earth program
public String googleEarthClient = "C:\\Program Files\\Google\\Google Earth\\client\\GoogleEarth.exe";

//Pulls the font so it can be used.
PFont a;

void setup()
{
  size(500,90); //Sets the size of the screen
  frameRate(1); //Sets the frame rate to one per second
  a = createFont("Arial-Black-16" ,30,true); //Defines the characteristics of the font that will be used.
}

void draw(){
  background(0); //Background color
  textFont(a); //Defines what font will be displayed on screen
  fill(43,101,236); //Text color
  text("Loading Google Earth...", 100,55); //The words that will be displayed on the screen

  try //Will be used with "catch" later to write an exception to the code.
  {
    File localFile = new File("google_earth.kml"); //Creates a new file from the Google Earth KML file
    FileWriter fos = new FileWriter(localFile);
    fos.write(getKML());
    fos.flush();
    fos.close();
    //Pulling all the information needed to run Google Earth
    String command = googleEarthClient + " " + localFile.getCanonicalPath();

    System.out.println(command);

    Process proc = Runtime.getRuntime().exec(command);
  }
  catch(IOException e)//Used with the above "try" statement to create and exception the code
  {
    e.printStackTrace();
  }  
}

String getKML()//Configures the KML code to work in Processing
{
  String kml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
    + "<kml xmlns=\"http://earth.google.com/kml/2.0\">"
    + "<Placemark>"
    + "<description>Andrew Herman's NMD102 Project</description>"
    + "<name>Point A</name>"
    + "<LookAt>"
    + "<longitude>"
    + longitude
    + "</longitude>"
    + "<latitude>"
    + latitude
    + "</latitude>"
    + "<range>"
    + range
    + "</range>"
    + "<tilt>"
    + tilt
    + "</tilt>"
    + "<heading>"
    + heading
    + "</heading>"
    + "</LookAt>"
    + "<visibility>1</visibility>"
    + "<Style>"
    + "<IconStyle>"
    + "<Icon>"
    + "<href>root://icons/palette-3.png</href>"
    + "<x>96</x>"
    + "<y>160</y>"
    + "<w>32</w>"
    + "<h>32</h>"
    + "</Icon>"
    + "</IconStyle>"
    + "</Style>"
    + "<Point>"
    + "<extrude>1</extrude>"
    + "<altitudeMode>relativeToGround</altitudeMode>"
    + "<coordinates>"
    + longitude
    + ","
    + latitude
    + ",0</coordinates>"
    + "</Point>" + "</Placemark>" + "</kml>";
  return kml;

}
void keyPressed() {
  //If the LEFT key is pressed the latitude will increase by 1 Degree
  if(key == CODED){
    if(keyCode == LEFT){
      latitude += 1;
      //If the RIGHT key is pressed the latitude will decrease by 1 Degree
    }
    else if(keyCode == RIGHT){
      latitude -= 1;
      //If the UP key is pressed the longitude will decrease by 1 Degree
    }
    else if(keyCode == UP){
      longitude -= 1;
      //If the DOWN key is pressed the longitude will increase by 1 Degree
    }
    else if(keyCode == DOWN){
      longitude += 1;
    }
  }
}


