
PImage maps;
ArrayList earthquakes = new ArrayList();
void setup() {
  size(906, 485);
  background(0, 0, 0);
  PFont courier = loadFont("CourierNewPSMT-12.vlw");
  textFont(courier);
  maps = loadImage("map.jpg");
  image(maps, 0, 0, width, height);
  fill(0,0,0);
  textAlign(CENTER, CENTER);
  text("Earthquakes in the Past 7 Days - Red Circles represent Richter Scale Magnitude (Logarithmic)", width/2, 10);
  BufferedReader reader = createReader("earthquakes.txt");
  String str;
  String[] split = new String[12];

  for (int i = 0; i < 985; i++) {
    try {
      str = reader.readLine();
      split = str.split(",");
    }
    catch(IOException ex) {
      System.out.println(ex.toString());
    }
    if (i != 0) {
      earthquakes.add(new Earthquake(Float.parseFloat(split[6]), Float.parseFloat(split[7]), Float.parseFloat(split[8])));
    }
  }
  Earthquake e;
  pushMatrix();
  translate(423, 305);
  for (int i = 0; i < 984; i++) {
    e = (Earthquake) earthquakes.get(i);
    e.display();
  }
  popMatrix();
}

void draw() {
  image(maps, 0, 0, width, height);
  text("Earthquakes in the Past 7 Days - Red Circles represent Richter Scale Magnitude (Logarithmic)", width/2, 10);
  Earthquake e;
  pushMatrix();
  translate(423, 305);
  for (int i = 0; i < 984; i++) {
    e = (Earthquake) earthquakes.get(i);
    e.display();
  }
  popMatrix();
}

class Earthquake {
  float latitude;
  float longitude;
  float magnitude;

  Earthquake(float lat, float lon, float mag) {
    latitude = lat;
    longitude = lon;
    magnitude = mag;
  }

  void display() {
    fill(#FF0000, 100);
    ellipse(longitude*2.45, -latitude*2.6, 10*log(magnitude), 10*log(magnitude));
  }
}


