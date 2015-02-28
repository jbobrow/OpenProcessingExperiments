
/* 
Data representation
intructor: Jer Thorpe
Assignment #3 B
Data set from the Guardian Data Store, export it as a .CSV via Google Spreadsheets, data into Processing.
https://docs.google.com/spreadsheet/ccc?key=0AonYZs4MzlZbdDl2Yno0dndlZFBScnhPQm01NGM5aFE#gid=0
Manuela Donoso
*/
import netscape.javascript.*;
ArrayList<Eclipse> eclipses = new ArrayList();
PImage map;
int margin = 50;
int firstYear, lastYear;
int minLat, maxLat;
int minLong, maxLong;
int index = 0;
int nodeOpacity = 10000;

final static int NODE_SIZE = 15;


void setup() {
  size(1300, 600);
  background(255);
  smooth();
  loadData("solarEclipsesData.csv");

  map = loadImage("map_gray.png");
  map.resize(width-margin, height);
  image(map, 0, 0);
  drawMap();
}



void drawMap() {
  for (int i=0; i<eclipses.size(); i++) {
    Eclipse e = eclipses.get(i);

    int longitude = e.longitude;
    int latitude = e.latitude;

    if (e.type.equals("Total")) {
      fill(0, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*nodeOpacity);
      stroke(0, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*nodeOpacity);
      ellipse(longitude, latitude, NODE_SIZE, NODE_SIZE);
    }
    else if (e.type.equals("Annular")) {
      fill(255, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*nodeOpacity);
      stroke(0, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*nodeOpacity);
      ellipse(longitude, latitude, NODE_SIZE, NODE_SIZE);
    }
    else {
      fill(255, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*nodeOpacity);
      stroke(0, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*nodeOpacity);
      arc(longitude, latitude, NODE_SIZE, NODE_SIZE, 0, PI+HALF_PI, PIE);
    }

    if (i<eclipses.size()-1) {
      Eclipse ne = eclipses.get(i+1);
      drawArc(e, ne);
    }

  }
}


void draw() {
  background(205);
  image(map, 0, 0);
  textSize(9);
  fill(20);
  text("+show all", 1200, 590);

  drawLabels();
  drawMap();
}

void mouseClicked() {
  if(mouseX >= 1200 && mouseY >= 580 && mouseX <= 1200 + 70 && mouseY <= 590 + 50) {
    if(nodeOpacity == 10000){
      nodeOpacity = 255;
    } else {
      nodeOpacity = 10000;
    }
  }
}

void drawLabels() {
  boolean hover = false;
  if (mouseX>width-margin+10 && mouseX<width-10) {
    index = mouseY;
  }

  for (int i=firstYear; i<=lastYear; i++) {
    textSize(8);
    fill(abs((float)(i-firstYear)/(lastYear-firstYear) - (float)index/height)*5000);
    text(str(i), width-margin+10, map(i, firstYear, lastYear, 10, height-10));
  }
}

void loadData(String url) {
  Table t = loadTable(url);
  t.removeTitleRow();
  for (int i=28; i < 249; i++){
    Eclipse eclipse = new Eclipse();
    eclipse.year = t.getInt(i, "Year");
    eclipse.month = t.getString(i, "Month");
    eclipse.date = t.getInt(i, "Date");
    eclipse.type = t.getString(i, "Eclipse type");

    int lat = 0;
    String latitude = t.getString(i, "Lat (deg)");
    if (latitude.endsWith("N"))
      lat = int(latitude.replace("N", ""));
    else
      lat = -1*int(latitude.replace("S", ""));

    eclipse.latitude = (int) map(lat, -90, 90, 0, height);

    int longi = 0;
    String longitude = t.getString(i, "Long (deg");
    if (longitude.endsWith("E"))
      longi = int(longitude.replace("E", ""));
    else
      longi = -1*int(longitude.replace("W", ""));

    eclipse.longitude = (int) map(longi, -180, 180, 0, width-margin);

    eclipses.add(eclipse);
  }
  // Get eclipses boundaries
  firstYear = eclipses.get(0).year;
  lastYear = eclipses.get(eclipses.size()-1).year;
  // minLat = ((Eclipse)Collections.min(eclipses, latitudeOrder)).latitude;
  // maxLat = ((Eclipse)Collections.max(eclipses, latitudeOrder)).latitude;
  // minLong = ((Eclipse)Collections.min(eclipses, longitudeOrder)).longitude;
  // maxLong = ((Eclipse)Collections.max(eclipses, longitudeOrder)).longitude;
  // println("Year [" + firstYear + ", " + lastYear + "]");
  // println("Lat [" + minLat + ", " + maxLat + "]");
  // println("Long [" + minLong + ", " + maxLong + "]");

}

// arrows
void drawArc(Eclipse e, Eclipse ne) {
  noFill();
  stroke(0, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*10000);
  float x1 = e.longitude;
  float y1 = e.latitude;
  float x2 = ne.longitude;
  float y2 = ne.latitude;

  float dx = x2 - x1;
  float dy = y2 - y1;
  float xm = (x1 + x2)/2;
  float ym = (y1 + y2)/2;

  float theta = atan2(dy,dx)+HALF_PI;

  float d = sqrt(dx*dx + dy*dy);
  float xr = d/2*cos(theta)+xm;
  float yr = d/2*sin(theta)+ym;

  float phi = atan2(yr-y2,xr-x2);

  float xd = NODE_SIZE/2*cos(phi);
  float yd = NODE_SIZE/2*sin(phi);

  float xp = NODE_SIZE/2*cos(phi-HALF_PI);
  float yp = NODE_SIZE/2*sin(phi-HALF_PI);

  float a = 10;
  float xa = a*cos(phi+QUARTER_PI);
  float ya = a*sin(phi+QUARTER_PI);

  beginShape(LINES);
  vertex(xa+x2+xd, ya+y2+yd);
  vertex(x2+xd, y2+yd);
  endShape();

  xa = a*cos(phi-QUARTER_PI);
  ya = a*sin(phi-QUARTER_PI);

  beginShape(LINES);
  vertex(xa+x2+xd, ya+y2+yd);
  vertex(x2+xd, y2+yd);
  endShape();

  bezier(x1+xp, y1+yp, x1+xp, y1+yp, xr, yr, x2+xd, y2+yd);

  fill(0, 255-abs((float)(e.year-firstYear)/(lastYear-firstYear) - (float)index/height)*10000);
  text(str(ne.year), x2+NODE_SIZE, y2+NODE_SIZE);
}

import java.util.*;

static final int Jan = 0;
static final int Feb = 1;
static final int Mar = 2;
static final int Apr = 3;
static final int May = 4;
static final int Jun = 5;
static final int Jul = 6;
static final int Aug = 7;
static final int Sep = 8;
static final int Oct = 9;
static final int Nov = 10;
static final int Dic = 11;


class Eclipse {
  
  int year;
  String month;
  int date;
  String type;
  int latitude, longitude;
  

  float toYear(String month) {
  	float m = 0;
  	if (month.equals("Jan")) {
  		m = Jan/12;
  	}
  	else if (month.equals("Feb")) {
  		m = Feb/12;
  	}
  	else if (month.equals("Mar")) {
  		m = Mar/12;
  	}
  	else if (month.equals("Apr")) {
  		m = Apr/12;
  	}
  	else if (month.equals("May")) {
  		m = May/12;
  	}
  	else if (month.equals("Jun")) {
  		m = Jun/12;
  	}
  	else if (month.equals("Jul")) {
  		m = Jul/12;
  	}
  	else if (month.equals("Aug")) {
  		m = Aug/12;
  	}
    else if (month.equals("Sep")) {
  		m = Sep/12;
  	}
  	else if (month.equals("Oct")) {
  		m = Oct/12;
  	}
  	else if (month.equals("Nov")) {
  		m = Nov/12;
  	}
  	else if (month.equals("Dic")) {
  		m = Dic/12;
  	}
  	return m;
  }
};


