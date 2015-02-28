
ArrayList<EQ> earthquakes;
PImage img;
float cx = 69.0/30.0;
float cy = 44.0/15.0;

void setup(){
  size(823,518);
  String[] l = loadStrings("data.txt");
  earthquakes = new ArrayList<EQ>(l.length);
  for(int i = 1; i < l.length; i++){
    String[] e = l[i].split(",");
    earthquakes.add(new EQ(Float.parseFloat(e[6]), Float.parseFloat(e[7]), Float.parseFloat(e[8]), Float.parseFloat(e[9])));
  }
  
  img = loadImage("WorldMap.jpg");
  noStroke();
}

void draw() {
  background(0);
  image(img,0,0);
  
  for(int i = 0; i < earthquakes.size(); i++){
    pushMatrix();
    translate(cx*(180 + earthquakes.get(i).Lon),cy*(90 - earthquakes.get(i).Lat));
    fill((int)(Math.random()*200),(int)(Math.random()*200), 255,5*earthquakes.get(i).Dep);
    noStroke();
    ellipse(0,0,earthquakes.get(i).Mgt * 2,earthquakes.get(i).Mgt * 2);
    popMatrix();
  }
}

class EQ{
  public float Lat;
  public float Lon;
  public float Mgt;
  public float Dep;
  
  EQ(float a, float b, float c, float d){
    Lat = a;
    Lon = b;
    Mgt = c;
    Dep = d;
  }
  
  String toString(){
    return "Lat: " + Lat + " Lon: " + Lon + " Mag: " + Mgt + "Mag: " + Mgt + " Dep: " + Dep + "\n";
  }
  
}


