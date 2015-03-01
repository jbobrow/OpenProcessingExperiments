
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

UnfoldingMap map;
//could not get the U.S. locations to register for some reason

Location locationSchweinfurt = new Location(50.1f, 10.2f);
Location locationOrlando = new Location(28.4f, 81.2f);
Location locationGarmisch = new Location(47.5f, 11.0f);
Location locationRome = new Location(41.9f, 12.5f);
Location locationSavannah = new Location(32.1f, 81.1f);
Location locationPensacola = new Location(30.4f, 87.2f);
Location locationNappyValley = new Location(38.5f, 122.3f);
Location locationOceanSide = new Location(33.2f, 117.3f);
Location locationDisneyland = new Location(33.8f, 117.9f);
Location locationTwinFalls = new Location(42.6f, 114.5f);
Location locationSunValley = new Location(43.7f, 114.3f);
Location locationDenver = new Location(39.7f, 104.9f);
Location locationGlendwoodSprings = new Location(39.5f, 107.3f);
Location locationNewYorkCity = new Location(40.7f, 74.0f);
Location locationWestPoint = new Location(41.4f, 74.1f);
Location locationBemusPoint = new Location(42.2f, 79.4f);
Location locationErie = new Location(42.2f, 80.1f);
Location locationNiagaraFalls = new Location(43.1f, 79.1f);
Location locationDC = new Location(40f, 77.0f);
Location locationPhoenix = new Location(33.5f, 112.1f);
Location locationSanDiego = new Location(32.7f, 117.2f);
Location locationFortSill = new Location(34.7f, 98.5f);
Location locationDachau = new Location(48.3f, 11.4f);
Location locationBamberg = new Location(49.9f, 10.9f);
Location locationFrankfurt = new Location(50.1f, 8.7f);
Location locationWurzburg = new Location(49.8f, 9.9f);
Location locationMunich = new Location(48.1f, 11.6f);



public void setup() {
  size(800, 600, P2D);
  noStroke();

  map = new UnfoldingMap(this);
  map.setTweening(true);
  map.zoomToLevel(3);
  map.panTo(new Location(40f, 8f));
  MapUtils.createDefaultEventDispatcher(this, map);
}

public void draw() {
  background(0);
  map.draw();
  // Zoom dependent marker size
  ScreenPosition posRome = map.getScreenPosition(locationRome);
  fill(200, 0, 0, 100);
  float s = map.getZoom();
  ellipse(posRome.x, posRome.y, s, s);
  
  ScreenPosition posSchweinfurt = map.getScreenPosition(locationSchweinfurt);
  fill(200, 0, 0, 100);
  ellipse(posSchweinfurt.x, posSchweinfurt.y, s, s);
  
  ScreenPosition posDachau = map.getScreenPosition(locationDachau);
  fill(200, 0, 0, 100);
  ellipse(posDachau.x, posDachau.y, s, s);
  
  ScreenPosition posGarmisch= map.getScreenPosition(locationGarmisch);
  fill(200, 0, 0, 100);
  ellipse(posGarmisch.x, posGarmisch.y, s, s);
  
  ScreenPosition posBamberg = map.getScreenPosition(locationBamberg);
  fill(200, 0, 0, 100);
  ellipse(posBamberg.x, posBamberg.y, s, s);
  
  ScreenPosition posFrankfurt= map.getScreenPosition(locationFrankfurt);
  fill(200, 0, 0, 100);
  ellipse(posFrankfurt.x, posFrankfurt.y, s, s);
  
  ScreenPosition posWurzburg= map.getScreenPosition(locationWurzburg);
  fill(200, 0, 0, 100);
  ellipse(posWurzburg.x, posWurzburg.y, s, s);
  
  ScreenPosition posMunich= map.getScreenPosition(locationMunich);
  fill(200, 0, 0, 100);
  ellipse(posMunich.x, posMunich.y, s, s);
 

  
}




