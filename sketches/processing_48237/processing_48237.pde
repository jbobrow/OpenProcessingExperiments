
XMLElement stationsXML;
int childCnt = 0, currChild = 0;
boolean bNOAAConnect = false, bGotStations = false;
ArrayList stations;
float maxTemp = 9999.0, minTemp = 9999.0;
boolean bAll = true; // true=all 50, false=just lower 48

void setup() {
  size(700, 500);
  smooth();
  stations = new ArrayList();
  stroke(0);
  colorMode(HSB, 210);
  textSize(9);
}

void mousePressed() {
  bAll = !bAll;
}

void draw() {
  background(0, 0, 100);
  if (!bGotStations) gatherData();
  drawScale();
  drawTemps(true); // (glow effect)
  drawTemps(false);
}

void drawTemps(boolean bFuzzy) { 
  for (int i=stations.size()-1; i>0; i--) {
    station s = (station) stations.get(i);
    if (s.longitude != 0 && s.latitude != 0) {
      float x, y;
      if (bAll) {
        x = (s.longitude+170)*5.3; //all 50
        y = (75-s.latitude)*6.6667;
      } 
      else {
        x = (s.longitude+128)*9.5; //just the lower 48...
        y = (50-s.latitude)*14+25;
      }
      if (s.tempF < 9999.0) {
        if (bFuzzy) {
          fill((1-(s.tempF-minTemp)/(maxTemp-minTemp))*140, 255, 255, 10);
          noStroke();
          if (bAll) ellipse(x, y, 50, 50);
          else ellipse(x, y, 200, 200);
        } 
        else {
          stroke((1-(s.tempF-minTemp)/(maxTemp-minTemp))*140, 255, 255);
          point(x, y);
        }
      }
    }
  }
}

void drawScale() {
  for (int i=0; i<140; i++) {
   stroke(i, 255, 130);
    line(width-50, i+140, width-35, i+140);
  }
  textAlign(RIGHT, CENTER);
  fill(0, 255, 150);
  text(nfc(maxTemp, 1), width-30
    , 130);
  fill(140, 180, 255);
  text(nfc(minTemp, 1), width-30, 286);
}

void gatherData() {
  fill(70, 255, 100);
  if (!bNOAAConnect) {
    stationsXML = tryGetXML("http://www.weather.gov/xml/current_obs/index.xml");
    childCnt = stationsXML.getChildCount();
    bNOAAConnect = true;
  } 
  else if (!bGotStations) {
    textAlign( LEFT, CENTER);
    //text("Connected to NOAA; gathering station data...", 5,height-80);
    if (stations.size() > 0) {
      station s = (station) stations.get(stations.size()-1);
      text(currChild+" of "+childCnt, 5, height-20);
    }
    XMLElement st = stationsXML.getChild(currChild);
    if (st.getLocalName().equals("station")) {
      XMLElement url = st.getChild("xml_url");
      stations.add(new station(url.getContent()));
    }
    currChild++;
    if (currChild >= childCnt) bGotStations = true;
  }
}

XMLElement tryGetXML(String URL) {
  try {
    XMLElement tmp = new XMLElement(this, URL);
    return tmp;
  } 
  catch (Exception e) {
    return null;
  }
}

XMLElement tryGetChild(XMLElement p, String ch) {
  try {
    XMLElement tmp = p.getChild(ch);
    return tmp;
  } 
  catch (Exception e) {
    return null;
  }
}

class station {
  String stationURL;
  float longitude = 0, latitude = 0, tempF = 0;
  station(String url) {
    stationURL = url;
    update();
  }
  void update() {
    boolean bGet = true;
    XMLElement stationXML = tryGetXML(stationURL);
    if (stationXML != null) {
      XMLElement c;
      c = tryGetChild(stationXML, "longitude");
      if (c != null) longitude = float(c.getContent());
      c = tryGetChild(stationXML, "latitude");
      if (c != null) latitude = float(c.getContent());
      c = tryGetChild(stationXML, "temp_f");
      if (c != null) {
        tempF = float(c.getContent());
        if (tempF < minTemp) minTemp = tempF;
        if (tempF > maxTemp || maxTemp == 9999.0) maxTemp = tempF;
      }
    }
  }
}


