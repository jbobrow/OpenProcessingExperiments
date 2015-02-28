
import controlP5.*;
import processing.pdf.*;

boolean doSave = false;


public float winkel = 0;
public float speed = 0;
public float speedMax = 30;
public float groesse;
public float farbe;

ControlP5 controlP5;

public float amount=10;
public float radius=180; 
public float angle=450;

public float xpos = 0; 
public float ypos = 0;

int d = 1;



void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 100);
  
  groesse = 170;

  controlP5 = new ControlP5(this);
  controlP5.addSlider("groesse", 0, 800).linebreak();
  controlP5.addSlider("amount", 0, 20).linebreak();
  controlP5.addSlider("radius", 0,360).linebreak();
  controlP5.addSlider("angle", 0,100).linebreak();
  controlP5.addSlider("farbe", 0, 100);
}


void draw() {
  if (doSave) beginRecord(PDF, timestamp()+"_SolarLogo_####.pdf");
  background(#eee6bf);


  pushMatrix();
  fill(#FFB01F);
  noStroke();

  translate(width/2, height/2);
  for (int i = 0; i < amount; i++) {
    xpos = cos(radians(angle))*radius; //kreisfunktion 
    ypos = sin(radians(angle))*radius;
    ellipse(xpos, ypos, 20, 20);
    angle += 360/amount;
  }
  popMatrix();


  noStroke();
  fill(#FFB01F);
  ellipse(400, 400, groesse, groesse);
  
  pushMatrix();
 fill(#eee6bf);
  translate(width/2, height/2);
  rotate(radians(winkel));
  arc(-10, 0, 150, 150, -PI, 0);
  scale(-1, -1);
  arc(-10, 0, 150, 150, -PI, 0);
  popMatrix();


  if (d != 0) { 
    if (speed<speedMax) { 
      speed += 0.08;
    }
    else if (speed>=speedMax) {
      d = 0;
    }
  }
  else { 
    if (speed>0) {
      speed -= 0.08;
    }
    else if (speed <= 0) {
      d = 1;
    }
  }

  winkel += speed;
  println(speed);

 PFont solar;
  solar = loadFont("CaflischScriptPro-Regular-48.vlw");
  textFont(solar,27);
  fill(100,farbe,100);
  textAlign(CENTER);
  text("Solar", 365, height/2);
  
  PFont system;
  system = loadFont("BriemAkademiStd-Regular-48.vlw");
  textFont(system, 18);
  fill(0);
  textAlign(CENTER);
  text("System", 423, height/2);
  
  if (doSave) {
      doSave = false;
      endRecord();
    }

}

void keyPressed() {
  //Save Frame
  if (key== 's') {
    println("Frame abspeichern");
    saveFrame("solarLogo-####.png");
  }

  if (keyCode == ENTER) doSave = true;

}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



