
/**
 * Watching the evolution of OpenStreetMap mapping in Edinburgh
 * Steven Kay, July 2010
 * Visualizes the timestamps of <node> elements in Openstreetmap data
 * Colour shows age of nodes (blue=old,red=new)
 * Animation has two modes:-
 *   time-based: time advances at a constant rate (default)
 *   data-based: animation simply goes through data at a constant rate
 * Press [SPACE] to toggle the animation mode (restarts the sketch)
 * [Click] to restart
 * Credits:
 * http://www.geofabrik.de/ 
 * © OpenStreetMap contributors, CC-BY-SA
 * http://www.openstreetmap.org/
 * Steve Kay July 2010
 */

String[] lines;
int index = 0;

// bounding box latitude/longitude
float minx=-3.2716;
float maxx=-3.1452;
float miny=55.9236;
float maxy=55.9871;

PFont caption;
Calendar calendar; 
SimpleDateFormat fmt=new SimpleDateFormat("yyyyMMdd");
boolean finished=false;
int mode=0; // 0=linear time,1=linear data

void setup() {
  caption=loadFont("GillSansMT-48.vlw");
  textFont(caption,20.0);
  size(512, 512);
  background(0);
  noStroke();
  lines = loadStrings("embra-hist2.csv"); //pre-processed data
  reset();
}

void mousePressed(){
  reset();
}

void reset() {
  background(0);
  index=0;
  finished=false;
  calendar = new GregorianCalendar(2006,02,05); // first date recorded
}

void keyPressed() {
  if (key==' ') {
    // toggle display mode and restart
    mode=1-mode;
    reset();
  }
}

void draw() {
  if (mode==0) drawByTime();
  if (mode==1) drawByData();
}

void drawByData() {
  
  // Animation advances through data at a fixed rate
  // Shows a smoother animation, but time advances in an irregular way
  
  if (finished) return;  
  String date="";
  for (int i=0;i<4;i++) { // 4 points per frame, change this to alter speed
        
    if (index<lines.length) {
          String[] pieces = split(lines[index], ',');
          if (pieces.length == 3) {
            date=pieces[0];
            float lon = float(pieces[2]);
            float lat = float(pieces[1]);
            float x=(float)(((lon-minx)/(maxx-minx))*width);
            float y=height-(float)(((lat-miny)/(maxy-miny))*height);
            float ii=255.0f*((float)index/(float)lines.length);
            fill(ii,0,255-ii);
            rect(x,y,2,2);
          }
    } else {
      finished=true;
    }
    index = index + 1;  
  }
  fill(0);
  rect(0,0,220,15);
  fill(255);
  text("Edinburgh OSM "+date,5,15);
}

void drawByTime() {
  
  // date advances in linear time, one day per frame
  // not all frames will show activity in this mode, but it gives 
  // a better idea of the ebb and flow of activity
  
  if (finished) return;
  Date d=calendar.getTime();
  String date=fmt.format(d); 
  String dat="";
  fill(0);
  rect(0,0,220,15);
  fill(255);
  text("Edinburgh OSM "+date,5,15);
  
  for (;;) {
    if (index>=lines.length) {
      finished=true;
      break; // finished
    }
    String[] pieces = split(lines[index], ',');
    dat=pieces[0];
    if (dat.startsWith(date)) {
      // show all today's nodes
      float lon = float(pieces[2]);
      float lat = float(pieces[1]);
      float x=(float)(((lon-minx)/(maxx-minx))*width);
      float y=height-(float)(((lat-miny)/(maxy-miny))*height);
      float ii=255.0f*((float)index/(float)lines.length);
      fill(ii,0,255-ii);
      rect(x,y,2,2);
      index+=1;
    } else {
      // wait...
      break;
    }  
  }
  calendar.add(GregorianCalendar.DAY_OF_YEAR,1);    
}

  


