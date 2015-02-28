
/**
 *  
 *  By Prita Priscilla Hasjim
 *  Project for ICAM 102 at UCSD
 *
 **/
 
/**
 *
 * AUTHOR'S NOTE:
 * Due to the fact this art project utilizes live shuttle feeds from
 * around the UCSD area, it can only be viewed Monday thru Friday, 8am
 * to midnight. This is because shuttles only run during these times.
 *
 **/

public static final int screenW = 500; // screen width
public static final int screenH = 700; // screen height

public static final float MIN_LON = -117.255105;  // minimum longitude
public static final float MAX_LON = -117.215623;  // maximum longitude
public static final float LON_DIFF = MAX_LON - MIN_LON;  // difference between max and min longitudes

public static final float MIN_LAT = 32.861276;  // minimum latitude
public static final float MAX_LAT = 32.892272;  // maximum latitude
public static final float LAT_DIFF = MAX_LAT - MIN_LAT;  // difference between max and min latitudes

// all of the different busRoutes
busRoute arriba;
busRoute clockLoop;
busRoute countLoop;
busRoute nobel;
busRoute scripps;
busRoute sanford;
busRoute mesa;

void setup() {
  size(500, 700);
  noStroke();
  smooth();
  
  // loads the values of the different coordinates to the different busRoutes
  arriba = new busRoute(255, 124, 0, "http://www.ucsdbus.com/Route/117/Vehicles");
  clockLoop = new busRoute(255, 209, 0, "http://www.ucsdbus.com/Route/1114/Vehicles");
  countLoop = new busRoute(255, 209, 0, "http://www.ucsdbus.com/Route/1113/Vehicles");
  nobel = new busRoute(12, 91, 174, "http://www.ucsdbus.com/Route/115/Vehicles");
  scripps = new busRoute(117, 152, 196, "http://www.ucsdbus.com/Route/1206/Vehicles");
  sanford = new busRoute(245, 101, 210, "http://www.ucsdbus.com/Route/1188/Vehicles");
  mesa = new busRoute(136, 48, 100, "http://www.ucsdbus.com/Route/1143/Vehicles");
}


void draw(){
  fill(255, 255, 255, 40); // Background color
  rect(0, 0, width, height);
  
  arriba.setupRoute();
  arriba.drawRoute();
  
  clockLoop.setupRoute();
  clockLoop.drawRoute();
  
  countLoop.setupRoute();
  countLoop.drawRoute();
  
  nobel.setupRoute();
  nobel.drawRoute();
  
  scripps.setupRoute();
  scripps.drawRoute();
  
  sanford.setupRoute();
  sanford.drawRoute();
  
  mesa.setupRoute();
  mesa.drawRoute();

}
/**
 *
 * AUTHOR'S NOTE:
 * Due to the fact this art project utilizes live shuttle feeds from
 * around the UCSD area, it can only be viewed Monday thru Friday, 8am
 * to midnight. This is because shuttles only run during these times.
 *
 **/

class busRoute{
  // String that will contain the link to the RSS Feed
  String lnk;

  // Circular array of coordinates for the different buses 
  String coords[] = {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""};
  
  // Counts what index we are in when parsing through coords[]
  int coordsCt;
  
  // ArrayList of substrings found in RSS containg information about the different
  // busses running in this route (amt of people on the bus, old coordinates, new coordinates).
  // The size of busses is the number of busses on that route.
  String[] busses = {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""};;
                          
  // Max number of busses
  int numBusses;
  
  // ints that will represent the color of the busRoute
  int r;
  int g;
  int b;
  
  // default radius of the circle
  int radius = 25;
  int currR = 25;

  int op = 50; // current opacity
  
  // if the route is not running, then this value will be a 1
  // otherwise, if the route is running, this value will be a 0
  int notRunning;
 
  /**
  * Constructor that sets all the variables in a class busRoute to NULL
  */ 
  busRoute(int r, int g, int b, String lnk){
    this.r = r;
    this.g = g;
    this.b = b;

    this.lnk = lnk;

    coordsCt = 0;
    numBusses = 0;
    notRunning = 0;
  }
  
  
  
  /**
   * setupRoute() sets up the data for the route
   */
  void setupRoute(){
    // Resets the numBusses
    numBusses = 0;
    
    // String array containing the shuttle times  
    String RSS[] = loadStrings(this.lnk);
    
    // String of the actual RSS
    String route = RSS[0];
    
    // If that current bus route isn't running right now, return early
    if(route == "[]"){
      notRunning = 1;
      return;
    }
    
    // Parses through the string of the actual RSS
    for(int j = 0; j < route.length(); j++){
      // Looks for the term "ID" and adds the substring starting at that point to busses
      if(route.charAt(j) == 'I' && route.charAt(j + 1) == 'D'){
        busses[numBusses] = route.substring(j);
        numBusses++;
      }
    }
    
  
    for(int k = 0; k < numBusses; k++){
      // Current string being examined
      String curr = busses[k];
      String percent = curr.substring(curr.indexOf("APCPercentage")+15, curr.indexOf(",\"Icon"));
      String lat = curr.substring(curr.indexOf("Latitude")+10, curr.indexOf(",\"Long"));
      String lon = curr.substring(curr.indexOf("Longitude")+11, curr.indexOf(",\"Coord"));
      
      // When we reach the end of the array, we will start rewriting from the beginning
      // of the array
      if(coordsCt == coords.length)
        coordsCt = 0;
        
      coords[coordsCt] = percent + "," + lat + "," + lon;
      coordsCt++;
      
    }
    
  } // end setup
  
  
  
  /**
   * drawRoute() interprets and draws the data for the route
   */
  void drawRoute(){
    // first checks if the route is running
    if(notRunning != 1){
        for(int i = 0; i < numBusses; i++){
          
          // if any of these values ever reach an invalid number, then we must break out of the for-loop
          // early in order to dodge an out of bounds excep
          if( ((coordsCt - i - 1) < 0) || (coords[coordsCt - i - 1].indexOf(",") < 0)
              || (coords[coordsCt - i - 1].indexOf(",-1") < 0) ){
                
              break;
          }
          
          String percent = coords[coordsCt - i - 1].substring(0, coords[coordsCt - i - 1].indexOf(","));
          
          String busLat = coords[coordsCt - i - 1].substring(coords[coordsCt - i - 1].indexOf(",") + 1,
                                                             coords[coordsCt - i - 1].indexOf(",-1"));
                                                             
          String busLon = coords[coordsCt - i - 1].substring(coords[coordsCt - i - 1].indexOf(",-1") + 1,
                                                             coords[coordsCt - i - 1].length());
          
          float floatPerc = Float.valueOf(percent);
          float floatLat = Float.valueOf(busLat);
          float floatLon = Float.valueOf(busLon);
                                                                    
          // the print statement below prints out the index, percentage full, latitude, and longitude
          // println((coordsCt - i - 1) + "\t" + percent + "\t" + busLat + "\t" + busLon);
          // println((coordsCt - i - 1) + "\t" + floatPerc + "\t" + findY(floatLat) + "\t" + findX(floatLon));
          
          currR = radius + (int)floatPerc;

          fill(r, g, b, 50);
          ellipse( findX(floatLon), findY(floatLat), currR, currR );
          //ellipse( findX(floatLon), findY(floatLat), 15, 15 );

      } // end for loop
    }
  } // end draw
  
  
  
  /**
   * findX() returns the X coordinate depending on the longitude
   */
  int findX(float lon){
    float x = (lon - MAX_LON) / (LON_DIFF);
    x = abs(x * screenW);
    x = screenW - x;
    return (int)x;
    
  } // end findX
  
  
  
  /**
   * findY() returns the Y coordinate depending on the latitude
   */
  int findY(float lat){
    float y = (lat - MAX_LAT) / (LAT_DIFF);
    y = abs(y * screenH);
    return (int)y;
    
  } // end findY
  
  
} // end class busRoute


