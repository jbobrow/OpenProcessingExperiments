
import netscape.javascript.*;

import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

de.fhpotsdam.unfolding.Map map;

String lines[];
String [][] csv;
int csvWidth=0;

ArrayList Locations;

void setup()
{
  println("1111");
  lines  = loadStrings("18_01_2013.csv");
  //calculate max width of csv file
  for (int i=0; i < lines.length; i++) {
      String [] chars=split(lines[i],',');
      if (chars.length>csvWidth){
      csvWidth=chars.length;
  }
  }

  //create csv array based on # of rows and columns in csv file
  csv = new String [lines.length][csvWidth];
  
  //parse values into 2d array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++){
     csv[i][j]=temp[j];
  }
  }
  
  
  Locations = new ArrayList();
  for (int i = 0; i < lines.length; i++)
  {
    float az   = Float.parseFloat(csv[i][1]);
    float site = Float.parseFloat(csv[i][2]); 
    Locations.add(new Location(az, site));
  }
  size(800, 600, P2D);
  noStroke();

  map = new de.fhpotsdam.unfolding.Map(this);
  map.setTweening(true);
  map.zoomToLevel(3);
  map.panTo(new Location(40f, 8f));
  MapUtils.createDefaultEventDispatcher(this, map);
}

void draw()
{
  background(0);
  map.draw();

  for (int i = 0; i < Locations.size(); i++)
  {
      Location loc = (Location) Locations.get(i); 
      ScreenPosition pos = map.getScreenPosition(loc);
      fill(0, 200, 0, 100);
      ellipse(pos.x, pos.y, 20,20);
  }
  
  
}

