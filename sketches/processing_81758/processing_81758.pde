
boolean startScreenOn = true;
boolean mapOfTourDate = false;
boolean tourDates = false;

PImage logo;
PImage horse;
PImage eddie;
int i;

import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;

UnfoldingMap map;



Location PalaisOmnisportsdeParisBercy = new Location(48.839112, 2.3794430000000375);
Location FieraMilanoLiveRho = new Location(45.47652, 9.19968);
Location SnowhallParc = new Location(49.24692100, 6.14217300);
Location FesthalleFrankfurt = new Location(50.1117, 8.6508);
Location LudwigErhardAnlage1 = new Location(50.11218, 8.64515);
Location DoningtonPark = new Location(52.8306, 1.3753);
Location Q207Friedrichrichstrasse76 = new Location(52.3052, 13.2321);
Location Sylvesterallee10 = new Location(53.588463, 9.900569);
Location Wallisellenstrasse45 = new Location(47.4105888, 8.5527431);
Location ZiggoDome = new Location(52.314804, 4.936316);
Location Singenerstrasse34  = new Location(47.839062, 8.859797);




// Create point markers for locations

SimplePointMarker PalaisOmnisportsdeParisBercyMarker = new SimplePointMarker(PalaisOmnisportsdeParisBercy);
SimplePointMarker FieraMilanoLiveRhoMarker = new SimplePointMarker(FieraMilanoLiveRho);
SimplePointMarker SnowhallParcMarker = new SimplePointMarker(SnowhallParc);
SimplePointMarker FesthalleFrankfurtMarker = new SimplePointMarker(FesthalleFrankfurt);
SimplePointMarker LudwigErhardAnlage1Marker = new SimplePointMarker(LudwigErhardAnlage1);
SimplePointMarker DoningtonParkMarker = new SimplePointMarker(DoningtonPark);
SimplePointMarker Q207Friedrichrichstrasse76Marker = new SimplePointMarker(Q207Friedrichrichstrasse76);
SimplePointMarker Sylvesterallee10Marker = new SimplePointMarker(Sylvesterallee10);
SimplePointMarker Wallisellenstrasse45Marker = new SimplePointMarker(Wallisellenstrasse45);
SimplePointMarker ZiggoDomeMarker = new SimplePointMarker(ZiggoDome);
SimplePointMarker Singenerstrasse34Marker = new SimplePointMarker(Singenerstrasse34);


// Add markers to the map


void setup() {
  size(800, 600, GLConstants.GLGRAPHICS); 
  map = new UnfoldingMap(this);
  MapUtils.createDefaultEventDispatcher(this, map);

  textFont(createFont("Arial Black", 10));
  

  logo = loadImage("MAIDEN.png");
  horse = loadImage("MAIDEN2.png");

  eddie = loadImage("MAIDEN4.png");
}

void draw() {
  if (startScreenOn == true && mapOfTourDate == false) {
    startScreen();
  }
  if (mapOfTourDate == true && startScreenOn == false) {
    map.draw();
    map.addMarkers(PalaisOmnisportsdeParisBercyMarker, FieraMilanoLiveRhoMarker, SnowhallParcMarker, FesthalleFrankfurtMarker, LudwigErhardAnlage1Marker, DoningtonParkMarker, Q207Friedrichrichstrasse76Marker, Sylvesterallee10Marker, Wallisellenstrasse45Marker, ZiggoDomeMarker, Singenerstrasse34Marker);
    text("PRESS 'E' TO RETURN TO START MENU", 350,10);  
    menuReturn();
  }
  if (tourDates == true && startScreenOn == false && mapOfTourDate == false) {
    tourDates();
    menuReturn();
    tourDatesScarpe();
  }
}

void startScreen()
{
  fill(0, 10);
  rect(0, 0, width, height);
  fill(height/2, 0, i=0);
  while (i<width) text((char)random(height/2), i+=7, (frameCount*7+noise(i)*height*i)%height);


  image(eddie, 50, 30);
  image(logo, 300, 50);
  text("CLICK ON EYES TO START", 320,110);  
  text("LEFT: MAP OF VENUES", 320,140);  
  text("RIGHT: LIST OF DATES AND VENUES", 320,170);  



  if ((mousePressed) &&  (mouseY >= 250) && (mouseY <=330) && (mouseX >= 150) && (mouseX <= 250)) {
    startScreenOn = false;
    tourDates = false;
    mapOfTourDate = true;
  }

  if ((mousePressed) && (mouseY >= 225) && (mouseY <=340) && (mouseX >= 510) && (mouseX <= 630)) {
    startScreenOn = false;
    mapOfTourDate = false;
    tourDates = true;
  }
}
void menuReturn()
{  
  if (keyPressed) {
    if (key == 'e' || key == 'E') {
      mapOfTourDate = false;
      tourDates = false;
      startScreenOn = true;
    }
  }
}
void tourDates()
{
  background(0);
  fill(0, 10);
  image(eddie, 50, 30);
  image(logo, 300, 50);
}

void tourDatesScarpe()
{
  String[] ln = loadStrings("http://www.concertboom.com/iron-maiden/tour-dates/");

  String wholePage="";
  String output="";


  for (int i=0; i<ln.length;i++) {
    wholePage += ln[i];
  }


  String[] date = split(wholePage, "<tr><td class=\"date\">");

  String[] dateEnd1 = split(date[1], "</td>");
  String[] dateEnd2 = split(date[2], "</td>");
  String[] dateEnd3 = split(date[3], "</td>");
  String[] dateEnd4 = split(date[4], "</td>");
  String[] dateEnd5 = split(date[5], "</td>");
  String[] dateEnd6 = split(date[6], "</td>");
  String[] dateEnd7 = split(date[7], "</td>");
  String[] dateEnd8 = split(date[8], "</td>");
  String[] dateEnd9 = split(date[9], "</td>");
  String[] dateEnd10 = split(date[10], "</td>");
  String[] dateEnd11 = split(date[11], "</td>");

  String[] venue = split(wholePage, "<td><div class=\"venue\">");

  String[] venueEnd1 = split(venue[1], "</div>");
  String[] venueEnd2 = split(venue[2], "</div>");
  String[] venueEnd3 = split(venue[3], "</div>");
  String[] venueEnd4 = split(venue[4], "</div>");
  String[] venueEnd5 = split(venue[5], "</div>");
  String[] venueEnd6 = split(venue[6], "</div>");
  String[] venueEnd7 = split(venue[7], "</div>");
  String[] venueEnd8 = split(venue[8], "</div>");
  String[] venueEnd9 = split(venue[9], "</div>");
  String[] venueEnd10 = split(venue[10], "</div>");
  String[] venueEnd11 = split(venue[11], "</div>");


 
  
  fill(255);
  text(dateEnd1[0] + " " + venueEnd1[0],320,200);
  text(dateEnd2[0] + " " + venueEnd2[0],320,215);
  text(dateEnd3[0] + " " + venueEnd3[0],320,230);
  text(dateEnd4[0] + " " + venueEnd4[0],320,245);
  text(dateEnd5[0] + " " + venueEnd5[0],320,260);
  text(dateEnd6[0] + " " + venueEnd6[0],320,275);
  text(dateEnd7[0] + " " + venueEnd7[0],320,290);
  text(dateEnd8[0] + " " + venueEnd8[0],320,305);
  text(dateEnd9[0] + " " + venueEnd9[0],320,320);
  text(dateEnd10[0] + " " + venueEnd10[0],320,335);
  text(dateEnd11[0] + " " + venueEnd11[0],320,350);
  text("PRESS 'E' TO RETURN TO START MENU", 320,380);  
  
  
}


