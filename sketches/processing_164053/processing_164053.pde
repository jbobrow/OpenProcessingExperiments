
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
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
UnfoldingMap map;


Location location1 = new Location(37.950795, -91.711944);
Location location2 = new Location(33.986865, -118.47361);
Location location3 = new Location(33.712451, -118.291236);
Location location4 = new Location(34.020379, -118.284674);
Location location5 = new Location(34.022311, -118.284031);
Location location6 = new Location(34.018744, -118.281505);
Location location7 = new Location(34.019752, -118.281476);
Location location8 = new Location(34.062311, -118.307816);
Location location9 = new Location(34.022352, -118.285117);
Location location10 = new Location(34.019726, -118.281493);
Location location11 = new Location(34.027433, -118.288354);
Location location12 = new Location(36.112783, -112.693234);
Location location13 = new Location(36.255218, -112.698047);
Location location14 = new Location(36.049998, -112.12047);
Location location15 = new Location(37.19814, -112.986497);
Location location16 = new Location(33.710562, -118.287544);
Location location17 = new Location(34.020379, -118.284674);
Location location18 = new Location(34.019066, -118.2819);
Location location19 = new Location(34.018152, -118.281293);
Location location20 = new Location(38.652083, -90.29592);
Location location21 = new Location(47.655033, -122.319804);
Location location22 = new Location(47.654286, -122.318905);
Location location23 = new Location(47.648501, -122.348473);
Location location24 = new Location(47.655033, -122.319804);
Location location25 = new Location(47.655335, -122.30352);
Location location26 = new Location(47.656244, -122.315579);
Location location27 = new Location(47.645927, -122.326082);
Location location28 = new Location(47.636209, -122.326061);
Location location29 = new Location(47.655033, -122.319767);
Location location30 = new Location(47.654733, -122.317046);
Location location31 = new Location(47.695677, -122.278172);
Location location32 = new Location(47.654885, -122.319726);
Location location33 = new Location(47.636378, -122.326824);
Location location34 = new Location(48.878717, -121.971866);
Location location35 = new Location(48.536657, -123.020404);
Location location36 = new Location(46.785875, -121.736723);
Location location37 = new Location(48.099371, -123.42588);
Location location38 = new Location(47.653256, -122.317884);
Location location39 = new Location(47.661138, -122.325879);
Location location40 = new Location(43.099655, -124.4304);
Location location41 = new Location(38.335177, -122.322826);
Location location42 = new Location(36.42981, -121.348751);
Location location43 = new Location(34.026898, -118.294042);
Location location44 = new Location(34.025766, -118.294639);


Location [] locations = new Location[44];


boolean move = false;
int locationToDisplay = 0;
int zoomLevel = 15;
PImage img;
int savedTime;
int totalTime = 500;

void setup () {
  size(600, 896, P2D);
  //  map = new UnfoldingMap(this, new Microsoft.AerialProvider(), 0, 0, ((width/4)*3), ((height/4)*3));
  map = new UnfoldingMap(this, 0, 0, width, height, new Microsoft.AerialProvider());
  background (0);
  MapUtils.createDefaultEventDispatcher(this, map);
  img = loadImage("mask.png");

  map.zoomAndPanTo(location1, zoomLevel);
  float maxPanningDistance = 10000; // in km
  map.setPanningRestriction(location1, maxPanningDistance);

  locations[0] = location1;
  locations[1] = location2;
  locations[2] = location3;
  locations[3] = location4;
  locations[4] = location5;
  locations[5] = location6;
  locations[6] = location7;
  locations[7] = location8;
  locations[8] = location9;
  locations[9] = location10;
  locations[10] = location11;
  locations[11] = location12;
  locations[12] = location13;
  locations[13] = location14;
  locations[14] = location15;
  locations[15] = location16;
  locations[16] = location17;
  locations[17] = location18;
  locations[18] = location19;
  locations[19] = location20;
  locations[20] = location21;
  locations[21] = location23;
  locations[22] = location23;
  locations[23] = location24;
  locations[24] = location25;
  locations[25] = location26;
  locations[26] = location27;
  locations[27] = location28;
  locations[28] = location29;
  locations[29] = location30;
  locations[30] = location31;
  locations[31] = location32;
  locations[32] = location33;
  locations[33] = location34;
  locations[34] = location35;
  locations[35] = location36;
  locations[36] = location37;
  locations[37] = location38;
  locations[38] = location39;
  locations[39] = location40;
  locations[40] = location41;
  locations[41] = location42;
  locations[42] = location43;
  locations[43] = location44;
  savedTime = millis();
}

void draw () {
  map.draw();
  // Create point markers for locations
  SimplePointMarker marker1 = new SimplePointMarker(location1);
  SimplePointMarker marker2 = new SimplePointMarker(location2);
  SimplePointMarker marker3 = new SimplePointMarker(location3);
  SimplePointMarker marker4 = new SimplePointMarker(location4);
  SimplePointMarker marker5 = new SimplePointMarker(location5);
  SimplePointMarker marker6 = new SimplePointMarker(location6);
  SimplePointMarker marker7 = new SimplePointMarker(location7);
  SimplePointMarker marker8 = new SimplePointMarker(location8);
  SimplePointMarker marker9 = new SimplePointMarker(location9);
  SimplePointMarker marker10 = new SimplePointMarker(location10);
  SimplePointMarker marker11 = new SimplePointMarker(location11);
  SimplePointMarker marker12 = new SimplePointMarker(location12);
  SimplePointMarker marker13 = new SimplePointMarker(location13);
  SimplePointMarker marker14 = new SimplePointMarker(location14);
  SimplePointMarker marker15 = new SimplePointMarker(location15);
  SimplePointMarker marker16 = new SimplePointMarker(location16);
  SimplePointMarker marker17 = new SimplePointMarker(location17);
  SimplePointMarker marker18 = new SimplePointMarker(location18);
  SimplePointMarker marker19 = new SimplePointMarker(location19);
  SimplePointMarker marker20 = new SimplePointMarker(location20);
  SimplePointMarker marker21 = new SimplePointMarker(location21);
  SimplePointMarker marker22 = new SimplePointMarker(location22);
  SimplePointMarker marker23 = new SimplePointMarker(location23);
  SimplePointMarker marker24 = new SimplePointMarker(location24);
  SimplePointMarker marker25 = new SimplePointMarker(location25);
  SimplePointMarker marker26 = new SimplePointMarker(location26);
  SimplePointMarker marker27 = new SimplePointMarker(location27);
  SimplePointMarker marker28 = new SimplePointMarker(location28);
  SimplePointMarker marker29 = new SimplePointMarker(location29);
  SimplePointMarker marker30 = new SimplePointMarker(location30);
  SimplePointMarker marker31 = new SimplePointMarker(location31);
  SimplePointMarker marker32 = new SimplePointMarker(location32);
  SimplePointMarker marker33 = new SimplePointMarker(location33);
  SimplePointMarker marker34 = new SimplePointMarker(location34);
  SimplePointMarker marker35 = new SimplePointMarker(location35);
  SimplePointMarker marker36 = new SimplePointMarker(location36);
  SimplePointMarker marker37 = new SimplePointMarker(location37);
  SimplePointMarker marker38 = new SimplePointMarker(location38);
  SimplePointMarker marker39 = new SimplePointMarker(location39);
  SimplePointMarker marker40 = new SimplePointMarker(location40);
  SimplePointMarker marker41 = new SimplePointMarker(location41);
  SimplePointMarker marker42 = new SimplePointMarker(location42);
  SimplePointMarker marker43 = new SimplePointMarker(location43);
  SimplePointMarker marker44 = new SimplePointMarker(location44);

  image(img, 0, 0);
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
    zoomToNewLocation();
    savedTime = millis(); // Save the current time to restart the timer!
  }



  //map.addMarkers(marker1, marker2, marker3, marker4, marker5, marker6, marker7, marker8, marker9, marker10, marker11, marker12, marker13, marker14, marker14, marker15, marker16, marker17, marker18, marker19, marker20, marker21, marker22, marker23, marker24, marker25, marker26, marker27, marker28, marker29, marker30, marker31, marker32, marker33, marker34, marker35, marker36, marker37, marker38, marker39, marker40, marker41, marker42, marker43, marker44);
}

void mousePressed() {
  zoomToNewLocation();
}

void zoomToNewLocation () {
  if (locationToDisplay < (locations.length-1)) {
    locationToDisplay++;
  } else {
    locationToDisplay = 0;
  }

  map.zoomAndPanTo(locations[locationToDisplay], zoomLevel); 
  println("zoomed to location: " + locations[locationToDisplay]);
}



