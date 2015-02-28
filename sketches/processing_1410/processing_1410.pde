
/** 
 * Geared Monster
 * by Algirdas Rascius.
 * <br>
 * Created for Processing Monsters page by Lukas Vojir. See http://www.rmx.cz/monsters.
 * <br>
 * Mouse-click to restart.
 */ 
 
PShape[] gearShapes;
Monster monster;
ArrayList genesList;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  
  gearShapes = new PShape[25];
  for (int i=6; i<=24; i++) {
    gearShapes[i] = loadShape("g" + i + ".svg");
  }
  
  genesList = new ArrayList();
  genesList.add( new Genes("AAII,AAzz,AAzz,AAzz,BBzz,CCzz,DDzz,EEMMM,FFMME,GGMMH,AAaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa"));
  genesList.add( new Genes("AAII,AAzz,AAzz,AAzz,BBzz,CCzz,DDzz,EEMMM,FFMME,GGMMH"));
  genesList.add( new Genes("ZZMPM,AAzz,BBEZH,AAbbE,AAbbE,CCaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa,aaaa"));
  genesList.add( new Genes("AAzZE,AAzZM,AAzZM,BBzHH,CCzHH,aaaa,ccaa,aaaa,ccaa"));
  genesList.add( new Genes("AAMPE,aaaaM,bbaaM,ccaaM,ccaaH,ccaaH,ccaaH,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa,ccaa"));
  genesList.add( new Genes("ZZZZH,AAmmM,AAmmE,AAmmM,AAmmE,AAmmM,AAmmE"));
  genesList.add( new Genes("AANSM,AAzz,AAzz,AAzz,BBNSE,CCNSH,DDNSE"));
  genesList.add( new Genes("AANSM,AAzz,AAzz,AAzz,BBNSE,CCNSH,DDNSE,AAzz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz,aazz"));
  genesList.add( new Genes("AANSM,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA,aazz,aaAA")); 
  genesList.add( new Genes("AANSM,AAAAE,AAAAE,AAAAE,AAzzH,BBzzH,CCzzH,DDzzH,AAzzH,BBzzH,CCzzH,DDzzH,AAzzH,BBzzH,CCzzH,DDzzH,AAzzH,BBzzH,CCzzH,DDzzH,AAzzH,BBzzH,CCzzH,DDzzH,AAzzH,BBzzH,CCzzH,DDzzH"));
  genesList.add( new Genes("AANSM,AAAAE,AAAAE,AAAAE,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH,AazzH"));
  genesList.add( new Genes("zZzZH,"));
  genesList.add( new Genes("zZzZM,"));
  genesList.add( new Genes("zZzZE,"));
  genesList.add( new Genes("zZzZHEM_,"));
  genesList.add( new Genes("zZzZHEM,"));
  genesList.add( new Genes("zZzz,zZZZHEM,"));
  genesList.add( new Genes("AAZZM,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,"));
  genesList.add( new Genes("AAZZH,AAZZE,AAZZE,AAZZM,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,Aazz,"));
  genesList.add( new Genes("AAZZH,AAZZE,AAZZM,"));
  genesList.add( new Genes("AaZZH,AaZZE,AaZZM,"));
  
  frameRate(20);
  newMonster();
}

void newMonster() {
  monster = new Monster(randomGenes());
}

void mousePressed() {
  newMonster();
}

void draw() {
  background(255);
  monster.draw();
}

Genes randomGenes() {
  return (Genes)genesList.get(floor(random(genesList.size())));
}

float gearRadius(int teethCount) {
  return teethCount*10.1/PI + 0.5;
}

float gearRadius(Gear gear) {
  return gearRadius(gear.teethCount);
}

//============================================================================================
class GrowInfo {
  int parentA;
  int parentB;
  int deltaTeethA;
  int deltaTeethB;
  String organCodes;

  GrowInfo(String info) {
    parentA = parseCode(info, 0);
    parentB = parseCode(info, 1);
    deltaTeethA = parseCode(info, 2);
    deltaTeethB = parseCode(info, 3);
    organCodes = info.substring(4);
  }
    
  int getParent(int count) {
    int indexMin = parentA>=0 ? max(0, min(parentA-1, count-1)) : max(0, count+parentA);
    int indexMax = parentB>=0 ? max(0, min(parentB-1, count-1)) : max(0, count+parentB);
    indexMax = max(indexMin, indexMax);
    return floor(random(indexMin, indexMax+0.999));
  }
  
  int getTeethCount(int parentTeethCount) {
    int teethCountMin = max(6, min(24, parentTeethCount+deltaTeethA));
    int teethCountMax = max(min(24, parentTeethCount+deltaTeethB), teethCountMin);
    return floor(random(teethCountMin, teethCountMax+0.999));
  }
  
  Organ getOrgan() {
    Organ organ = null;
    if (organCodes.length() > 0) {
      switch(organCodes.charAt(floor(random(organCodes.length())))) {
        case 'H' : organ = new Heart(); break;
        case 'E' : organ = new Eye(); break;
        case 'M' : organ = new Mouth(); break;
      }
    }
    return organ;
  }
  
  int parseCode(String t, int i) {
    int code = 0;
    if (t.length() > i) {
      char c = t.charAt(i);
      if (c >= 'A' && c <= 'Z') {
        code = c - 'A' + 1;
      } else if (c >= 'a' && c <= 'z') {
         code = - (c - 'a' + 1);
      }
    }
    return code;
  }
  
}

//============================================================================================
class Genes {
  ArrayList growInfos = new ArrayList();
  boolean cycle;
  
  Genes(String genes) {
    String[] geneParts = genes.split(",");
    for (int i=0; i<geneParts.length; i++) {
      growInfos.add(new GrowInfo(geneParts[i]));
    }
    cycle = genes.endsWith(",");
  }
    
  GrowInfo getGrowInfo(int time) {
    if (!cycle && time>=growInfos.size()) {
      return null;
    }
    return (GrowInfo)growInfos.get(time%growInfos.size());
  } 
}

//============================================================================================
class Gear {
  int x;
  int y;
  int teethCount;
  float rotation;
  ArrayList nestedGears = new ArrayList();
  Organ organ;
  
  Gear(int x, int y, int teethCount) {
    this.x = x;
    this.y = y;
    this.teethCount = teethCount;
    this.rotation = random(0, 2*PI);
  }
  
  Gear(Gear parent, int teethCount, float angle) {
    float distance = gearRadius(parent) + gearRadius(teethCount);
    this.x = round(parent.x + distance*cos(angle));
    this.y = round(parent.y + distance*sin(angle));
    this.teethCount = teethCount;
    this.rotation = (PI + PI/teethCount + 2*PI/teethCount*round(random(teethCount)) + (angle - parent.rotation)*parent.teethCount/teethCount + angle) % (2*PI);
  }
  
  void setOrgan(Organ o) {
    organ = o;
  }
  
  void addNestedGear(Gear nested) {
    nestedGears.add(nested);  
  }
  
  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    shape (gearShapes[teethCount], 0, 0);
    if (organ != null) {
      organ.draw(x, y, gearRadius(this), rotation); 
    }
    popMatrix();
  }
  
  void rotateShape(float angle) {
    rotation = (rotation+angle) % (2*PI);
    for (int i=0; i<nestedGears.size(); i++) {
      Gear nested = (Gear)nestedGears.get(i);
      nested.rotateShape(-angle*teethCount/nested.teethCount);
    }
  }
  
}

//============================================================================================
class Monster {
  private Genes genes;
  private ArrayList gears = new ArrayList();
  private Gear centerGear;
  private int time;
  private float rotationPhase = random(0, 2*PI);
    
  Monster(Genes genes) {
    this.genes = genes;
    GrowInfo growInfo = genes.getGrowInfo(0);
    centerGear = new Gear(width/2, height/2, growInfo.getTeethCount(0));
    centerGear.setOrgan(growInfo.getOrgan());
    gears.add(centerGear);    
  }
  
  void draw() {
    time++;

    for (int i=0; i<gears.size(); i++) {
      Gear gear = (Gear)gears.get(i);
      if (gear != null) { 
        gear.draw();
      }
    }
    
    centerGear.rotateShape(sin(rotationPhase+time*0.01)*0.08);
    
    grow();
  }
  
  private boolean fits(Gear gear, Gear parent) {
    float gearRadius = gearRadius(gear);
    if (gear.x < gearRadius + 5 ||
        gear.x > width - gearRadius - 5 ||
        gear.y < gearRadius + 5 ||
        gear.y > height - gearRadius - 5 ) {
      return false;
    }
        
    for (int i=0; i<gears.size(); i++) {
      Gear g = (Gear)gears.get(i);
      if (g != null &&
          g != gear && 
          g != parent &&
          dist(g.x, g.y, gear.x, gear.y) < gearRadius(g) + gearRadius + 15) {
        return false;
      }
    }  
  
    return true;
  }    
    
  private void grow() {
    if (time < 200) {
      GrowInfo growInfo = genes.getGrowInfo(time);
      
      if (growInfo != null) {
        boolean added = false;
        int count = 1000;
        while(!added && --count>0) {
          Gear parent = (Gear)gears.get(growInfo.getParent(gears.size()));
          if (parent != null) { 
            Gear gear = new Gear(parent, growInfo.getTeethCount(parent.teethCount), random(2*PI));
            if (fits(gear, parent)) {
              gear.setOrgan(growInfo.getOrgan());
              parent.addNestedGear(gear);
              gears.add(gear);
              added = true;
            }
          }
        }
        if (!added) {
          gears.add(null);
        }
      }      
    }
  }

}

//============================================================================================
interface Organ {
  void draw(int x, int y, float radius, float rotation);
}

//============================================================================================
private PShape heartShape;

class Heart implements Organ {  
  private float time;
  private float delta;
  
  Heart() {
    if (heartShape == null) {
      heartShape = loadShape("heart.svg");
    }
    time = 0;
    delta = random(0.02, 0.1);
  }
  
  void draw(int x, int y, float radius, float rotation) {    
    scale((radius-10)*nextSize()/30);
    shape(heartShape, 0, 0);
  }
  
  private float nextSize() {
    time = (time+delta) % 1.0;
    return time<=0.1 ? 1.0 : 0.07/time+0.3;
  }  
}

//============================================================================================
private PShape[] eyeShapes;

class Eye implements Organ {  
  
  Eye() {
    if (eyeShapes == null) {
      eyeShapes = new PShape[7];
      for (int i=0; i<7; i++) {
        eyeShapes[i] = loadShape("eye" + i + ".svg");
      }
    }
  }
  
  void draw(int x, int y, float radius, float rotation) {
    scale((radius-15)/40);
    
    fill(255);
    ellipse(0, 0, 75, 75);
    
    float angle = atan2(y-mouseY, x-mouseX);
    
    fill(0);
    ellipse(-15*cos(angle-rotation), -15*sin(angle-rotation), 30, 30);
    fill(255);
    ellipse(-15*cos(angle-rotation), -15*sin(angle-rotation), 10, 10);
    
    
    int shapeIndex = min(6, max(0, floor(dist(x, y, mouseX, mouseY)/15-2)));
    shape(eyeShapes[shapeIndex], 0, 0);
  }    
}

//============================================================================================
private PShape[] mouthShapes;

class Mouth implements Organ {  
  
  Mouth() {
    if (mouthShapes == null) {
      mouthShapes = new PShape[7];
      for (int i=0; i<7; i++) {
        mouthShapes[i] = loadShape("mouth" + i + ".svg");
      }
    }
  }
  
  void draw(int x, int y, float radius, float rotation) {
    scale((radius-15)/40);
    int shapeIndex = min(6, max(0, floor(dist(x, y, mouseX, mouseY)/8-3)));
    shape(mouthShapes[shapeIndex], 0, 0);
  }    
}


