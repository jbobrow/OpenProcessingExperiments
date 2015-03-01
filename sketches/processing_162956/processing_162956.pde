
/**
 * An application with a basic interactive map. You can zoom and pan the map.
 */

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

UnfoldingMap map;
Location locationSouthland = new Location(33.3619f, -101.5503f);
Location locationFortworth = new Location(32.7574f, -97.3332f);
Location locationWaxahachie = new Location(32.3997f, -96.8472f);
Location locationArlington = new Location(32.7050f, -97.1228f);
Location locationKennedale = new Location(32.6500f, -97.2181f);
Location locationBurnet = new Location(30.7589f, -98.2264f);
Location locationGeorgetown = new Location(30.6511f, -97.6814f);
Location locationLubbock = new Location(33.5667f, -101.8833f);
Location locationRanger = new Location(32.4700f, -198.6767f);
Location locationGuatemalacity = new Location(14.6133f, -90.5353f);
Location locationAthens = new Location(32.2028f, -95.8492f);
Location locationGrandprairie = new Location(32.7153f, -97.0169f);
Location locationSaginaw = new Location(32.8618f, -97.3666f);
Location locationCresson = new Location(32.5325, -97.6178);
Location locationStephenville = new Location(32.2203f, -98.2136f);
Location locationBrownsboro = new Location(32.3008f, -95.6150f);
Location locationNorthrichlandhills = new Location(32.8556f, -97.2181f);
Location locationAzle = new Location(32.8928f, -97.5367);
Location locationIloilocity = new Location(10.7167f, 122.5667f);
Location locationBowie = new Location(33.5600f, -97.8444f);
Location locationThecolony = new Location(33.0908f, -96.8847f);
Location locationTyler = new Location(32.3500f, -95.3000f);
Location locationJosephine = new Location(33.0611f, -96.3133f);
Location locationProsper = new Location(33.2383f, -96.7908f);
Location locationTomball= new Location(30.0989f, -95.6189f);
Location locationSyracuse = new Location(43.0469f, -76.1444f);
Location locationCottondale = new Location(33.06595f, -97.70475f);
Location locationWeatherford = new Location(32.7592f, -97.7850f);
Location locationDenton = new Location(33.2164f, -97.1292f);
Location locationMansfield = new Location(32.5772f, -97.1267f);
Location locationDallas = new Location(32.7758f, -96.7967f);
Location locationSouthlake = new Location(32.9467f, -97.1453f);
Location locationHurst = new Location(32.8356f, -97.1453f);
Location locationGranbury = new Location(32.4419f, -97.7814f);
Location locationGreenville = new Location(33.1261f, -96.1097f);
Location locationBurleson= new Location(32.5358f, -97.3272);


void setup() {
  size(1800, 1600, P2D);

  map = new UnfoldingMap(this);
 
  MapUtils.createDefaultEventDispatcher(this, map);
}

void draw() {
  map.draw();

  ScreenPosition posSouthland = map.getScreenPosition(locationSouthland);
  fill(0, 200, 0, 100);
  ellipse(posSouthland.x, posSouthland.y, 20, 20);
  ScreenPosition posFortworth = map.getScreenPosition(locationFortworth);
  fill(0, 200, 0, 100);
  ellipse(posFortworth.x, posFortworth.y, 20, 20);
  ScreenPosition posWaxahachie= map.getScreenPosition(locationWaxahachie);
  fill(0, 200, 0, 100);
  ellipse(posWaxahachie.x, posWaxahachie.y, 20, 20);
  ScreenPosition posArlington = map.getScreenPosition(locationArlington);
  fill(0, 200, 0, 100);
  ellipse(posArlington.x, posArlington.y, 20, 20);
  ScreenPosition posKennedale = map.getScreenPosition(locationKennedale);
  fill(0, 200, 0, 100);
  ellipse(posKennedale.x, posKennedale.y, 20, 20);
  ScreenPosition posBurnet = map.getScreenPosition(locationBurnet);
  fill(0, 200, 0, 100);
  ellipse(posBurnet.x, posBurnet.y, 20, 20);
  ScreenPosition posGeorgetown = map.getScreenPosition(locationGeorgetown);
  fill(0, 200, 0, 100);
  ellipse(posGeorgetown.x, posGeorgetown.y, 20, 20);
  ScreenPosition posLubbock = map.getScreenPosition(locationLubbock);
  fill(0, 200, 0, 100);
  ellipse(posLubbock.x, posLubbock.y, 20, 20);
  ScreenPosition posRanger = map.getScreenPosition(locationRanger);
  fill(0, 200, 0, 100);
  ellipse(posRanger.x, posRanger.y, 20, 20);
  ScreenPosition posGuatemalacity = map.getScreenPosition(locationGuatemalacity);
  fill(0, 200, 0, 100);
  ellipse(posGuatemalacity.x, posGuatemalacity.y, 20, 20);
  ScreenPosition posAthens = map.getScreenPosition(locationAthens);
  fill(0, 200, 0, 100);
  ellipse(posAthens.x, posAthens.y, 20, 20);
  ScreenPosition posGrandprairie = map.getScreenPosition(locationGrandprairie);
  fill(0, 200, 0, 100);
  ellipse(posGrandprairie.x, posGrandprairie.y, 20, 20);
  ScreenPosition posSaginaw = map.getScreenPosition(locationSaginaw);
  fill(0, 200, 0, 100);
  ellipse(posSaginaw.x, posSaginaw.y, 20, 20);
  ScreenPosition posCresson = map.getScreenPosition(locationCresson);
  fill(0, 200, 0, 100);
  ellipse(posCresson.x, posCresson.y, 20, 20);
  ScreenPosition posStephenville = map.getScreenPosition(locationStephenville);
  fill(0, 200, 0, 100);
  ellipse(posStephenville.x, posStephenville.y, 20, 20);
  ScreenPosition posBrownsboro = map.getScreenPosition(locationBrownsboro);
  fill(0, 200, 0, 100);
  ellipse(posBrownsboro.x, posBrownsboro.y, 20, 20);
  ScreenPosition posNorthrichlandhills = map.getScreenPosition(locationNorthrichlandhills);
  fill(0, 200, 0, 100);
  ellipse(posNorthrichlandhills.x, posNorthrichlandhills.y, 20, 20);
  ScreenPosition posAzle = map.getScreenPosition(locationAzle);
  fill(0, 200, 0, 100);
  ellipse(posAzle.x, posAzle.y, 20, 20);
  ScreenPosition posIloilocity = map.getScreenPosition(locationIloilocity);
  fill(0, 200, 0, 100);
  ellipse(posIloilocity.x, posIloilocity.y, 20, 20);
  ScreenPosition posBowie = map.getScreenPosition(locationBowie);
  fill(0, 200, 0, 100);
  ellipse(posBowie.x, posBowie.y, 20, 20);
  ScreenPosition posThecolony = map.getScreenPosition(locationThecolony);
  fill(0, 200, 0, 100);
  ellipse(posThecolony.x, posThecolony.y, 20, 20);
  ScreenPosition posTyler = map.getScreenPosition(locationTyler);
  fill(0, 200, 0, 100);
  ellipse(posTyler.x, posTyler.y, 20, 20);
  ScreenPosition posJosephine = map.getScreenPosition(locationJosephine);
  fill(0, 200, 0, 100);
  ellipse(posJosephine.x, posJosephine.y, 20, 20);
  ScreenPosition posProsper= map.getScreenPosition(locationProsper);
  fill(0, 200, 0, 100);
  ellipse(posProsper.x, posProsper.y, 20, 20);
  ScreenPosition posTomball = map.getScreenPosition(locationTomball);
  fill(0, 200, 0, 100);
  ellipse(posTomball.x, posTomball.y, 20, 20);
  ScreenPosition posSyracuse = map.getScreenPosition(locationSyracuse);
  fill(0, 200, 0, 100);
  ellipse(posSyracuse.x, posSyracuse.y, 20, 20);
  ScreenPosition posCottondale = map.getScreenPosition(locationCottondale);
  fill(0, 200, 0, 100);
  ellipse(posCottondale.x, posCottondale.y, 20, 20);
  ScreenPosition posWeatherford = map.getScreenPosition(locationWeatherford);
  fill(0, 200, 0, 100);
  ellipse(posWeatherford.x, posWeatherford.y, 20, 20);
  ScreenPosition posDenton = map.getScreenPosition(locationDenton);
  fill(0, 200, 0, 100);
  ellipse(posDenton.x, posDenton.y, 20, 20);
  ScreenPosition posMansfield = map.getScreenPosition(locationMansfield);
  fill(0, 200, 0, 100);
  ellipse(posMansfield.x, posMansfield.y, 20, 20);
  ScreenPosition posDallas = map.getScreenPosition(locationDallas);
  fill(0, 200, 0, 100);
  ellipse(posDallas.x, posDallas.y, 20, 20);
  ScreenPosition posSouthlake = map.getScreenPosition(locationSouthlake);
  fill(0, 200, 0, 100);
  ellipse(posSouthlake.x, posSouthlake.y, 20, 20);
  ScreenPosition posHurst = map.getScreenPosition(locationHurst);
  fill(0, 200, 0, 100);
  ellipse(posHurst.x, posHurst.y, 20, 20);
  ScreenPosition posGranbury = map.getScreenPosition(locationGranbury);
  fill(0, 200, 0, 100);
  ellipse(posGranbury.x, posGranbury.y, 20, 20);
  ScreenPosition posGreenville = map.getScreenPosition(locationGreenville);
  fill(0, 200, 0, 100);
  ellipse(posGreenville.x, posGreenville.y, 20, 20);
  ScreenPosition posBurleson = map.getScreenPosition(locationBurleson);
  fill(0, 200, 0, 100);
  ellipse(posBurleson.x, posBurleson.y, 20, 20);
  
  
}



