
import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

UnfoldingMap map;

void setup() {
  size(600, 600, GLConstants.GLGRAPHICS);
  map = new UnfoldingMap(this);
  MapUtils.createDefaultEventDispatcher(this, map);
  map.zoomAndPanTo(new Location(56, -4), 7);
}

void draw() {
  background(0);
  map.draw();
  Location location = map.getLocation(mouseX, mouseY);
    fill(0);
    text(location.getLat() + ", " + location.getLon(), mouseX, mouseY);
  
}

