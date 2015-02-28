
PImage usa, mineKey;
PShape mineLocs;
DataGetter dGet;
ArrayList<Mine> mines;
float scale, transX, transY;
boolean showKey, showMap, firstGo;

void setup() {
  size(800, 400, P2D);
  dGet = new DataGetter();
  mines = dGet.getMines();
  scale = 1.0;
  transX=0;
  transY=0;
  showKey = false;
  showMap = true;
  textFont(createFont("Arial", 16));

  background(0);
  textAlign(LEFT, TOP);
  fill(255);
  text("Please wait while graphics load... this may take a moment...", 0, 0);
  firstGo = true;
}


void draw() {
  if (firstGo) {
    createGraphics();
    firstGo = false;
  }
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  scale(scale);
  translate(-width/2, -height/2);


  if (showMap)image(usa, transX, transY, width, height);
  shape(mineLocs, transX, transY);
  popMatrix();
  if (showKey) 
    image(mineKey, 0, 0, width, height);
}

void createGraphics() {
  usa = loadImage("world32k.png");//note, this is 1/4 of the earth with the top left at (90,180)

  noStroke();
  ellipseMode(CENTER);
  colorMode(HSB);

  mineLocs = createShape(GROUP);
  int total = dGet.getNumberOfIDs();
  for (Mine m: mines) {
    fill(255.0*dGet.getTypeID(m.getResource())/total, 255, 255, 128);
    mineLocs.addChild(createShape(ELLIPSE, new float[] {
      width*(m.getLongitude()+180)/180, height*(90-m.getLatitude())/90, .5, .5
    }
    ));
  }

  textAlign(LEFT, TOP);
  ellipseMode(CORNER);
  int x = 20, y = 20;
  background(0,0,0,0);
  for (String m: dGet.getTypes()) {
    fill(255.0*dGet.getTypeID(m)/total, 255, 255);
    ellipse(x, y, 10, 10);
    fill(255);
    text(" = " + m, x+12, y);
    y += 15;
    if (y > height - 35) {
      y = 20;
      x += 250;
    }
  }
  mineKey = get();
}

void keyPressed() {
  if (!firstGo) {
    if (key == '1') {
      scale*=5.0/4;
    }
    else if (key == '2') {
      scale *= 4.0/5;
      if (scale < 4.0/height) scale = 4.0/height;
    } 
    else if (key == 'k' || key == 'K')
      showKey = !showKey;
    else if (key == 'm' || key == 'M')
      showMap = !showMap;
  }
}

void mouseDragged() {
  if (!firstGo) {
    transX += (mouseX - pmouseX)/scale;
    transY += (mouseY - pmouseY)/scale;
    if (transX < -width) transX = -width;
    else if (transX > width) transX = width; 
    if (transY < -height) transY = -height;
    else if (transY > height) transY = height;
  }
}

class DataGetter{
  final String dataLoc = "US mines.txt";
  ArrayList<Mine> mines;
  ArrayList<String> typeIDs;//index is id number
  int totalRsrcTypes;
  
  DataGetter(){
    parseFile();
  }
  
  void parseFile(){
    String[] data = loadStrings(dataLoc);
    typeIDs = new ArrayList<String>();
    mines = new ArrayList<Mine>(data.length);
    totalRsrcTypes = 0;
    for(String m: data){
      String[] temp = split(m, '\t');
      mines.add(new Mine(int(temp[0]),temp[1],temp[2],temp[3],temp[4],temp[5],float(temp[6]),float(temp[7])));
      if(!typeIDs.contains(temp[1])){
        typeIDs.add(temp[1]);
        totalRsrcTypes++;
      }
    }
  }
  
  ArrayList<Mine> getMines(){
    return mines;
  }
  
  int getTypeID(String type){
    return typeIDs.indexOf(type);
  }
  
  int getNumberOfIDs(){
    return totalRsrcTypes;
  }
  
  ArrayList<String> getTypes(){
    return typeIDs;
  }
}
class Mine {
  float longitude, latitude;
  int id;
  String state, county, company, site, resource;

  Mine(int ID, String rsrc, String siteName, String cmpny, String st, String county, float lat, float longi) {
    id = ID;
    resource = rsrc;
    site = siteName;
    company = cmpny;
    state = st;
    this.county = county;
    latitude = lat;
    longitude = longi;
  }

  String toString() {
    return company + " (#" + id + ") has a mine at " + site + " in " + county + " county, " + state +
      " located at (" + latitude + ", " + longitude + ") where they mine " + resource;
  }
  
  String getResource(){
    return resource;
  }
  
  float getLatitude(){
    return latitude;
  }
  
  float getLongitude(){
    return longitude;
  }
}



