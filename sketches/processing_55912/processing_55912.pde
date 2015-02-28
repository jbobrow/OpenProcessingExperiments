
import org.json.*;
import codeanticode.glgraphics.*;
import processing.opengl.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;
PShape logo;


float lat = 37;
float lon = -97;

de.fhpotsdam.unfolding.Map map;

float lon1 = -132.3633;
float lat1 = 14.4347;
float lon2 = -58.3594;
float lat2 = 57.7979;


float time=1;
boolean sortByContinent = false;
String time3;
int date2 = 13;
PFont f;
PFont f2;
Photo[]photos;
Rectangle[] rects = new Rectangle[8];
String[] categoryLabels = {"North America", "South America", "Europe", "Asia", "Eurasia", "Oceania", "Africa", "Middle East"};
boolean allDeselect;

void setup() {

  
  size(1024, 768);
  frameRate(60);
  smooth();
  initMap();
  logo = loadShape("GlobetrotterIdentity11.svg");
  
  f = loadFont("DIN-Medium-12.vlw");
  f2 = loadFont("DIN-Bold-48.vlw");
  
  
  String[]row2 = loadStrings("colors.txt");
  for(int i = 0; i < rects.length; i++) {
    String[] col = (split(row2[i], " "));
    int r = int(col[0]);
    int g = int(col[1]);
    int b = int(col[2]);
    
    float w = 127;
    float x = i*w + i;
    float y = 0;
    color c = color(r, g, b);
    rects[i] = new Rectangle(x, y, c);
  }

  photos = new Photo[587];
  String[] row = loadStrings("data2.txt");
  for(int i = 0; i < photos.length; i++) {
    String[] col = (split(row[i], ","));

    String userName = col[0];
    int farm = int(col[1]);
    int server = int(col[2]);
    String photoId = col[3];
    String secret = col[4];
    float lat = float(col[5]);
    float lon = float(col[6]);
    String country = col[7];
    String continent = col[8];
    int r = int(col[9]);
    int g = int(col[10]);
    int b = int(col[11]);
    float time = float(col[12]);
    float date = float(col[13]);
    color c = color(r,g,b,100);

 
    photos[i] = new Photo(userName, lat, lon, country, continent, c,time,date, farm, server, photoId,secret);
  }
  
}

void draw() {
  background(0);
  map.draw();
  shape(logo,500,65);
  applyFilters();
  
  time3 = convertToTime();
  
  if(date2 < 30) {
  textFont(f2,40);
  textAlign(LEFT);
  fill(135,135,135);
  text("June " + date2 + " " + time3, 50, 660);
  }
  
  rectsDisplay();
  titleDisplay();
  
  for(int i = 0; i < photos.length; i++) {

  if((photos[i].date == date2 && photos[i].time == time) || photos[i].isDisplay==true && photos[i].visible){
        photos[i].display();
        photos[i].isDisplay = true;
      }  
  }
  
  for(int i = 0; i < photos.length; i++) {
    if (photos[i].onMouseOver(mouseX, mouseY)){
      break;
    }
  }
  if(frameCount % 1 ==0) {
    if(time<23.75){
      time = time+0.25;
    } else if(time == 23.75) {
      time = 0;
      date2++;
    }
    
    }
     
  }
  

void initMap() {
  
  // initialize map object. remember to use the full library path (de.fhpotsdam.unfolding.<Method>), as shown below
  map = new de.fhpotsdam.unfolding.Map(this, new OpenStreetMap.CloudmadeProvider("3315df377db2444ab315aa79fd737647", 56274));
  // map = new de.fhpotsdam.unfolding.Map(this, new OpenStreetMap.CloudmadeProvider("eaf00e04b8f5461a89661f98394f8a45", 54996));
  /*
  Sample map providers:
  map = new de.fhpotsdam.unfolding.Map(this, new OpenStreetMap.OpenStreetMapProvider());  //--> OpenStreetMaps
  map = new de.fhpotsdam.unfolding.Map(this, new Microsoft.RoadProvider()); //--> Bing Maps roadmap
  map = new de.fhpotsdam.unfolding.Map(this, new Microsoft.AerialProvider()); //--> Bing Maps satellite imagery
  map = new de.fhpotsdam.unfolding.Map(this, new Yahoo.AerialProvider()); //--> Yahoo satellite imagery
  map = new de.fhpotsdam.unfolding.Map(this, new OpenStreetMap.CloudmadeProvider("<Your Cloudmade API Key>", <Your Map Style ID>)); //--> Use this to make your own maps. Requires API Key. You can get it at http://cloudmade.com
  */
  
  // set the starting location on the map
  de.fhpotsdam.unfolding.geo.Location location = new de.fhpotsdam.unfolding.geo.Location(lat,lon);
  
  // zoom and pan to the starting point on the map
  map.zoomAndPanTo(location, 4); // the number represents the level of detail.
  /*
  Sample levels of detail for the map:
  1 = World
  10 = City
  16 = Neighborhood
  */
  
  /*
  Other map settings you can use:
  map.zoomToLevel(2); // zooms to a specified level of detail
  map.panTo(location); // pans to a specific location
  map.setTweening(true); // animates zooming into the map. tends to be jittery at high levels of detail
  */

  // initialize event dispatcher to register interactions on the map
  MapUtils.createDefaultEventDispatcher(this, map);

}

void titleDisplay() {
  rects[0].title("north america");
  rects[1].title("south america");
  rects[2].title("europe");
  rects[3].title("asia");
  rects[4].title("eurasia");
  rects[5].title("oceania");
  rects[6].title("africa");
  rects[7].title("middle east");
}

void rectsDisplay() {
  for(int i = 0; i < rects.length; i++) {
    rects[i].display();
  
  }

}

void mousePressed() {

  for (int i = 0; i < rects.length; i++) {
    rects[i].onMouseClick(mouseX, mouseY);
    
  }
}

String convertToTime() {
int time2 = (int) time;
float decimal = time - time2;
String minutes;
if(decimal == .25) {
  minutes = "15";
} else if(decimal == .5) {
  minutes = "30";
} else if(decimal == .75) {
  minutes = "45";
} else {
  minutes = "00";
}


  String time3 = time2 + ":" + minutes;
  
return time3;
}


void applyFilters() {
  boolean oneIsSelected = false;
  for(int i = 0; i < rects.length; i++) {
    if (rects[i].selected) {
      oneIsSelected = true;
    }
  }
  

  
  for(int i = 0; i < photos.length; i++) {
    

    
    
    if (oneIsSelected) {
      photos[i].visible = false;
     
      for(int n = 0; n < rects.length; n++ ) {
        String label = categoryLabels[n];
        
       
        
        
        rects[n].fillVariable = false;
        
        for(int t = 0; t < photos.length; t++) {
          if(photos[i].continent.equals(label)) {
            if(rects[n].selected) {
              photos[i].visible = true;
            }
          }
        }
      }
    } else {
      photos[i].visible = true;
    }
  }
  
}
  
  
  


