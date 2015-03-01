

import controlP5.*;

ControlP5 cp5;

Accordion accordion;

color c = color(1);

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  gui();
}

void gui() {

  cp5 = new ControlP5(this);


  Group g1 = cp5.addGroup("Variables")
    .setBackgroundColor(color(0, 64))
      .setBackgroundHeight(30)
        ;

  cp5.addSlider("width")
    .setPosition(10, 20)
      .setSize(100, 20)
        .setRange(0, 250)
          .setValue(100)
            .moveTo(g1)
              ;

  cp5.addSlider("height")
    .setPosition(10, 60)
      .setSize(100, 20)
        .setRange(0, 250)
          .setValue(150)
            .moveTo(g1)
              ;

  Group g2 = cp5.addGroup("Line")
    .setBackgroundColor(color(0, 64))
      .setBackgroundHeight(190)
        ;

  cp5.addSlider("Thickness")
    .setPosition(10, 20)
      .setSize(130, 20)
        .setRange(0, 30)
          .setValue(3)
            .setNumberOfTickMarks(16)
              .moveTo(g2)
                ;

  cp5.addRadioButton("radio")
    .setPosition(10, 60)
      .setItemWidth(20)
        .setItemHeight(20)
          .addItem("black", 0)
            .addItem("red", 1)
              .addItem("green", 2)
                .addItem("blue", 3)
                  .addItem("grey", 4)
                    .setColorLabel(color(255))
                      .activate(0)
                        .moveTo(g2)
                          ;

  Group g3 = cp5.addGroup("spacing")
    .setBackgroundColor(color(0, 64))
      .setBackgroundHeight(30)
        ;

  cp5.addSlider("letterspace")
    .setPosition(10, 20)
      .setSize(100, 20)
        .setRange(0, 250)
          .setValue(150)
            .moveTo(g3)
              ;
  cp5.addSlider("leading")
    .setPosition(10, 60)
      .setSize(100, 20)
        .setRange(0, 250)
          .setValue(150)
            .moveTo(g3)
              ;


  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
    .setPosition(550, 40)
      .setWidth(200)
        .addItem(g1)
          .addItem(g2)
            .addItem(g3)
              ;

  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.open(0, 1, 2);
    }
  }
  , 'o');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.close(0, 1, 2);
    }
  }
  , 'c');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setWidth(300);
    }
  }
  , '1');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setPosition(0, 0);
      accordion.setItemHeight(190);
    }
  }
  , '2'); 
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setCollapseMode(ControlP5.ALL);
    }
  }
  , '3');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setCollapseMode(ControlP5.SINGLE);
    }
  }
  , '4');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      cp5.remove("myGroup1");
    }
  }
  , '0');

  accordion.open(0, 1, 2);

  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);

  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
}

void radio(int theC) {
  switch(theC) {
    case(0):
    c=color(0, 0, 0);
    break;
    case(1):
    c=color(255, 64, 75);
    break;
    case(2):
    c=color(0, 183, 160);
    break;
    case(3):
    c=color(0, 210, 220);
    break;
    case(4):
    c=color(135, 135, 135);
    break;
  }
} 

void lettera() { 
  float f = cp5.getController("Thickness").getValue();
  float s1 = cp5.getController("width").getValue();
  float s2 = cp5.getController("height").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(PROJECT);
  beginShape();
  vertex(0, 0+s2);
  vertex(0, 0+s2*0.2);
  vertex(0+s1*0.33, 0);
  vertex(0+s1*0.66, 0);
  vertex(0+s1, 0+s2*0.2);
  vertex(0+s1, 0+s2);
  endShape();
  beginShape();
  vertex(0, 0+s2*0.4);
  vertex(0+s1, 0+s2*0.4);
  endShape();
}

void letterb() { 
  float f = cp5.getController("Thickness").getValue();
  float s1 = cp5.getController("width").getValue();
  float s2 = cp5.getController("height").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  beginShape();
  vertex(0, 0+s2);
  vertex(0, 0);
  vertex(0+s1*0.66, 0);
  vertex(0+s1, 0+s2*0.2);
  vertex(0+s1, 0+s2*0.8);
  vertex(0+s1*0.66,0+s2);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0+s2*0.4);
  vertex(0+s1, 0+s2*0.4);
  endShape();
}

void letterc() { 
  float f = cp5.getController("Thickness").getValue();
  float s1 = cp5.getController("width").getValue();
  float s2 = cp5.getController("height").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  beginShape();
  vertex(0+s1, 0+s2*0.8);
  vertex(0+s1*0.66,0+s2);
  vertex(0+s1*0.33, 0+s2);
  vertex(0,0+s2*0.8);
  vertex(0,0+s2*0.2);
  vertex(0+s1*0.33, 0);
  vertex(0+s1*0.66, 0);
  vertex(0+s1, 0+s2*0.2);
  endShape();
}


void draw() {
  float space = cp5.getController("letterspace").getValue();
  background(220);
  pushMatrix();
  translate(50,50);
  lettera();
  translate(space, 0);
  letterb();
  translate(space, 0);
  letterc();
  popMatrix();
}




