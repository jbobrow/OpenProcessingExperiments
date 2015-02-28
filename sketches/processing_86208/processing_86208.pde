
import codeanticode.glgraphics.*;

import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

UnfoldingMap map;

void setup() {
    size(800, 600, GLConstants.GLGRAPHICS);
    
    map = new UnfoldingMap(this);
    map.zoomAndPanTo(new Location(42.2f, 13.1f), 6);
    map.setTweening(true);
    MapUtils.createDefaultEventDispatcher(this, map);
   //frame.setResizable(true);
}

void draw() {
  background(0);
    map.draw();
    Location location = map.getLocation(mouseX, mouseY);
    fill(0);
    text(location.getLat() + ", " + location.getLon(), mouseX, mouseY);
}

