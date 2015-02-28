

/*
EINFUEGEN!! wenn array groesser, loeschen!!
  if (particles.size() > 100) {
    particles.remove(0); 
  }
*/

import eu.fluidforms.utils.*;
import eu.fluidforms.processing.*;
import eu.fluidforms.geom.*;
import eu.fluidforms.io.*;
import eu.fluidforms.parser.*;

import controlP5.*;

import processing.opengl.*;
public int numSPoint = 8; //13 = 5 vertex / 8 kontrollpunkte immer + oder - 3 fuer die punkte

PVector[] theSpinTop; //PVector array
PVector position;
PFont font;

int radius;
//int vertexes;
float ifvertexes;
String number;
int countRecord;
float countangle = 0;

int SpinAngle = 360;
int PointNumbr;

int frequency = 10;
float angle = 0;
int SpinLines = SpinAngle/frequency;
int numSites;

float EDUCATION;
float HEALTH;
float LIFE;
float ECONOMIC;
float POLITICAL; 
String NAME;
float SCORE;
String RANK;

String[] Cname = new String[100];
float[] Ced = new float[100];
float[] Che = new float[100];
float[] Cli = new float[100];
float[] Cec = new float[100];
float[] Cpo = new float[100];
String[] Cra = new String[100];
float[] Csc = new float[100];

float defaultx = 10;
float defaulty = 10;  

SpinOutline spinOutline;
//RESET PERSPECTIVE
//BEGIN HUD / END HUD
ControlP5 cp5;
XMLElement xml;
DropdownList d1;

void setup() {
  spinOutline = new SpinOutline();  
  size(1200, 800, OPENGL);
  //size(screen.width, screen.height, OPENGL);
  smooth();
  //frameRate(60);
  theSpinTop = new PVector[] {
  }; 
  position = new PVector();
  spinOutline.BaseSpinTop();
  //P5 MENU
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  // create a DropdownList
  d1 = cp5.addDropdownList("Countries")
    .setPosition(width/25, height/3.5)
      .setSize(200, 200)
        .setIndex(0);
  ;

  xml = new XMLElement(this, "worldsbest3.xml");
  numSites = xml.getChildCount();
  for (int i = 0; i < numSites; i++) {
    XMLElement kid = xml.getChild(i);
    XMLElement[] values = xml.getChildren("c/s");
    XMLElement[] value = xml.getChildren("c/r");
    int id = kid.getInt("id"); 
    String name = kid.getString("name");
    String Sec = values[i].getString("ec");   
    float ec = float(trim(Sec));
    String Sed = values[i].getString("ed");   
    float ed = float(trim(Sed));
    String She = values[i].getString("he");   
    float he = float(trim(She));
    String Sli = values[i].getString("li");   
    float li = float(trim(Sli));
    String Spo = values[i].getString("po");   
    float po = float(trim(Spo));   
    String ra = value[i].getString("ov");   
    String Ssc = values[i].getString("ov");   
    float sc = float(trim(Ssc));
    name = name.toUpperCase();
    Cname[i] = name;
    Ced[i] = ed;
    Che[i] = he;
    Cli[i] = li;
    Cec[i] = ec;
    Cpo[i] = po;
    Cra[i] = ra; 
    Csc[i] = sc;
  }
  customize(d1);
  d1.setIndex(0);
}

void draw() {
  countRecord = millis();
  //cam.beginHUD();
  background(255);
  Title();
  Values();
  //Outlines();
  cp5.draw();
  //cam.endHUD();
  Draw3D();
  
  countangle = countangle + 1;
   frame.setTitle(int(frameRate) + " fps");
}

void Draw3D() {
  pushMatrix();
  translate((width/3)*2, height/7*3, 0); 
  rotateY(radians(countangle));
  SpinTopDrawShape();
  popMatrix();
}

void Values() {
  pushMatrix();
  textAlign(LEFT);
  translate(width/25, height/3.5);
  textFont(font, 16);
  fill(0);
  text("Health:   "+ HEALTH, 0, 40);
  text("Education:   "+ EDUCATION, 0, 80);
  text("Quality of life:   "+ LIFE, 0, 120);
  text("Economic Dynamism:   "+ ECONOMIC, 0, 160);
  text("Political Environment:   "+ POLITICAL, 0, 200);
  popMatrix();
}

void Title() {
  pushMatrix();
  translate(width/2, height/7);
  font = loadFont("BreeSerif-Regular-34.vlw");
  textFont(font, 36); 
  fill(0);
  textAlign(CENTER);
  text("THE WORLD'S BEST SPIN TOP", 0, 0);  
  fill(255, 0, 0);
  //text(NAME + "     " + "RANK: " + RANK + "     " + "SCORE: " + SCORE, 0, 50);
  text(NAME, 0, 50);
  popMatrix();
}

void SpinTopDrawShape() {
  fill(255);
  strokeWeight(2);
  stroke(0);    

  int e = 0;
  while (e <= theSpinTop.length-numSPoint) {

    fill(255);
    if (e == theSpinTop.length-numSPoint) {
      //TOP
      beginShape(TRIANGLE_FAN);
      vertex(theSpinTop[e].x, theSpinTop[e].y, theSpinTop[e].z);     
      vertex(theSpinTop[0].x, theSpinTop[0].y, theSpinTop[0].z);
      vertex(0, theSpinTop[0].y, 0);
      endShape(CLOSE); 

      //BOTTOM
      beginShape(TRIANGLE_FAN);
      vertex(theSpinTop[e + numSPoint - 1].x, theSpinTop[e + numSPoint - 1].y, theSpinTop[e + numSPoint - 1].z);     
      vertex(theSpinTop[numSPoint - 1].x, theSpinTop[numSPoint - 1].y, theSpinTop[numSPoint - 1].z);
      vertex(0, theSpinTop[numSPoint - 1].y, 0);
      endShape(CLOSE); // AENDERN!!
    }
    else {
      //TOP
      beginShape(TRIANGLE_FAN);
      vertex(theSpinTop[e].x, theSpinTop[e].y, theSpinTop[e].z);     
      vertex(theSpinTop[e + numSPoint].x, theSpinTop[e + numSPoint].y, theSpinTop[e + numSPoint].z);
      vertex(0, theSpinTop[0].y, 0);
      endShape(CLOSE); 

      //BOTTOM
      beginShape(TRIANGLE_FAN);
      vertex(theSpinTop[e + numSPoint - 1].x, theSpinTop[e + numSPoint - 1].y, theSpinTop[e + numSPoint - 1].z);     
      vertex(theSpinTop[e + numSPoint + numSPoint - 1].x, theSpinTop[e + numSPoint + numSPoint - 1].y, theSpinTop[e + numSPoint + numSPoint - 1].z);
      vertex(0, theSpinTop[numSPoint - 1].y, 0);
      endShape(CLOSE);
    }
    //BODY
    for (int j = 0; j < numSPoint-1; j++) {
      int test = j+e;
      //println("linie " + e + " punkt" + test);
      fill(255);
      if (e == theSpinTop.length-numSPoint) {       
        beginShape(TRIANGLE_FAN);
        //println(j);
        vertex(theSpinTop[e + j].x, theSpinTop[e + j].y, theSpinTop[e + j].z);     
        vertex(theSpinTop[0 + j].x, theSpinTop[0 + j].y, theSpinTop[0 + j].z);
        vertex(theSpinTop[0 + j + 1].x, theSpinTop[0 + j + 1].y, theSpinTop[0 + j + 1].z);
        vertex(theSpinTop[e + j + 1].x, theSpinTop[e + j + 1].y, theSpinTop[e + j + 1].z);
        endShape(CLOSE);
      }
      else {        
        beginShape(TRIANGLE_FAN);
        vertex(theSpinTop[e + j].x, theSpinTop[e + j].y, theSpinTop[e + j].z);      
        vertex(theSpinTop[e + j + numSPoint].x, theSpinTop[e + j + numSPoint].y, theSpinTop[e + j + numSPoint].z);
        vertex(theSpinTop[e + j + numSPoint + 1].x, theSpinTop[e + j + numSPoint + 1].y, theSpinTop[e + j + numSPoint + 1].z);
        vertex(theSpinTop[e + j + 1].x, theSpinTop[e + j + 1].y, theSpinTop[e + j + 1].z);
        endShape(CLOSE);
      }
    }

    e = e + numSPoint;
  }
}

void customize(DropdownList ddl) {
  ddl.setBackgroundColor(color(255));
  ddl.setItemHeight(25);
  ddl.setBarHeight(30);
  ddl.captionLabel().set("dropdown");
  ddl.captionLabel().style().marginTop = 5;
  ddl.captionLabel().style().marginLeft = 5;
  ddl.valueLabel().style().marginTop = 4;
  for (int i=0;i<numSites;i++) {
    ddl.addItem(Cname[i], i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(0));
  ddl.setColorActive(color(255, 0, 0));
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    int aus = (int)theEvent.getGroup().getValue();
    //println(auswahl);
    EDUCATION = Ced[aus];
    HEALTH = Che[aus];
    LIFE = Cli[aus];
    ECONOMIC = Cec[aus];
    POLITICAL = Cpo[aus];
    NAME = Cname[aus];       
    RANK = Cra[aus]; 
    SCORE = Csc[aus];
    spinOutline.editPoint();
  }
}

void recordSTL() {
  String format = "stl";
  beginRecord(FluidFormsLibs.RECORDER, NAME + "." + format);  
  println(countRecord);
  translate(0, 0, 0);
  scale(0.2);
  SpinTopDrawShape();  
  endRecord();
  println("Recorded");
}

void keyPressed() {
  if (key == 'k') {
    recordSTL();
  }
}

class SpinOutline {

  float x, y; 
  float ValueRadius;
  float lastX, lastY;
  //int so = (int)random(0, 2);
  //int sose = (int)random(0, 2);
  float eco = 0;
  float edu1 = 0;
  float edu2 = 0;

  SpinPoint[] spinPoints;

  SpinOutline() {
    spinPoints = new SpinPoint[numSPoint];
    for (int j = 0; j < numSPoint; j++) {

      number = nfs(j, 0); //to string     

      spinPoints[j] = new SpinPoint(0-defaultx, defaulty, 0, number, HEALTH);
      //println(number);
      ifvertexes = float(j)/3.0; //ob thirt position
      if ((j/3) == ifvertexes) {
        spinPoints[j].colorEllipse = color(255, 0, 0); 
        //vertexes += 1;
      }
    }
  }

  float CalculatePoint6Y(float _EDUCATION) {

    edu1 = map(_EDUCATION, 0, 105, 75, 30);
    return edu1;
  }

  float CalculatePoint6X(float _EDUCATION) {
    edu2 = map(_EDUCATION, 0, 105, 90, 15);
    return edu2;
  }

  float CalculatePointX(float _ECONOMIC) {
    //float eco = 0;
    eco = map(_ECONOMIC, 0, 102, 100, 30);
    return eco;
  }

  void BaseSpinTop() {
    println("Base" + spinPoints.length);
    if (angle < SpinAngle) {
      for (int i = 0; i < SpinLines; i++) {
        for (int j = 0; j < numSPoint; j++) {
          spinPoints[j].BaseSpinTop();
        }
        angle += frequency;
      }
    }
  }

  void UpdateSpinTop(float _HEALTH) {
    println("Update" + spinPoints.length);
    if (angle < SpinAngle) {
      for (int i = 0; i < SpinLines; i++) {
        if (angle > 210){ 
          ValueRadius = 0;
          //counter = 0;
        }
        else {          
            float test2 = (100/_HEALTH)*20; 
            float ValueRadiusNew = map(test2, 10, 400, 0, 100);
            if (angle <= 45) {
              ValueRadius -= ValueRadiusNew/4.5;
            }
            if (angle >= 45 && angle < 90) {
              ValueRadius -= ValueRadiusNew/4.5;
            } 
            if (angle >= 90 && angle <= 135) {
              ValueRadius -= ValueRadiusNew/4.5;
            }
            if (angle <= 210 && angle >= 135) {
              ValueRadius += ValueRadiusNew/4.5;
            }          
        }

        for (int j = 0; j < numSPoint; j++) {      
          spinPoints[j].UpdateSpinTop(PointNumbr, ValueRadius, j);          
          PointNumbr++;
        }
        angle += frequency;
      }
    }
  }

  void draw() {
    for (int j = 0; j < numSPoint; j++) {
      spinPoints[j].draw();
    }
  }

  void editPoint() {
    for (int j = 0; j < numSPoint; j++) {
      switch(j) {
      case 0: 
        x = defaultx;
        y = 0;
        break;
      case 1: 
        x = defaultx;
        y = lastY  + POLITICAL - 20;
        break;
      case 2:             
        x = lastX + CalculatePointX(ECONOMIC)/2 + (100/POLITICAL)*20;  
        y = LIFE + j*50/1.7 - (100/POLITICAL) *10; 
        break;
      case 3: 
        x = lastX/10 + CalculatePointX(ECONOMIC)*2;
        y = LIFE + j*50/1.7;
        break;
      case 4: 
        x = lastX - CalculatePointX(ECONOMIC)/2;
        y = LIFE + j*50/1.7;
        break;
      case 5: 
        x = lastX - CalculatePointX(ECONOMIC)/3;
        y = LIFE + j*50/1.7;
        break;
      case 6:         
        x = CalculatePoint6X(EDUCATION);
        y = lastY  + CalculatePoint6Y(EDUCATION);
        break;
      case 7: 
        x = 0;
        y = 300;
        break;  
      default:             
        x = defaultx;
        y = defaulty;
        break;
      }
      spinPoints[j].x = 0 - x;
      spinPoints[j].y = y;
      spinPoints[j].STradius = HEALTH;
      angle= 0;
      PointNumbr = 0;
      UpdateSpinTop(HEALTH);
      lastX = x;
      lastY = y;
    }
  }
}

class SpinPoint {
  float x, y, z, STradius;
  float dEllipse = 9.0;
  String number;
  boolean hover;
  color colorEllipse;
  float counter = 0.01;
  float d;

  SpinPoint(float _x, float _y, float _z, String _number, float _STradius) {
    x = _x;
    y = _y;
    z = _z;
    STradius = _STradius;
    number = _number;
    hover = false;
    colorEllipse = color(0, 0, 255);
  }

  void draw() {
    fill(colorEllipse);
    if (hover) {
      fill(255, 255, 0);
    }
    else {
    }
    noStroke();

    ellipse(x, y, dEllipse, dEllipse);
    fill(0);
    textFont(font, 13);
    text(number, x + 8, y - 10);
  }

  void BaseSpinTop() {
    float d = dist(x, y, 0, y);
    position.x = sin(radians(angle))*d;
    position.y = y;
    position.z = cos(radians(angle))*d; 
    theSpinTop = (PVector[]) append(theSpinTop, new PVector(position.x, position.y, position.z));
  }

  void UpdateSpinTop(int SpinTopNr, float _ValueRadius, int Nm) { 
    //println(_ValueRadius);
    //d = dist(x, y, 0, y);
     
    if(Nm == 6 || Nm == 7 || Nm == 0 || Nm == 1) {
      _ValueRadius = 0;
    }
    d = dist(x, y, _ValueRadius, y); 
    //println("Number: " + Nm + " " +"Angle: " + angle + " " + "Radius: " + d);
    theSpinTop[SpinTopNr].x = sin(radians(angle))*d;
    theSpinTop[SpinTopNr].y = y;
    theSpinTop[SpinTopNr].z = cos(radians(angle))*d;
  }
}



