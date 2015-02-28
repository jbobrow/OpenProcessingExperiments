
import peasy.*;
PeasyCam cam;

HashMap stateLookup;
LinkedList travel;
float wire[][];

void setup() {
  size(640, 360, P3D);
  cam = new PeasyCam(this, width);
  
  noFill();
  
  stateLookup = new HashMap();
  
  float averageX = 0, averageY = 0;
  String[] stateLines = loadStrings("states.csv");
  for(int i = 0; i < stateLines.length; i++) {
    String[] parts = split(stateLines[i],",");
    
    Location cur = new Location(parts[3],parts[4]);
    averageX += cur.x;
    averageY += cur.y;
    
    stateLookup.put(parts[0],cur);
    stateLookup.put(parts[1],cur);
    stateLookup.put(parts[2],cur);
  }
  
  averageX /= stateLines.length;
  averageY /= stateLines.length;
  
  String[] keys = (String[]) stateLookup.keySet().toArray(new String[]{});
  String[] emailLines = loadStrings("email.txt");
  travel = new LinkedList();
  for(int i = 0; i < emailLines.length; i++)
    for(int j = 0; j < keys.length; j++)
      if(emailLines[i].indexOf(keys[j]) != -1)
        travel.add((Location) stateLookup.get(keys[j]));
      
  float step = -width / 2;
  float stepInc = (float) width / travel.size();  
  wire = new float[travel.size()][3];
  for(int i = 0; i <  travel.size(); i++) {
    Location cur = (Location) travel.get(i);
    wire[i] = new float[] {
     (cur.x - averageX) * width, step,
     (cur.y - averageY) * width};
    step += stepInc;
  }
}

void draw() {
  background(255);
  rotateX(HALF_PI * .8);
  beginShape();
  for(int i = 0; i < wire.length; i++)
    vertex(wire[i][0], wire[i][1], wire[i][2]);
  endShape();
}

class Location {
  float x, y;
  Location(String x, String y) {
    this(float(x), float(y));
  }
  Location(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

