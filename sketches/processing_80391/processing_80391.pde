
import vialab.SMT.*;
import java.util.HashSet;
import java.util.Set;

TouchClient client;
BodyZone bodyZone;
Zone symptomPanelZone;

int width = 700, height = 500; 

void setup() {
  size(width, height, P3D);
  
  client = new TouchClient(this, TouchSource.MOUSE);
  TouchClient.setWarnUnimplemented(false);
  
  // client.setDrawTouchPoints(true);
  bodyZone = new BodyZone("BodyZone", loadImage("body-vector.jpg"),  20, 50);
  
  symptomPanelZone = new Zone("SymptomPanelZone", 370, 20, 300, 250);
  
  /* adding symptoms */
  SymptomZone s1 = new SymptomZone("Symptom", loadImage("hot.png"), 30, 70, new Symptom("HOT"));
  
  client.add(bodyZone);
  client.add(symptomPanelZone);
  
  symptomPanelZone.add(s1);
  
}

void draw() {
  background(255);
  text(frameRate +" fps", width/2, 10);
}

void touchBodyZone(Zone z) {
  z.rst(true, true, false);
}

void touchSymptom(Zone z) {
  SymptomZone symp = (SymptomZone) z;
  z.rst();
  // symptom is not cloned
  if(!symp.clone) {
    symptomPanelZone.add(z.clone());
  }
  
  Touch touch = symp.getTouches()[0];
  bodyZone.makeMarkersVisible(new PVector(touch.x, touch.y));
}

void touchUpSymptom(Zone zone, Touch t) {
  symptomPanelZone.remove(zone);
  SymptomZone sz = (SymptomZone) zone;
  bodyZone.mapSymptom(sz.s, new PVector(t.x, t.y));
}

void drawSymptomPanelZone(Zone z) {
  fill(50, 150);
  stroke(0);
  rect(0, 0, z.width, z.height, 7);
  fill(50);
  textSize(20);
  text("Symptoms", z.width/2.7, 40);
  line(0, 50, z.width, 50);
}
class BodyMarker
{
  PVector p;
  private String bodyPart;
  private Zone z;
  private static final int diameter = 15;
  boolean visible = false;
  Set<Symptom> symptoms;
  
  public BodyMarker(Zone z, int x, int y, String bodyPart)
  {
    p = new PVector(x, y);
    this.z = z;
    this.bodyPart = bodyPart;
    symptoms = new HashSet<Symptom>();
  }
  
  public PVector pos()
  {
    return z.fromZoneVector(p);
  }
  
  void display() 
  {
    fill(0, 0, 255, 150);
    ellipseMode(CENTER);
    ellipse(p.x, p.y, diameter, diameter);
    fill(0, 190);
    rect(p.x + 6, p.y - 34, bodyPart.length() * 8, 30, 3);
    fill(255);
    text(bodyPart, p.x + 11, p.y - 15);
  }
  
  int i = 0;
  void glow()
  {
    noStroke();
    int s = 10 + i;
    fill(200,40,35,75);
    ellipse(p.x, p.y, s, s);
    ellipse(p.x, p.y, 2*s/3, 2*s/3);
    ellipse(p.x, p.y, s/3, s/3);
    if(i++ == 30) {
      i = 0;
    }
  }
}
class BodyZone extends ImageZone
{
  private ArrayList<BodyMarker> markers;
  PImage imCopy;
  BodyZone(String name, PImage img, int x1, int y1)
  {
    super(name, img, x1, y1);
    imCopy = new PImage(img.getImage());
    addMarkers();
  }

  private void addMarkers()
  {
    markers = new ArrayList<BodyMarker>();

    // adding markers
    markers.add(new BodyMarker(this, 13, 204, "Right Hand"));
    markers.add(new BodyMarker(this, 20, 166, "Right Elbow"));
    markers.add(new BodyMarker(this, 32, 117, "Right Shoulder"));
    markers.add(new BodyMarker(this, 66, 74, "Face"));
    markers.add(new BodyMarker(this, 66, 134, "Chest"));
    markers.add(new BodyMarker(this, 64, 178, "Stomach"));
    markers.add(new BodyMarker(this, 98, 112, "Left Shoulder"));
    markers.add(new BodyMarker(this, 109, 158, "Left Elbow"));
    markers.add(new BodyMarker(this, 119, 205, "Left Hand"));
    markers.add(new BodyMarker(this, 40, 282, "Right Knee"));
    markers.add(new BodyMarker(this, 41, 347, "Right Ankle"));
    markers.add(new BodyMarker(this, 85, 283, "Left Knee"));
    markers.add(new BodyMarker(this, 92, 345, "Left Ankle"));
    // end
  }

  ArrayList<BodyMarker> getMarkers()
  {
    return markers;
  }

  final float thresh = 50;
  
  private BodyMarker nearestMarker(PVector vect) {
    BodyMarker[] markers = this.markers.toArray(new BodyMarker[0]);
    BodyMarker minMarker = markers[0];
    float dist = minMarker.pos().dist(vect);
    
    for (BodyMarker marker : markers)
    {
      if (marker.pos().dist(vect) < dist)
      {
        dist = marker.pos().dist(vect);
        minMarker = marker;
      }
    }
    return minMarker;
  }
  
  void makeMarkersVisible(PVector vect)
  {    
    for(BodyMarker marker : markers) {
      marker.visible = false;
    }
    
    BodyMarker minMarker = nearestMarker(vect);
    if(minMarker.pos().dist(vect) < thresh)
    {
      minMarker.visible = true;
    }
  }

  
  void mapSymptom(Symptom s, PVector vect)
  {
    BodyMarker minMarker = nearestMarker(vect);
    if(minMarker.pos().dist(vect) > thresh) {
      return;
    }
    minMarker.visible = false;
    minMarker.symptoms.add(s);
  }
  
  void drawImpl()
  {
    super.drawImpl();
    
    boolean visb = false;
    for(BodyMarker marker : bodyZone.getMarkers())
    {
      if(marker.symptoms.size() > 0) {
        marker.glow();
      }
      if(marker.visible) {
        marker.display();
      }
      
    }
  }
}

class Symptom
{
  String name;
  float level;
  
  public Symptom(String name)
  {
    this.name = name;
    this.level = 0;
  }
  
  public Symptom(String name, float level)
  {
    this.name = name;
    this.level = level;
  }
  
  public int hashCode()
  {
    return name.hashCode();
  }
}
class SymptomZone extends ImageZone
{
  Symptom s;
  SymptomZone zClone;
  boolean clone;
  
  PVector op;
  SymptomZone(String name, PImage img, int x, int y, Symptom s)
  {
    super(name, img, x, y);
    this.s = s;
    op = new PVector(x, y);
    clone = false;
  }
  
  void drawImpl()
  {
    if(clone)
    {
      tint(255, 100);
    }
    super.drawImpl();
    
  }
  
  SymptomZone clone()
  {
    this.clone = true;
    return new SymptomZone(name, img, (int)op.x, (int)op.y, new Symptom(s.name));
  }
}


