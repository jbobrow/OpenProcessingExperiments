
//for graph
import org.gwoptics.*;
//xls reader import
import de.bezier.data.*;
//unfolding import
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;
//mapthing import
import com.reades.mapthing.*;
import net.divbyzero.gpx.*;
import net.divbyzero.gpx.parser.*;
//List
import java.util.List;

//global variables
XlsReader reader;
int back = 2, forth = 3, count = 0;
UnfoldingMap map, map2, map3, currentMap;
float maxPanningDistance = .5; 
int zoom = 15, bg = 2, max, x = 800, year1, year2, year3, year4, year = 4, fill= 255, num;
String name, coed, freshman, yr = "2013";
ArrayList<String> offenses = new ArrayList<String>();
Location location;
PImage img;

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  Location l = new Location(33.77275f, -84.39098f);
  reader = new XlsReader(this, "Book1.xls");
  map = new UnfoldingMap(this, new OpenStreetMap.CloudmadeProvider("4caebacc77f046ce82f6df742be88969", 121979));
  map.zoomAndPanTo(new Location(l), zoom);
  map.setPanningRestriction(new Location(l), maxPanningDistance);

  map2 = new UnfoldingMap(this, new OpenStreetMap.CloudmadeProvider("4caebacc77f046ce82f6df742be88969", 121975));
  map2.zoomAndPanTo(new Location(l), zoom);
  map2.setPanningRestriction(new Location(l), maxPanningDistance);

  map3 = new UnfoldingMap(this, new OpenStreetMap.CloudmadeProvider("4caebacc77f046ce82f6df742be88969", 121977));
  map3.zoomAndPanTo(new Location(l), zoom);
  map3.setPanningRestriction(new Location(l), maxPanningDistance);

  currentMap = map;

  MapUtils.createDefaultEventDispatcher(this, map, map2, map3, currentMap);
}

void draw() {
  background(0);
  currentMap.draw();
  markers(currentMap);
  fill(0, 215);
  rect(550, 0, 300, 600);
  rect(0, 450, 550, 200);
  textSize(32);
  fill(255);
  text("Residential", 575, 50);
  text("Crime", 650, 90);

  if (bg == 1)bg1();
  else if (bg == 2) bg2();
  else if (bg == 3) bg3();
}

void bg1() {
  //animation
}

void bg2() {
  if (location != null) {
    fill(255, 0, 0, fill*10);
    ellipse(mouseX, mouseY, 30, 30);
  }

  fill(255);
  textSize(16);
  text("Residence Hall:", 575, 140);
  text("Max number of residents:", 575, 220);
  textSize(16);
  text("Press Keys 1 - 3 to toggle the maps." + "\n" + "Hover the mouse over points to see how red it glows." + "\n" + "MORE red = MORE incidents.", 25, 490);

  if (name != null) {
    textSize(22);
    text(name, 575, 180);
    text(max, 575, 260);
    image(img, 575, 300, 200, 150);
    //rect(575, 300, 200, 150);
  }
  fill(255);
  rect(25, 560, 60, 30);
  rect(100, 560, 60, 30);
  rect(175, 560, 60, 30);
  rect(245, 560, 60, 30);
  fill(0);
  textSize(16);
  text("2013", 35, 585);
  text("2012", 110, 585);
  text("2011", 185, 585);
  text("2010", 255, 585);
  fill(54, 37, 204);
  if (year == 4) {
    rect(25, 560, 60, 30);
    fill(255);
    text("2013", 35, 585);
  }
  else if (year == 3) {
    rect(100, 560, 60, 30);
    fill(255);
    text("2012", 110, 585);
  }
  else if (year == 2) {
    rect(175, 560, 60, 30);
    fill(255);
    text("2011", 185, 585);
  }
  else if (year == 1) {
    rect(245, 560, 60, 30);
    fill(255);
    text("2010", 255, 585);
  }

  text("Offenses this year: " + "\n" + num, 350, 560);

  /*Location location = map.getLocation(mouseX, mouseY);
   fill(0);
   text(location.getLat() + ", " + location.getLon(), mouseX, mouseY);*/
}

void bg3() {
  while (count < 1) {
    year4 = data(name, 0);
    year3 = data(name, 1);
    year2 = data(name, 2);
    year1 = data(name, 3);
    count++;
  }
  fill(255);
  textSize(16);
  text("Number of Offenses: ", 575, 140);
  text("In 2013: ", 575, 200);
  text("In 2012: ", 575, 260);
  text("In 2011: ", 575, 320);
  text("In 2010: ", 575, 380);
  textSize(20);
  text(offenses.size(), 575, 170);
  text(year4, 575, 230);
  text(year3, 575, 290);
  text(year2, 575, 350);
  text(year1, 575, 410);
  textSize(14);
  String here = "Offenses: ";
  if (offenses.size() > 0) {
    for (int j = 0; j < 10; j++) {
      for (int i = 0; i < offenses.size()-1; i++) {
        here = here + offenses.get(i) + ", ";
      }
      here = here + offenses.get(offenses.size()-1);
      text(here, x, 590);
      here = here + "                                      ";
    }
  }
  x -= 30;
  textSize(16);
  text("Gender: " + coed + "\n" + "Classification: " + freshman, 50, 520);
  rect(635, 500, 80, 40);    
  textSize(22);
  text(name, 50, 500);
  fill(54, 37, 204);
  textSize(18);
  text("Back", 655, 525);
}

int data(String residence, int year) {
  reader.openSheet(year);
  String n;
  reader.firstRow();
  reader.nextRow();
  ArrayList<String> here = new ArrayList<String>();
  down(11);
  while (reader.hasMoreRows ()) {
    n = reader.getString();
    if (n != null && n.contains(residence)) {
      String offense = reader.getString(reader.getRowNum(), 6);
      if (bg == 3) {
        offenses.add(offense);
      }
      here.add(offense);
    }
    reader.nextRow();
    down(11);
  }
  n = reader.getString();
  if (n.contains(residence)) {
    String offense = reader.getString(reader.getRowNum(), 6);
    if (bg==3) {
      offenses.add(offense);
    }
    here.add(offense);
  }
  return here.size();
}

void down(int cellnum) {
  for (int i = 0; i < cellnum; i++) {
    reader.nextCell();
  }
}

void markers(UnfoldingMap m) {
  m.addMarker(new LabeledMarker(new Location(33.779141f, -84.4036289f), "Armstrong", 124, "co-ed", "Freshman", "1.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.771684f, -84.391824f), "Brown", 91, "female", "Freshman", "2.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7789183f, -84.4044292f), "Caldwell", 158, "co-ed", "Freshman", "3.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7795207f, -84.401335f), "Center Street", 352, "co-ed", "Undergrad", "4.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7727947f, -84.3915992f), "Cloudman", 119, "female", "Freshman", "5.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.779914f, -84.403195f), "Crecine", 327, "co-ed", "Undergrad", "6.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7801044f, -84.4051318f), "Eighth St.", 650, "co-ed", "Undergrad", "7.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7742062f, -84.3916555f), "Field", 126, "co-ed", "Freshman", "8.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7782064f, -84.4039692f), "Fitten", 128, "co-ed", "Freshman", "9.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7789342f, -84.4048556f), "Folk", 158, "co-ed", "Freshman", "10.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7752257f, -84.3918059f), "Fourth Street", 96, "co-ed", "Freshman", "11.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7775357f, -84.4040854f), "Freeman", 112, "co-ed", "Freshman", "12.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7786718f, -84.4040385f), "Fulmer", 60, "female", "Undergrad", "13.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.781805f, -84.396329f), "GLC", 347, "co-ed", "Undergrad/Grad", "14.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7741995f, -84.3909431f), "Hanson", 118, "co-ed", "Freshman", "15.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7720802f, -84.3916617f), "Harris", 94, "co-ed", "Undergrad", "16.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.77275f, -84.39098f), "Harrison", 155, "co-ed", "Freshman", "17.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.779137f, -84.4039878f), "Hefner", 114, "co-ed", "Freshman", "18.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7740655f, -84.391305f), "Hopkins", 134, "co-ed", "Freshman", "19.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7721342f, -84.3910113f), "Howell", 123, "co-ed", "Grand Challenges", "20.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7745045f, -84.3913588f), "Matheson", 274, "co-ed", "Freshman", "21.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.776792f, -84.4055984f), "Maulding", 249, "co-ed", "Undergrad", "22.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7700566f, -84.3913137f), "North Ave", 1996, "co-ed", "Undergrad", "23.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7775067f, -84.4048057f), "Sixth St.", 228, "co-ed", "Undergrad", "24.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7716863f, -84.3912564f), "Smith", 295, "male", "Freshman", "25.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.782154f, -84.3961727f), "Tenth & Home", 445, "co-ed", "Grad/Family", "26.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7734257f, -84.390992f), "Towers", 262, "male", "Freshman", "27.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7784352f, -84.4052021f), "ULC", 430, "co-ed", "Undergrad", "28.jpg"));
  m.addMarker(new LabeledMarker(new Location(33.7790938f, -84.4066544f), "Woodruff", 280, "co-ed", "Undergrad", "29.jpg"));
}

void keyPressed() {
  if (key == '1') {
    currentMap = map;
  } 
  else if (key == '2') {
    currentMap = map2;
  } 
  else if (key == '3') {
    currentMap = map3;
  }
}

void mouseMoved() {
  if (bg == 2) {
    for (Marker marker : currentMap.getMarkers()) {
      marker.setSelected(false);
    }
    Marker marker = currentMap.getFirstHitMarker(mouseX, mouseY);
    LabeledMarker m = (LabeledMarker) marker;
    if (marker != null) {
      m.setSelected(true);
      name = m.getName();
      max = m.getMax();
      coed = m.getCoed();
      freshman = m.getFreshman();
      location = m.getLocation();
      m.setColor(255, 255, 255);
      img = loadImage(m.getImage());
      if (year == 4) {
        fill = data(name, 0);
        num = fill;
      }
      else if (year == 3) {
        fill = data(name, 1);
        num = fill;
      }
      else if (year == 2) {
        fill = data(name, 2);
        num = fill;
      }
      else if (year == 1) {
        fill = data(name, 3);
        num = fill;
      }
    }
  }
}

void mousePressed() {
  if (name != null) {
    if (bg == 2) {
      if (mouseX > 25 && mouseX < 85 && mouseY > 560 && mouseY < 590) {
        yr = "2013";
        year = 4;
      }
      else if (mouseX > 100 && mouseX < 160 && mouseY > 560 && mouseY < 590) {
        yr = "2012";
        year = 3;
      }
      else if (mouseX > 175 && mouseX < 235 && mouseY > 560 && mouseY < 590) {
        yr = "2011";
        year = 2;
      }
      else if (mouseX > 245 && mouseX < 305 && mouseY > 560 && mouseY < 590) {
        yr = "2010";
        year = 1;
      }
      else {
        Marker marker = currentMap.getFirstHitMarker(mouseX, mouseY);
        LabeledMarker m = (LabeledMarker) marker;
        if (marker != null) {
          m.setSelected(true);
          m.setColor(255, 255, 255);
          name = m.getName();
          max = m.getMax();
          coed = m.getCoed();
          freshman = m.getFreshman();
          location = m.getLocation();
          fill(255, 0, 0, fill*10);
          ellipse(location.getLat(), location.getLon(), 30, 30);
        }
        bg = forth;
      }
    }
    else if (mouseX > 635 && mouseX < 715 && mouseY > 500 && mouseY < 540) {
      bg = back;
      count = 0;
      offenses.clear();
      x = 800;
    }
  }
}



