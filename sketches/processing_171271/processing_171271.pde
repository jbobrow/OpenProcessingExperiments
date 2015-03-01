
import controlP5.*;

ControlP5 controlP5;

color c = color(0, 210, 220);
color c2 = color(0, 210, 220);
boolean serifs = false;
boolean fill = false;
boolean duplicate = false;
boolean alternate = false;
boolean dotted = false;
boolean regular = true;
boolean stripes = false;
boolean triplicate = false;
boolean delete = false;
boolean deco = false;

void setup() {
  size(1200, 700);
  noStroke();
  smooth();

  controlP5 = new ControlP5(this);


  PFont p = createFont("Verdana", 9);
  controlP5.setControlFont(p);

  controlP5.setColorForeground(#A1A1A1);
  controlP5.setColorBackground(#E1E1E1);
  controlP5.setColorLabel(#A1A1A1);
  controlP5.setColorValue(#FFFFFF);
  controlP5.setColorActive(#A1A1A1);

  controlP5.addSlider("width")
    .setPosition(950, 50)
      .setSize(150, 20)
        .setRange(0, 200)
          .setValue(65)
            ;

  controlP5.addSlider("height")
    .setPosition(950, 80)
      .setSize(150, 20)
        .setRange(0, 200)
          .setValue(65)
            ;

  controlP5.addSlider("Thickness")
    .setPosition(950, 110)
      .setSize(150, 20)
        .setRange(0,20)
          .setValue(3)
            ;

  controlP5.addSlider("SerifThickness")
    .setPosition(950, 140)
      .setSize(150, 20)
        .setRange(0, 20)
          .setValue(3)
            ;

  controlP5.addSlider("destruct")
    .setPosition(950, 170)
      .setSize(150, 20)
        .setRange(-30, 30)
          .setValue(0)
            ;

  controlP5.addSlider("letterspace")
    .setPosition(950, 200)
      .setSize(150, 20)
        .setRange(-30, 100)
          .setValue(35)
            ;

  controlP5.addSlider("leading")
    .setPosition(950, 230)
      .setSize(150, 20)
        .setRange(-30, 100)
          .setValue(30)
            ;

  controlP5.addSlider("styles")
    .setPosition(950, 260)
      .setSize(150, 20)
        .setRange(1, 12)
          .setValue(1)
            .setNumberOfTickMarks(12)
              ;

  controlP5.addSlider("add-ons")
    .setPosition(950, 290)
      .setSize(150, 20)
        .setRange(0, 20)
          .setValue(0)
            .setNumberOfTickMarks(21)
              ;


  controlP5.addRadioButton("radio")
    .setPosition(950, 340)
      .setItemWidth(15)
        .setItemHeight(15)
          .setSpacingRow(5)
            .addItem("black", 0)
              .addItem("grey", 1)
                .addItem("blue", 2)
                  .addItem("magenta", 3)
                    .addItem("yellow", 4)
                      .activate(2)
                        ;

  controlP5.addRadioButton("radio2")
    .setPosition(1030, 340)
      .setItemWidth(15)
        .setItemHeight(15)
          .setSpacingRow(5)
            .addItem("black ", 0)
              .addItem("grey ", 1)
                .addItem("blue ", 2)
                  .addItem("magenta ", 3)
                    .addItem("yellow ", 4)
                      .activate(2)
                        ;


  controlP5.addToggle("serifs")
    .setPosition(950, 460)
      .setSize(15, 15)
        .setValue(false)
          ;

  controlP5.addToggle("fill")
    .setPosition(1030, 460)
      .setSize(15, 15)
        .setValue(false)
          ;

  controlP5.addToggle("duplicate")
    .setPosition(950, 495)
      .setSize(15, 15)
        .setValue(false)
          ;

  controlP5.addToggle("triplicate")
    .setPosition(1030, 495)
      .setSize(15, 15)
        .setValue(false)
          ;

  controlP5.addToggle("stripes")
    .setPosition(950, 530)
      .setSize(15, 15)
        .setValue(false)
          ;

  controlP5.addToggle("deco")
    .setPosition(1030, 530)
      .setSize(15, 15)
        .setValue(false)
          ;

  controlP5.addSlider("textoptions")
    .setPosition(500, 650)
      .setSize(40, 15)
        .setRange(0, 3)
          .setValue(1)
            .setNumberOfTickMarks(4)
              ;

  controlP5.getController("styles").getValueLabel().setVisible(false);
  controlP5.getController("add-ons").getValueLabel().setVisible(false);
  controlP5.getController("textoptions").getValueLabel().setVisible(false);
  controlP5.getController("textoptions").getCaptionLabel().setVisible(false);
}

void radio(int theC) {
  switch(theC) {
    case(0):
    c=color(77, 77, 77);
    break;
    case(1):
    c=color(172, 172, 172);
    break;
    case(2):
    c=color(0, 210, 220);
    break;
    case(3):
    c=color(239, 88, 160);
    break;
    case(4):
    c=color(255, 220, 29);
    break;
  }
} 

void radio2(int theC) {
  switch(theC) {
    case(0):
    c2=color(77, 77, 77);
    break;
    case(1):
    c2=color(172, 172, 172);
    break;
    case(2):
    c2=color(0, 210, 220);
    break;
    case(3):
    c2=color(239, 88, 160);
    break;
    case(4):
    c2=color(255, 229, 29);
    break;
  }
} 

void lettera() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2);
  vertex(0, s2-0.75*f);
  vertex(s1-f, 0);
  vertex(s1, 0.6*f);
  vertex(0.75*f, s2);
  endShape(CLOSE);
  beginShape();
  vertex(s1+d, 0);
  vertex(s1-f+d, 0);
  vertex(s1-f+d, s2);
  vertex(s1+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.4+d, s2*0.6);
  vertex(s1+d, s2*0.6);
  vertex(s1+d, s2*0.6+f);
  vertex(s1*0.4-f+d, s2*0.6+f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1, 0.6*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1-f, s2+s2*0.2);
    vertex(s1, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.4, s2*0.6+s2*0.2);
    vertex(s1, s2*0.6+s2*0.2);
    vertex(s1, s2*0.6+f+s2*0.2);
    vertex(s1*0.4-f, s2*0.6+f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1-f, 0+s2*0.4);
    vertex(s1, 0.6*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.4);
    vertex(s1-f, 0+s2*0.4);
    vertex(s1-f, s2+s2*0.4);
    vertex(s1, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.4, s2*0.6+s2*0.4);
    vertex(s1, s2*0.6+s2*0.4);
    vertex(s1, s2*0.6+f+s2*0.4);
    vertex(s1*0.4-f, s2*0.6+f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, s2-0.75*f);
    vertex(s1-f, 0);
    vertex(s1, 0);
    vertex(s1, s2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettera_m() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1+d, s2);
  vertex(s1+d, s2-0.75*f);
  vertex(f+d, 0);
  vertex(0+d, 0.6*f);
  vertex(s1-0.75*f+d, s2);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0);
  vertex(f, 0);
  vertex(f, s2);
  vertex(0, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2*0.6);
  vertex(s1*0.6, s2*0.6);
  vertex(s1*0.6+f, s2*0.6+f);
  vertex(0, s2*0.6+f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1, s2+s2*0.2);
    vertex(s1, s2-0.75*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(0, 0.6*f+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2*0.6+s2*0.2);
    vertex(s1*0.6, s2*0.6+s2*0.2);
    vertex(s1*0.6+f, s2*0.6+f+s2*0.2);
    vertex(0, s2*0.6+f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1, s2+s2*0.4);
    vertex(s1, s2-0.75*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(0, 0.6*f+s2*0.4);
    vertex(s1-0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2*0.6+s2*0.4);
    vertex(s1*0.6, s2*0.6+s2*0.4);
    vertex(s1*0.6+f, s2*0.6+f+s2*0.4);
    vertex(0, s2*0.6+f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(f, 0);
    vertex(s1, s2-0.75*f);
    vertex(s1, s2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, HALF_PI, PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettera_malt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1+d, s2);
  vertex(s1+d, s2-0.75*f);
  vertex(f+d, 0);
  vertex(0+d, 0.6*f);
  vertex(s1-0.75*f+d, s2);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0);
  vertex(f, 0);
  vertex(f, s2);
  vertex(0, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.6+d, s2*0.6);
  vertex(0+d, s2-0.75*f);
  vertex(0+f+d, s2);
  vertex(s1*0.6+0.75*f+d, s2*0.6+0.75*f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1, s2+s2*0.2);
    vertex(s1, s2-0.75*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(0, 0.6*f+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0+d, 0+d+s2*0.2);
    vertex(f+d, 0+d+s2*0.2);
    vertex(f+d, s2+d+s2*0.2);
    vertex(0+d, s2+d+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.6, s2*0.6+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(0+f, s2+s2*0.2);
    vertex(s1*0.6+0.75*f, s2*0.6+0.75*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1, s2+s2*0.4);
    vertex(s1, s2-0.75*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(0, 0.6*f+s2*0.4);
    vertex(s1-0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0+d, 0+d+s2*0.4);
    vertex(f+d, 0+d+s2*0.4);
    vertex(f+d, s2+d+s2*0.4);
    vertex(0+d, s2+d+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.6, s2*0.6+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(0+f, s2+s2*0.4);
    vertex(s1*0.6+0.75*f, s2*0.6+0.75*f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(f, 0);
    vertex(s1, s2-0.75*f);
    vertex(s1, s2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void letteraalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2);
  vertex(0, s2-0.75*f);
  vertex(s1-f, 0);
  vertex(s1, 0.6*f);
  vertex(0.75*f, s2);
  endShape(CLOSE);
  beginShape();
  vertex(s1+d, 0);
  vertex(s1-f+d, 0);
  vertex(s1-f+d, s2);
  vertex(s1+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.4+d, s2*0.6);
  vertex(s1+d, s2-0.75*f);
  vertex(s1-f+d, s2);
  vertex(s1*0.4-0.75*f+d, s2*0.6+0.75*f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1, 0.6*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1-f, s2+s2*0.2);
    vertex(s1, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.4, s2*0.6+s2*0.2);
    vertex(s1, s2-0.75*f+s2*0.2);
    vertex(s1-f, s2+s2*0.2);
    vertex(s1*0.4-0.75*f, s2*0.6+0.75*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1-f, 0+s2*0.4);
    vertex(s1, 0.6*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.4);
    vertex(s1-f, 0+s2*0.4);
    vertex(s1-f, s2+s2*0.4);
    vertex(s1, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.4, s2*0.6+s2*0.4);
    vertex(s1, s2-0.75*f+s2*0.4);
    vertex(s1-f, s2+s2*0.4);
    vertex(s1*0.4-0.75*f, s2*0.6+0.75*f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, s2-0.75*f);
    vertex(s1-f, 0);
    vertex(s1, 0);
    vertex(s1, s2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteradotted() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, s2, f, f);
  ellipse(s1, 0, f, f);
  ellipse(s1, s2, f, f);
  ellipse(s1, s2, f, f);
  ellipse(s1, s2*0.8, f, f);
  ellipse(s1, s2*0.6, f, f);
  ellipse(s1, s2*0.4, f, f);
  ellipse(s1, s2*0.2, f, f);
  ellipse(s1*0.80, s2*0.2, f, f);
  ellipse(s1*0.60, s2*0.4, f, f);
  ellipse(s1*0.40, s2*0.6, f, f);
  ellipse(s1*0.20, s2*0.8, f, f);
  ellipse(s1*0.60, s2*0.6, f, f);
  ellipse(s1*0.80, s2*0.6, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1, 0.6*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1-f, s2+s2*0.2);
    vertex(s1, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.4, s2*0.6+s2*0.2);
    vertex(s1, s2*0.6+s2*0.2);
    vertex(s1, s2*0.6+f+s2*0.2);
    vertex(s1*0.4-f, s2*0.6+f+s2*0.2);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.8, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.80, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);
    ellipse(s1*0.60, s2, f, f);
    ellipse(s1*0.80, s2, f, f);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
}

void lettera_mdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1, s2, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1, s2+s2*0.2);
    vertex(s1, s2-0.75*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(0, 0.6*f+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+d+s2*0.2);
    vertex(f, 0+d+s2*0.2);
    vertex(f, s2+d+s2*0.2);
    vertex(0, s2+d+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2*0.6+s2*0.2);
    vertex(s1*0.6, s2*0.6+s2*0.2);
    vertex(s1*0.6+f, s2*0.6+f+s2*0.2);
    vertex(0, s2*0.6+f+s2*0.2);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.2, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);
    ellipse(s1*0.60, s2, f, f);
    ellipse(s1*0.80, s2, f, f);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, HALF_PI, PI);
  }
}

void letteradel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2);
  vertex(0, s2-0.75*f);
  vertex(s1-f, 0);
  vertex(s1, 0.6*f);
  vertex(0.75*f, s2);
  endShape(CLOSE);
  beginShape();
  vertex(s1+d, 0);
  vertex(s1-f+d, 0);
  vertex(s1-f+d, s2);
  vertex(s1+d, s2);
  endShape(CLOSE); 
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1, 0.6*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.2);
    vertex(s1-f, 0+s2*0.2);
    vertex(s1-f, s2+s2*0.2);
    vertex(s1, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1-f, 0+s2*0.4);
    vertex(s1, 0.6*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1, 0+s2*0.4);
    vertex(s1-f, 0+s2*0.4);
    vertex(s1-f, s2+s2*0.4);
    vertex(s1, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, s2-0.75*f);
    vertex(s1-f, 0);
    vertex(s1, 0);
    vertex(s1, s2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettera_mdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1+d, s2);
  vertex(s1+d, s2-0.75*f);
  vertex(f+d, 0);
  vertex(0+d, 0.6*f);
  vertex(s1-0.75*f+d, s2);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0);
  vertex(f, 0);
  vertex(f, s2);
  vertex(0, s2);
  endShape(CLOSE); 
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1, s2+s2*0.2);
    vertex(s1, s2-0.75*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(0, 0.6*f+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0+d, 0+d+s2*0.2);
    vertex(f+d, 0+d+s2*0.2);
    vertex(f+d, s2+d+s2*0.2);
    vertex(0+d, s2+d+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1, s2+s2*0.4);
    vertex(s1, s2-0.75*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(0, 0.6*f+s2*0.4);
    vertex(s1-0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0+d, 0+d+s2*0.4);
    vertex(f+d, 0+d+s2*0.4);
    vertex(f+d, s2+d+s2*0.4);
    vertex(0+d, s2+d+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(f, 0);
    vertex(s1, s2-0.75*f);
    vertex(s1, s2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1-s1*0.1-f, s2);
    vertex(s1+s1*0.1, s2);
    vertex(s1+s1*0.1, s2-fs);
    vertex(s1-s1*0.1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterb() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2);
  vertex(s1*0.5+d, s2);
  vertex(s1*0.5+d, s2-f);
  vertex(0+d, s2-f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5-f);
  vertex(0+d, s2*0.5-f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2);
    endShape(CLOSE);
    arc(s1*0.5, s2*0.75+0.5*f-f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5-f+s2*0.2);
    vertex(0, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.2, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    vertex(s1*0.5, s2-f+s2*0.4);
    vertex(0, s2-f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5-f+s2*0.4);
    vertex(0, s2*0.5-f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.4, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.75+0.5*f-f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5+d, s2*0.25, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void letterbalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2*0.5-0.5*f);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, s2*0.5-0.5*f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2);
  vertex(s1*0.5+d, s2);
  vertex(s1*0.5+d, s2-f);
  vertex(0+d, s2-f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5-f);
  vertex(0+d, s2*0.5-f);
  endShape(CLOSE);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.5-0.5*f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5-f+s2*0.2);
    vertex(0, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.2, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, s2*0.5-0.5*f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    vertex(s1*0.5, s2-f+s2*0.4);
    vertex(0, s2-f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5-f+s2*0.4);
    vertex(0, s2*0.5-f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.4, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2);
    endShape(CLOSE);
    arc(s1*0.5, s2*0.75+0.5*f-f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.75+0.5*f-f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5+d, s2*0.25, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterbdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2*0.6, f, f);  
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);  
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5-f+s2*0.2);
    vertex(0, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.2, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterbdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2);
  vertex(s1*0.5+d, s2);
  vertex(s1*0.5+d, s2-f);
  vertex(0+d, s2-f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5-f);
  vertex(0+d, s2*0.5-f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2);
    endShape(CLOSE);
    arc(s1*0.5, s2*0.75+0.5*f-f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5-f+s2*0.2);
    vertex(0, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.2, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    vertex(s1*0.5, s2-f+s2*0.4);
    vertex(0, s2-f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5-f+s2*0.4);
    vertex(0, s2*0.5-f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.75+0.5*f-f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.25+s2*0.4, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.75+0.5*f-f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5+d, s2*0.25, s1*0.5-f, s2*0.5-f, PI+HALF_PI, TWO_PI+HALF_PI);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterc() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, QUARTER_PI, HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, PI+HALF_PI+QUARTER_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.5, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
    beginShape();
    vertex(s1*0.85, s2*0.15);
    vertex(s1*0.85, s2*0.85);
    vertex(s1*0.5, s2*0.85);
    vertex(s1*0.5, s2*0.15);
    endShape(CLOSE);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettercalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI+QUARTER_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, HALF_PI, PI+HALF_PI+QUARTER_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);   
    beginShape();
    vertex(s1*0.85, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(s1*0.85, s2-f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, HALF_PI, PI+HALF_PI+QUARTER_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);   
    beginShape();
    vertex(s1*0.85, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    vertex(s1*0.5, s2-f+s2*0.4);
    vertex(s1*0.85, s2-f+s2*0.4);
    endShape(CLOSE);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.5, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
    beginShape();
    vertex(s1*0.85, s2*0.15);
    vertex(s1*0.85, s2*0.85);
    vertex(s1*0.5, s2*0.85);
    vertex(s1*0.5, s2*0.15);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2*0.85);
    vertex(s1*0.85, s2);
    vertex(s1*0.5, s2);
    endShape(CLOSE);
  }
  beginShape();
  vertex(s1*0.85+d, s2);
  vertex(s1*0.5+d, s2);
  vertex(s1*0.5+d, s2-f);
  vertex(s1*0.85+d, s2-f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettercdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.2, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
}

void lettercdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, QUARTER_PI, HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5+d, s2*0.5+s2*0.2, s1-f, s2-f, QUARTER_PI, HALF_PI);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, HALF_PI, PI+HALF_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.49, s2+s2*0.2);
    vertex(s1*0.51, s2+s2*0.2);
    vertex(s1*0.51, s2-f+s2*0.2);
    vertex(s1*0.49, s2-f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5+d, s2*0.5+s2*0.4, s1-f, s2-f, QUARTER_PI, HALF_PI);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, HALF_PI, PI+HALF_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.49, s2+s2*0.4);
    vertex(s1*0.51, s2+s2*0.4);
    vertex(s1*0.51, s2-f+s2*0.4);
    vertex(s1*0.49, s2-f+s2*0.4);
    endShape(CLOSE);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5+d, s2*0.5, s1-f, s2-f, QUARTER_PI, PI+HALF_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterd() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.25+d, 0);
  vertex(s1*0.25+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.25+d, s2-f);
  vertex(s1*0.25+d, s2);
  vertex(0+d, s2);
  endShape(CLOSE); 
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.25, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.26, s2);
    vertex(s1*0.26, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.25, 0+s2*0.2);
    vertex(s1*0.25, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.25, s2-f+s2*0.2);
    vertex(s1*0.25, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE); 
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.25, s2*0.5+s2*0.2, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.25, 0+s2*0.4);
    vertex(s1*0.25, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.25, s2-f+s2*0.4);
    vertex(s1*0.25, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE); 
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.25, s2*0.5+s2*0.4, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.25+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterdalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.25+d, 0);
  vertex(s1*0.25+d, s2);
  vertex(s1*0.25+f+d, s2-f);
  vertex(s1*0.25+f+d, f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.25, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.26, s2);
    vertex(s1*0.26, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.25, 0+s2*0.2);
    vertex(s1*0.25, s2+s2*0.2);
    vertex(s1*0.25+f, s2+s2*0.2);
    vertex(s1*0.25+f, 0+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    arc(s1*0.25, s2*0.5+s2*0.2, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.25, 0+s2*0.4);
    vertex(s1*0.25, s2+s2*0.4);
    vertex(s1*0.25+f, s2+s2*0.4);
    vertex(s1*0.25+f, 0+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    arc(s1*0.25, s2*0.5+s2*0.4, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  arc(s1*0.25+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterddotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f); 
  ellipse(s1*0.6, s2*0.2, f, f); 
  ellipse(s1*0.8, s2*0.4, f, f); 
  ellipse(s1*0.8, s2*0.6, f, f); 
  ellipse(s1*0.6, s2*0.8, f, f); 
  ellipse(s1*0.2, s2, f, f);
  ellipse(s1*0.4, s2, f, f);  
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.25, 0+s2*0.2);
    vertex(s1*0.25, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.25, s2-f+s2*0.2);
    vertex(s1*0.25, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE); 
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.25, s2*0.5+s2*0.2, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterddel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.25+d, 0);
  vertex(s1*0.25+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.25+d, s2-f);
  vertex(s1*0.25+d, s2);
  vertex(0+d, s2);
  endShape(CLOSE); 
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.25, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.26, s2);
    vertex(s1*0.26, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.25, 0+s2*0.2);
    vertex(s1*0.25, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.25, s2-f+s2*0.2);
    vertex(s1*0.25, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE); 
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.25, s2*0.5+s2*0.2, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.25, 0+s2*0.4);
    vertex(s1*0.25, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.25, s2-f+s2*0.4);
    vertex(s1*0.25, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE); 
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.25, s2*0.5+s2*0.4, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.25+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void lettere() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);  
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+d, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.75+d, s2-f);
  vertex(s1*0.75+d, s2);
  vertex(0+d, s2);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2*0.5+0.5*f);
    vertex(s1*0.75, s2*0.5+0.5*f);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    vertex(s1*0.75, s2*0.8-0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterealt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2*0.5);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, s2*0.5);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);  
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+d, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2-f);
  vertex(s1*0.75, s2-f);
  vertex(s1*0.75, s2);
  vertex(0, s2);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, f);
  vertex(s1*0.6-0.5*f+d, s2*0.5+0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(f*0.5+d, 0);
  endShape(CLOSE); 
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, f+s2*0.2);
    vertex(s1*0.6-0.5*f, s2*0.5+0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(f*0.5, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, s2*0.5+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, f+s2*0.4);
    vertex(s1*0.6-0.5*f, s2*0.5+0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(f*0.5, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2*0.5-f*0.5);
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2*0.5-f*0.5);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    vertex(s1*0.75, s2*0.8-0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteredotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2, f, f);
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    vertex(s1*0.75, s2*0.8-0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letteredel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);  
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+d, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.75+d, s2-f);
  vertex(s1*0.75+d, s2);
  vertex(0+d, s2);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2*0.5+0.5*f);
    vertex(s1*0.75, s2*0.5+0.5*f);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    vertex(s1*0.75, s2*0.8-0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterf() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);  
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2*0.5+0.5*f);
    vertex(s1*0.75, s2*0.5+0.5*f);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterfdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterfalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2*0.5);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, s2*0.5);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, f);
  vertex(s1*0.6-0.5*f+d, s2*0.5+0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(f*0.5+d, 0);
  endShape(CLOSE); 
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);  
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, f+s2*0.2);
    vertex(s1*0.6-0.5*f, s2*0.5+0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(f*0.5, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, s2*0.5+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, f+s2*0.4);
    vertex(s1*0.6-0.5*f, s2*0.5+0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(f*0.5, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2*0.5+0.5*f);
    vertex(s1*0.75, s2*0.5+0.5*f);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterfdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5-0.5*f);
  vertex(s1*0.6+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);  
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.6, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2*0.5+0.5*f);
    vertex(s1*0.75, s2*0.5+0.5*f);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.75-fs, 0);
    vertex(s1*0.75-fs, s2*0.2+0.5*f);
    vertex(s1*0.75, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.6, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.4-0.5*f);
    vertex(s1*0.6-fs, s2*0.6+0.5*f);
    vertex(s1*0.6, s2*0.6+0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterg() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, QUARTER_PI, HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, PI+HALF_PI+QUARTER_PI);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.85+d, s2*0.85);
  vertex(s1*0.85+d, s2*0.5);
  vertex(s1*0.85-f+d, s2*0.5);
  vertex(s1*0.85-f+d, s2*0.85);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.85+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(s1*0.85+d, s2*0.5+f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.5, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
    beginShape();
    vertex(s1*0.85, s2*0.15);
    vertex(s1*0.85, s2);
    vertex(s1*0.5, s2);
    vertex(s1*0.5, s2*0.15);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2*0.85+s2*0.2);
    vertex(s1*0.85, s2*0.5+s2*0.2);
    vertex(s1*0.85-f, s2*0.5+s2*0.2);
    vertex(s1*0.85-f, s2*0.85+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(s1*0.85, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2*0.85+s2*0.4);
    vertex(s1*0.85, s2*0.5+s2*0.4);
    vertex(s1*0.85-f, s2*0.5+s2*0.4);
    vertex(s1*0.85-f, s2*0.85+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(s1*0.85, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettergalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI+QUARTER_PI);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.85+d, s2);
  vertex(s1*0.85+d, s2*0.5);
  vertex(s1*0.85-f+d, s2*0.5);
  vertex(s1*0.85-f+d, s2);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.85+d, s2);
  vertex(s1*0.5+d, s2);
  vertex(s1*0.5+d, s2-f);
  vertex(s1*0.85+d, s2-f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.5, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
    beginShape();
    vertex(s1*0.85, s2*0.15);
    vertex(s1*0.85, s2*0.85);
    vertex(s1*0.5, s2*0.85);
    vertex(s1*0.5, s2*0.15);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2*0.85);
    vertex(s1*0.85, s2);
    vertex(s1*0.5, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, HALF_PI, PI+HALF_PI+QUARTER_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2+s2*0.2);
    vertex(s1*0.85, s2*0.5+s2*0.2);
    vertex(s1*0.85-f, s2*0.5+s2*0.2);
    vertex(s1*0.85-f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(s1*0.85, s2-f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, HALF_PI, PI+HALF_PI+QUARTER_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2+s2*0.4);
    vertex(s1*0.85, s2*0.5+s2*0.4);
    vertex(s1*0.85-f, s2*0.5+s2*0.4);
    vertex(s1*0.85-f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    vertex(s1*0.5, s2-f+s2*0.4);
    vertex(s1*0.85, s2-f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettergdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.2, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2*0.85+s2*0.2);
    vertex(s1*0.85, s2*0.5+s2*0.2);
    vertex(s1*0.85-f, s2*0.5+s2*0.2);
    vertex(s1*0.85-f, s2*0.85+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(s1*0.85, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
}

void lettergdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, QUARTER_PI, HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, PI+HALF_PI+QUARTER_PI);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.85+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(s1*0.85+d, s2*0.5+f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.5, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
    beginShape();
    vertex(s1*0.85, s2*0.15);
    vertex(s1*0.85, s2);
    vertex(s1*0.5, s2);
    vertex(s1*0.5, s2*0.15);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(s1*0.85, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.85, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(s1*0.85, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.85, 0);
    vertex(s1*0.85-fs, 0);
    vertex(s1*0.85-fs, s2*0.2+0.5*f);
    vertex(s1*0.85, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.85, s2);
    vertex(s1*0.85-fs, s2);
    vertex(s1*0.85-fs, s2*0.8-0.5*f);
    vertex(s1*0.85, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.25*f, 0+0.25*f, s1, s2, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterh() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-f+d, s2);
  vertex(s1*0.75-f+d, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.75+d, s2*0.5-0.5*f);
  vertex(s1*0.75+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2*0.5);
    vertex(s1*0.75, s2*0.5);
    vertex(s1*0.75, s2);
    vertex(0, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.2, s1*0.6, s2*0.6, 0, HALF_PI);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterhalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-f+d, s2);
  vertex(s1*0.75-f+d, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.55-0.5*f);
  vertex(s1*0.75+d, s2*0.55-0.5*f);
  vertex(s1*0.75+d, s2*0.55+0.5*f);
  vertex(0+d, s2*0.55+0.5*f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.35-0.5*f);
  vertex(s1*0.75+d, s2*0.35-0.5*f);
  vertex(s1*0.75+d, s2*0.35+0.5*f);
  vertex(0+d, s2*0.35+0.5*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2*0.5);
    vertex(s1*0.75, s2*0.5);
    vertex(s1*0.75, s2);
    vertex(0, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.55-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.55-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.55+0.5*f+s2*0.2);
    vertex(0, s2*0.55+0.5*f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.35-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.35-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.35+0.5*f+s2*0.2);
    vertex(0, s2*0.35+0.5*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.55-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.55-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.55+0.5*f+s2*0.4);
    vertex(0, s2*0.55+0.5*f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.35-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.35-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.35+0.5*f+s2*0.4);
    vertex(0, s2*0.35+0.5*f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.25, s1*0.6, s2*0.6, 0, HALF_PI);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterhdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2*0.6, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.8, s2, f, f);
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);
    ellipse(s1*0.60, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.2, s1*0.6, s2*0.6, 0, HALF_PI);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterhdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.75+d, s2*0.5-0.5*f);
  vertex(s1*0.75+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2*0.5);
    vertex(s1*0.75, s2*0.5);
    vertex(s1*0.75, s2);
    vertex(0, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.2, s1*0.6, s2*0.6, 0, HALF_PI);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteri() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteridotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterj() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(s1*0.5, 0);
  vertex(s1*0.5, f);
  vertex(0, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, s2*0.51);
  vertex(s1*0.5-f+d, s2*0.51);
  vertex(s1*0.5-f+d, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(0, s2*0.5, s1-f, s2-f, 0, HALF_PI);
    beginShape();
    vertex(0, 0);
    vertex(s1*0.5, 0);
    vertex(s1*0.5, s2*0.51);  
    vertex(0, s2*0.51);  
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, s2*0.51+s2*0.2);
    vertex(s1*0.5-f, s2*0.51+s2*0.2);
    vertex(s1*0.5-f, 0+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(MITER);
    arc(0, s2*0.5+s2*0.2, s1-f, s2-f, 0, HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, s2*0.51+s2*0.4);
    vertex(s1*0.5-f, s2*0.51+s2*0.4);
    vertex(s1*0.5-f, 0+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(MITER);
    arc(0, s2*0.5+s2*0.4, s1-f, s2-f, 0, HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(MITER);
  arc(0+d, s2*0.5, s1-f, s2-f, 0, HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.0, 0);
    vertex(s1*0.0+fs, 0);
    vertex(s1*0.0+fs, s2*0.2+0.5*f);
    vertex(s1*0.0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.0, s2);
    vertex(s1*0.0+fs, s2-f);
    vertex(s1*0.0+fs, s2*0.8-0.5*f);
    vertex(s1*0.0, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.5-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterjdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.8, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(0, s2, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(0, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(0, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(0, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(0, s2*0.8, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, s2*0.51+s2*0.2);
    vertex(s1*0.5-f, s2*0.51+s2*0.2);
    vertex(s1*0.5-f, 0+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(MITER);
    arc(0, s2*0.5+s2*0.2, s1-f, s2-f, 0, HALF_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.0, 0);
    vertex(s1*0.0+fs, 0);
    vertex(s1*0.0+fs, s2*0.2+0.5*f);
    vertex(s1*0.0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.0, s2);
    vertex(s1*0.0+fs, s2-f);
    vertex(s1*0.0+fs, s2*0.8-0.5*f);
    vertex(s1*0.0, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.5-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void letterjdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(s1*0.5, 0);
  vertex(s1*0.5, f);
  vertex(0, f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(0, s2*0.5, s1-f, s2-f, 0, HALF_PI);
    beginShape();
    vertex(0, 0);
    vertex(s1*0.5, 0);
    vertex(s1*0.5, s2*0.51);  
    vertex(0, s2*0.51);  
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(MITER);
    arc(0, s2*0.5+s2*0.2, s1-f, s2-f, 0, HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(MITER);
    arc(0, s2*0.5+s2*0.4, s1-f, s2-f, 0, HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(MITER);
  arc(0+d, s2*0.5, s1-f, s2-f, 0, HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.0, 0);
    vertex(s1*0.0+fs, 0);
    vertex(s1*0.0+fs, s2*0.2+0.5*f);
    vertex(s1*0.0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.0, s2);
    vertex(s1*0.0+fs, s2-f);
    vertex(s1*0.0+fs, s2*0.8-0.5*f);
    vertex(s1*0.0, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.5-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void letterk() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.4+d, s2*0.35);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  vertex(s1*0.4-0.75*f+d, s2*0.35+0.5*f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f*0.75);
  vertex(f+d, s2*0.75);
  vertex(0+d, s2*0.75-0.5*f);
  vertex(s1*0.75-0.75*f+d, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, 0);
    vertex(s1*0.39, s2*0.37);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.4, s2*0.35+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    vertex(s1*0.4-0.75*f, s2*0.35+0.5*f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f*0.75+s2*0.2);
    vertex(f, s2*0.75+s2*0.2);
    vertex(0, s2*0.75-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.4, s2*0.35+s2*0.4);
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    vertex(s1*0.4-0.75*f, s2*0.35+0.5*f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f*0.75+s2*0.4);
    vertex(f, s2*0.75+s2*0.4);
    vertex(0, s2*0.75-0.5*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterkalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2-f);
  vertex(f, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, f*0.75);
  vertex(0+d, 0);
  vertex(f*0.75+d, 0);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  endShape(CLOSE);
  beginShape();
  vertex(f*0.75+d, s2);
  vertex(0+d, s2);
  vertex(0+d, s2-0.75*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, 0.75*f);  
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.4, s2*0.5);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2-f+s2*0.2);
    vertex(f, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, f*0.75+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(f*0.75, 0+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(f*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);  
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2-f+s2*0.4);
    vertex(f, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, f*0.75+s2*0.4);
    vertex(0, 0+s2*0.4);
    vertex(f*0.75, 0+s2*0.4);
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(f*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, 0.75*f+s2*0.4);  
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterkdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.8, s2, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.60, 0, f, f);
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);
    ellipse(s1*0.60, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.4, s2*0.35+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    vertex(s1*0.4-0.75*f, s2*0.35+0.5*f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f*0.75+s2*0.2);
    vertex(f, s2*0.75+s2*0.2);
    vertex(0, s2*0.75-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterkdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.75+d, 0.75*f);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.25+d, s2*0.5-0.75*f);
  vertex(s1*0.25+d, s2*0.5);
  vertex(s1*0.25+0.75*f+d, s2*0.5);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, s2);
  vertex(s1*0.75, s2-0.75*f);
  vertex(s1*0.25+0.75*f, s2*0.49);
  vertex(s1*0.25, s2*0.49);
  vertex(s1*0.25, s2*0.49+0.75*f);
  vertex(s1*0.75-0.75*f, s2);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, 0);
    vertex(s1*0.325, s2*0.5);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.75+d, 0.75*f+s2*0.2);
    vertex(s1*0.75+d, 0+s2*0.2);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.2);
    vertex(s1*0.25+d, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.25+d, s2*0.5+s2*0.2);
    vertex(s1*0.25+0.75*f+d, s2*0.5+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.25+0.75*f, s2*0.49+s2*0.2);
    vertex(s1*0.25, s2*0.49+s2*0.2);
    vertex(s1*0.25, s2*0.49+0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.75+d, 0.75*f+s2*0.4);
    vertex(s1*0.75+d, 0+s2*0.4);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.4);
    vertex(s1*0.25+d, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.25+d, s2*0.5+s2*0.4);
    vertex(s1*0.25+0.75*f+d, s2*0.5+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(s1*0.25+0.75*f, s2*0.49+s2*0.4);
    vertex(s1*0.25, s2*0.49+s2*0.4);
    vertex(s1*0.25, s2*0.49+0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterl() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.75+d, s2-f);
  vertex(s1*0.75+d, s2);
  vertex(0+d, s2);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(f, 0);
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2-f);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2*0.8-0.5*f);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterlalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, s2-f);
  vertex(s1*0.75, s2-f);
  vertex(s1*0.75, s2);
  vertex(0, s2);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, f*0.25);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2-f);
  vertex(s1*0.75-f*0.5+d, s2);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, f*0.25+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75-f*0.5, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, f*0.25+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75-f*0.5, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(f, 0);
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2-f);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2*0.8-0.5*f);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterldotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2*0.8-0.5*f);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterldel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2*0.5);
  vertex(f, s2*0.5);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.75+d, s2-f);
  vertex(s1*0.75+d, s2);
  vertex(0+d, s2);
  endShape(CLOSE);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2*0.5+s2*0.2);
    vertex(f, s2*0.5+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(0, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2*0.5+s2*0.4);
    vertex(f, s2*0.5+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(0, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(f, 0);
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2-f);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(0, s2);
    vertex(0, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, s2*0.8-0.5*f);
    vertex(s1*0.75-fs, s2*0.8-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettern() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.5*f);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2-0.5*f);
  vertex(s1*0.75-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75-f+d, s2);
  vertex(s1*0.75+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.5*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0.5*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(s1*0.75, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letternalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.75*f);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2*0.5-0.75*f);
  vertex(s1*0.75-f+d, s2*0.5);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75-f+d, s2);
  vertex(s1*0.75+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2*0.5);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.75*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.75-f, s2*0.5+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0.75*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(s1*0.75, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.75-f, s2*0.5+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterndotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2*0.6, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.8, s2, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);  
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.60, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.5*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterndel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.5*f);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, 0.5*f+s2*0.2);
    vertex(f+d, 0+s2*0.2);
    vertex(s1*0.75+d, s2-0.75*f+s2*0.2);
    vertex(s1*0.75+d, s2+s2*0.2);
    vertex(s1*0.75-0.75*f+d, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, 0.5*f+s2*0.4);
    vertex(f+d, 0+s2*0.4);
    vertex(s1*0.75+d, s2-0.75*f+s2*0.4);
    vertex(s1*0.75+d, s2+s2*0.4);
    vertex(s1*0.75-0.75*f+d, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterm() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.5*f);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2-0.5*f);
  vertex(s1*0.75-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-f+d, 0.5*f);
  vertex(s1*0.75+d, 0);
  vertex(s1*1.5-f+d, s2-0.75*f);
  vertex(s1*1.5-f+d, s2);
  vertex(s1*1.5-f-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, 0);
  vertex(s1*0.75-f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74, s2);
    vertex(s1*0.74, 0);
    vertex(s1*1.5-f, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.5*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, 0.5*f+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*1.5-f, s2-0.75*f+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-f-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0.5*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(s1*0.75, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, 0.5*f+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*1.5-f, s2-0.75*f+s2*0.4);
    vertex(s1*1.5-f, s2+s2*0.4);
    vertex(s1*1.5-f-0.75*f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(0+0.75*s1-f, 0);
    vertex(0+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void lettermalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.5*f);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.5-f+d, 0.5*f);
  vertex(s1*0.5+d, 0);
  vertex(s1*1.25-f+d, s2-0.75*f);
  vertex(s1*1.25-f+d, s2);
  vertex(s1*1.25-f-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.5, 0);
  vertex(s1*0.5-f, 0);
  vertex(s1*0.5-f, s2);
  vertex(s1*0.5, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, s2);
    vertex(s1*0.49, 0);
    vertex(s1*1.24-f, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.5*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-f, 0.5*f+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*1.25-f, s2-0.75*f+s2*0.2);
    vertex(s1*1.25-f, s2+s2*0.2);
    vertex(s1*1.25-f-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5-f, 0+s2*0.2);
    vertex(s1*0.5-f, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0.5*f+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-f, 0.5*f+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*1.25-f, s2-0.75*f+s2*0.4);
    vertex(s1*1.25-f, s2+s2*0.4);
    vertex(s1*1.25-f-0.75*f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5-f, 0+s2*0.4);
    vertex(s1*0.5-f, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.51*s1-f, 0);
    vertex(0+0.51*s1-f, 0);
    vertex(0+0.51*s1-f, fs);
    vertex(0-s1*0.1+0.51*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}


void lettermdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*1.2, s2*0.6, f, f);
  ellipse(s1, s2*0.4, f, f);
  ellipse(s1*1.2, s2*0.8, f, f);
  ellipse(s1*1.2, s2, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);  
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.8, f, f);
    ellipse(s1*0.80, s2, f, f);
    ellipse(s1, s2*0.6, f, f);
    ellipse(s1, s2*0.8, f, f);
    ellipse(s1, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.5*f+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, 0.5*f+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*1.5-f, s2-0.75*f+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-f-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(0+0.75*s1-f, 0);
    vertex(0+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterm_m() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2);
  vertex(0+d, s2-0.75*f);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75+d, 0.5*f);
  vertex(0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-f+d, s2-0.5*f);
  vertex(s1*1.5-f-f+d, 0);
  vertex(s1*1.5-f+d, 0.5*f);
  vertex(s1*0.75+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, 0);
  vertex(s1*0.75-f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*1.5-f, 0);
  vertex(s1*1.5-f, s2);
  vertex(s1*1.5-2*f, s2);
  vertex(s1*1.5-2*f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.75, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74, s2);
    vertex(s1*1.5-f, 0);
    vertex(s1*1.5-f, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75, 0.5*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-f, 0+s2*0.2);
    vertex(s1*1.5-f, 0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-2*f, s2+s2*0.2);
    vertex(s1*1.5-2*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75, 0.5*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, s2-0.5*f+s2*0.4);
    vertex(s1*1.5-f-f, 0+s2*0.4);
    vertex(s1*1.5-f, 0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.4);
    vertex(s1*1.5-f, s2+s2*0.4);
    vertex(s1*1.5-2*f, s2+s2*0.4);
    vertex(s1*1.5-2*f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1+s1*0.75+s1*0.1, 0);
    vertex(0+s1*0.75+s1*0.1, 0);
    vertex(0+s1*0.75+s1*0.1, fs);
    vertex(0-s1*0.1+s1*0.75+s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-f, 0);
    vertex(s1*1.5-f+s1*0.1, 0);
    vertex(s1*1.5-f+s1*0.1, fs);
    vertex(s1*1.5-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.5-f-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterm_malt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(f*0.75+d, s2);  
  vertex(0+d, s2);
  vertex(0+d, s2-0.75*f);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75+d, f*0.5);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.5-0.25*f-0.75*f+d, s2-0.75*f);
  vertex(s1*0.5-0.25*f-0.75*f+d, s2);
  vertex(s1*0.5-0.25*f+d, s2);
  vertex(s1*1.25-f+d, 0.5*f);
  vertex(s1*1.25-f-f+d, 0);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, 0);
  vertex(s1*0.75-f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*1.25-f, 0);
  vertex(s1*1.25-f, s2);
  vertex(s1*1.25-f-f, s2);
  vertex(s1*1.25-f-f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, s2);
    vertex(s1*0.49, 0);
    vertex(s1*1.24-f, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(f*0.75, s2+s2*0.2);  
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75, f*0.5+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-0.25*f-0.75*f, s2-0.75*f+s2*0.2);
    vertex(s1*0.5-0.25*f-0.75*f, s2+s2*0.2);
    vertex(s1*0.5-0.25*f, s2+s2*0.2);
    vertex(s1*1.25-f, 0.5*f+s2*0.2);
    vertex(s1*1.25-f-f, 0+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.25-f, 0+s2*0.2);
    vertex(s1*1.25-f, s2+s2*0.2);
    vertex(s1*1.25-f-f, s2+s2*0.2);
    vertex(s1*1.25-f-f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(f*0.75, s2+s2*0.4);  
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75, f*0.5+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-0.25*f-0.75*f, s2-0.75*f+s2*0.4);
    vertex(s1*0.5-0.25*f-0.75*f, s2+s2*0.4);
    vertex(s1*0.5-0.25*f, s2+s2*0.4);
    vertex(s1*1.25-f, 0.5*f+s2*0.4);
    vertex(s1*1.25-f-f, 0+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.25-f, 0+s2*0.4);
    vertex(s1*1.25-f, s2+s2*0.4);
    vertex(s1*1.25-f-f, s2+s2*0.4);
    vertex(s1*1.25-f-f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.75, 0);
    vertex(s1*0.85, 0);
    vertex(s1*0.85, fs);
    vertex(s1*0.75, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.24-f, 0);
    vertex(s1*1.34-f, 0);
    vertex(s1*1.34-f, fs);
    vertex(s1*1.24-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.25-f-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterm_mdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(s1*1.2, 0, f, f);
  ellipse(s1*1.2, s2*0.8, f, f);
  ellipse(s1*1.2, s2*0.6, f, f);
  ellipse(s1*1.2, s2*0.4, f, f);
  ellipse(s1*1.2, s2*0.2, f, f);
  ellipse(s1*1.2, s2, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(0, s2, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.2, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(s1, s2*0.2, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2, f, f);  
    ellipse(s1, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.8, f, f);
    ellipse(s1*0.80, s2, f, f);
    ellipse(s1, s2*0.6, f, f);
    ellipse(s1, s2*0.8, f, f);
    ellipse(s1, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75, 0.5*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-f, 0+s2*0.2);
    vertex(s1*1.5-f, 0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-2*f, s2+s2*0.2);
    vertex(s1*1.5-2*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1+s1*0.75+s1*0.1, 0);
    vertex(0+s1*0.75+s1*0.1, 0);
    vertex(0+s1*0.75+s1*0.1, fs);
    vertex(0-s1*0.1+s1*0.75+s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-f, 0);
    vertex(s1*1.5-f+s1*0.1, 0);
    vertex(s1*1.5-f+s1*0.1, fs);
    vertex(s1*1.5-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.25-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void lettermdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.5*f);
  vertex(f+d, 0);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-0.75*f+d, 0.75*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*1.5-f+d, s2-0.75*f);
  vertex(s1*1.5-f+d, s2);
  vertex(s1*1.5-f-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(0, 0);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74-0.75*f, s2);
    vertex(s1*0.74-0.75*f, 0);
    vertex(s1*1.5-f, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, 0.5*f+s2*0.2);
    vertex(f+d, 0+s2*0.2);
    vertex(s1*0.75+d, s2-0.75*f+s2*0.2);
    vertex(s1*0.75+d, s2+s2*0.2);
    vertex(s1*0.75-0.75*f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-0.75*f+d, 0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.2);
    vertex(s1*0.75+d, 0+s2*0.2);
    vertex(s1*1.5-f+d, s2-0.75*f+s2*0.2);
    vertex(s1*1.5-f+d, s2+s2*0.2);
    vertex(s1*1.5-f-0.75*f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, 0.5*f+s2*0.4);
    vertex(f+d, 0+s2*0.4);
    vertex(s1*0.75+d, s2-0.75*f+s2*0.4);
    vertex(s1*0.75+d, s2+s2*0.4);
    vertex(s1*0.75-0.75*f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-0.75*f+d, 0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.4);
    vertex(s1*0.75+d, 0+s2*0.4);
    vertex(s1*1.5-f+d, s2-0.75*f+s2*0.4);
    vertex(s1*1.5-f+d, s2+s2*0.4);
    vertex(s1*1.5-f-0.75*f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterm_mdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2);
  vertex(0+d, s2-0.75*f);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75-0.25*f+d, 0);
  vertex(s1*0.75-0.25*f+d, 0.75*f);
  vertex(0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-f+d, s2-0.75*f);
  vertex(s1*1.5-f-f+d, 0);
  vertex(s1*1.5-f+d, 0.5*f);
  vertex(s1*0.75-0.25*f+d, s2);
  vertex(s1*0.75-f+d, s2);
  endShape(CLOSE);  
  beginShape();
  vertex(s1*1.5-f, 0);
  vertex(s1*1.5-f, s2);
  vertex(s1*1.5-2*f, s2);
  vertex(s1*1.5-2*f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.75-0.25*f, 0);
    vertex(s1*0.75-0.25*f, s2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74-0.75*f, s2);
    vertex(s1*1.5-f, 0);
    vertex(s1*1.5-f, s2);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, s2+s2*0.2);
    vertex(0+d, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-f+d, 0+s2*0.2);
    vertex(s1*0.75-0.25*f+d, 0+s2*0.2);
    vertex(s1*0.75-0.25*f+d, 0.75*f+s2*0.2);
    vertex(0.75*f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f+d, s2-0.75*f+s2*0.2);
    vertex(s1*1.5-f-f+d, 0+s2*0.2);
    vertex(s1*1.5-f+d, 0.5*f+s2*0.2);
    vertex(s1*0.75-0.25*f+d, s2+s2*0.2);
    vertex(s1*0.75-f+d, s2+s2*0.2);
    endShape(CLOSE);  
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-2*f, s2+s2*0.2);
    vertex(s1*1.5-2*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, s2+s2*0.4);
    vertex(0+d, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-f+d, 0+s2*0.4);
    vertex(s1*0.75-0.25*f+d, 0+s2*0.4);
    vertex(s1*0.75-0.25*f+d, 0.75*f+s2*0.4);
    vertex(0.75*f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f+d, s2-0.75*f+s2*0.4);
    vertex(s1*1.5-f-f+d, 0+s2*0.4);
    vertex(s1*1.5-f+d, 0.5*f+s2*0.4);
    vertex(s1*0.75-0.25*f+d, s2+s2*0.4);
    vertex(s1*0.75-f+d, s2+s2*0.4);
    endShape(CLOSE);  
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.4);
    vertex(s1*1.5-f, s2+s2*0.4);
    vertex(s1*1.5-2*f, s2+s2*0.4);
    vertex(s1*1.5-2*f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*1.5-f, 0);
    vertex(s1*1.5-f+s1*0.1, 0);
    vertex(s1*1.5-f+s1*0.1, fs);
    vertex(s1*1.5-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, s2-fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.5-f-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void lettero() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    ellipse(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    ellipse(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.5, s2*0.5, s1-f, s2-f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteroalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f);
    fill(c);
    strokeWeight(f);
    noStroke();
    beginShape();
    vertex(0, f*0.75+s2*0.2);
    vertex(s1-f*0.75, s2+s2*0.2);
    vertex(s1, s2+s2*0.2);
    vertex(s1, s2-f*0.75+s2*0.2);
    vertex(f*0.75, 0+s2*0.2);
    vertex(0, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f);
    fill(c);
    strokeWeight(f);
    noStroke();
    beginShape();
    vertex(0, f*0.75+s2*0.4);
    vertex(s1-f*0.75, s2+s2*0.4);
    vertex(s1, s2+s2*0.4);
    vertex(s1, s2-f*0.75+s2*0.4);
    vertex(f*0.75, 0+s2*0.4);
    vertex(0, 0+s2*0.4);
    endShape(CLOSE);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.5, s2*0.5, s1-f, s2-f);
  }
  beginShape();
  vertex(0+d, f*0.75);
  vertex(s1-f*0.75+d, s2);
  vertex(s1+d, s2);
  vertex(s1+d, s2-f*0.75);
  vertex(f*0.75+d, 0);
  vertex(0+d, 0);
  endShape(CLOSE);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterodotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.2, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1, s2*0.4, f, f);
  ellipse(s1, s2*0.6, f, f);  
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void letterodel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, TWO_PI, TWO_PI+HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5+d, s2*0.5+s2*0.2, s1-f, s2-f, TWO_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, HALF_PI, PI+HALF_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.49, 0+s2*0.2);
    vertex(s1*0.51, 0+s2*0.2);
    vertex(s1*0.51, f+s2*0.2);
    vertex(s1*0.49, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, s2+s2*0.2);
    vertex(s1*0.51, s2+s2*0.2);
    vertex(s1*0.51, s2-f+s2*0.2);
    vertex(s1*0.49, s2-f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5+d, s2*0.5+s2*0.4, s1-f, s2-f, TWO_PI, TWO_PI+HALF_PI);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, HALF_PI, PI+HALF_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.49, 0+s2*0.4);
    vertex(s1*0.51, 0+s2*0.4);
    vertex(s1*0.51, f+s2*0.4);
    vertex(s1*0.49, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, s2+s2*0.4);
    vertex(s1*0.51, s2+s2*0.4);
    vertex(s1*0.51, s2-f+s2*0.4);
    vertex(s1*0.49, s2-f+s2*0.4);
    endShape(CLOSE);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5+d, s2*0.5, s1-f, s2-f, 0, PI+HALF_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void letterp() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(0+d, s2*0.5+f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI); 
    beginShape();
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2*0.5+0.5*f);
    vertex(0, s2*0.5+0.5*f);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(0, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterpalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2*0.5);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, s2*0.5);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(0+d, s2*0.5+f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI); 
    beginShape();
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2*0.5+0.5*f);
    vertex(0, s2*0.5+0.5*f);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, s2*0.5+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(0, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterpdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);  
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterpdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(0+d, s2*0.5+f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI); 
    beginShape();
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2*0.5+0.5*f);
    vertex(0, s2*0.5+0.5*f);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(0, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterq() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.65+d, s2*0.65);
  vertex(s1*0.65+0.75*f+d, s2*0.65);
  vertex(s1+d, s2-f*0.75);
  vertex(s1+d, s2);
  vertex(s1-0.75*f+d, s2);
  vertex(s1*0.65+d, s2*0.65+0.75*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.5, s2*0.5, s1-f, s2-f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.65, s2*0.65+s2*0.2);
    vertex(s1*0.65+0.75*f, s2*0.65+s2*0.2);
    vertex(s1, s2-f*0.75+s2*0.2);
    vertex(s1, s2+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    vertex(s1*0.65, s2*0.65+0.75*f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.65, s2*0.65+s2*0.4);
    vertex(s1*0.65+0.75*f, s2*0.65+s2*0.4);
    vertex(s1, s2-f*0.75+s2*0.4);
    vertex(s1, s2+s2*0.4);
    vertex(s1-0.75*f, s2+s2*0.4);
    vertex(s1*0.65, s2*0.65+0.75*f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterqalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5+d, s2*0.5, s1-f, s2-f, PI+HALF_PI, TWO_PI+HALF_PI);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.5+d, s2);
  vertex(s1*0.5+d, s2-f);
  vertex(s1+d, s2-f);
  vertex(s1+d, s2);
  endShape(CLOSE);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.49, 0);
  vertex(s1*0.51, 0);
  vertex(s1*0.51, f);
  vertex(s1*0.49, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.49, s2);
  vertex(s1*0.51, s2);
  vertex(s1*0.51, s2-f);
  vertex(s1*0.49, s2-f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.5, s2*0.5, s1-f, s2-f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5, s2+s2*0.2);
    vertex(s1*0.5, s2-f+s2*0.2);
    vertex(s1, s2-f+s2*0.2);
    vertex(s1, s2+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5, s2+s2*0.4);
    vertex(s1*0.5, s2-f+s2*0.4);
    vertex(s1, s2-f+s2*0.4);
    vertex(s1, s2+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterqdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.2, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1, s2*0.4, f, f);
  ellipse(s1, s2*0.6, f, f);  
  ellipse(s1, s2, f, f);    
  ellipse(s1*0.6, s2*0.6, f, f);    
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.65, s2*0.65+s2*0.2);
    vertex(s1*0.65+0.75*f, s2*0.65+s2*0.2);
    vertex(s1, s2-f*0.75+s2*0.2);
    vertex(s1, s2+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    vertex(s1*0.65, s2*0.65+0.75*f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void letterqdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.65+d, s2*0.65);
  vertex(s1*0.65+0.75*f+d, s2*0.65);
  vertex(s1+d, s2-f*0.75);
  vertex(s1+d, s2);
  vertex(s1-0.75*f+d, s2);
  vertex(s1*0.65+d, s2*0.65+0.75*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.5, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.65, s2*0.65+s2*0.2);
    vertex(s1*0.65+0.75*f, s2*0.65+s2*0.2);
    vertex(s1, s2-f*0.75+s2*0.2);
    vertex(s1, s2+s2*0.2);
    vertex(s1-0.75*f, s2+s2*0.2);
    vertex(s1*0.65, s2*0.65+0.75*f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, 0+s2*0.2);
    vertex(s1*0.51, 0+s2*0.2);
    vertex(s1*0.51, f+s2*0.2);
    vertex(s1*0.49, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, s2+s2*0.2);
    vertex(s1*0.51, s2+s2*0.2);
    vertex(s1*0.51, s2-f+s2*0.2);
    vertex(s1*0.49, s2-f+s2*0.2);
    endShape(CLOSE);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.2, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.65, s2*0.65+s2*0.4);
    vertex(s1*0.65+0.75*f, s2*0.65+s2*0.4);
    vertex(s1, s2-f*0.75+s2*0.4);
    vertex(s1, s2+s2*0.4);
    vertex(s1-0.75*f, s2+s2*0.4);
    vertex(s1*0.65, s2*0.65+0.75*f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, 0+s2*0.4);
    vertex(s1*0.51, 0+s2*0.4);
    vertex(s1*0.51, f+s2*0.4);
    vertex(s1*0.49, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, s2+s2*0.4);
    vertex(s1*0.51, s2+s2*0.4);
    vertex(s1*0.51, s2-f+s2*0.4);
    vertex(s1*0.49, s2-f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5, s2*0.5+s2*0.4, s1-f, s2-f, HALF_PI, PI+HALF_PI);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1-0.25*f, 0+0.25*f, s1, s2, HALF_PI, PI);
    arc(s1*0.97-0.2*f, s2*0.8+0.25*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterr() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(0+d, s2*0.5+f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.55+d, s2*0.5);
  vertex(s1*0.80+d, s2-0.75*f);
  vertex(s1*0.80+d, s2);
  vertex(s1*0.80-0.75*f+d, s2);
  vertex(s1*0.55-f-0.25*f+d, s2*0.5);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI); 
    beginShape();
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2*0.5+0.5*f);
    vertex(0, s2*0.5+0.5*f);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.55, s2*0.5+s2*0.2);
    vertex(s1*0.80, s2-0.75*f+s2*0.2);
    vertex(s1*0.80, s2+s2*0.2);
    vertex(s1*0.80-0.75*f, s2+s2*0.2);
    vertex(s1*0.55-f-0.25*f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(0, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.55, s2*0.5+s2*0.4);
    vertex(s1*0.80, s2-0.75*f+s2*0.4);
    vertex(s1*0.80, s2+s2*0.4);
    vertex(s1*0.80-0.75*f, s2+s2*0.4);
    vertex(s1*0.55-f-0.25*f, s2*0.5+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2-fs);
    vertex(s1*0.8-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterralt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, s2*0.5);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, s2*0.5);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(0+d, s2*0.5+f);
  endShape(CLOSE);
  beginShape();
  vertex(0.5*f+d, 0);
  vertex(s1*0.80+d, s2-0.75*f);
  vertex(s1*0.80+d, s2);
  vertex(s1*0.80-0.75*f+d, s2);
  vertex(0+d, f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI); 
    beginShape();
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2*0.5+0.5*f);
    vertex(0, s2*0.5+0.5*f);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0.5*f, 0+s2*0.2);
    vertex(s1*0.80, s2-0.75*f+s2*0.2);
    vertex(s1*0.80, s2+s2*0.2);
    vertex(s1*0.80-0.75*f, s2+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, s2*0.5+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(0, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0.5*f, 0+s2*0.4);
    vertex(s1*0.80, s2-0.75*f+s2*0.4);
    vertex(s1*0.80, s2+s2*0.4);
    vertex(s1*0.80-0.75*f, s2+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2-fs);
    vertex(s1*0.8-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterrdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);  
  ellipse(s1*0.6, s2*0.8, f, f);  
  ellipse(s1*0.8, s2, f, f);  
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.55, s2*0.5+s2*0.2);
    vertex(s1*0.80, s2-0.75*f+s2*0.2);
    vertex(s1*0.80, s2+s2*0.2);
    vertex(s1*0.80-0.75*f, s2+s2*0.2);
    vertex(s1*0.55-f-0.25*f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2-fs);
    vertex(s1*0.8-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterrdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.5+d, 0);
  vertex(s1*0.5+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5);
  vertex(s1*0.5+d, s2*0.5+f);
  vertex(0+d, s2*0.5+f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.55+d, s2*0.5);
  vertex(s1*0.80+d, s2-0.75*f);
  vertex(s1*0.80+d, s2);
  vertex(s1*0.80-0.75*f+d, s2);
  vertex(s1*0.55-f-0.25*f+d, s2*0.5);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    arc(s1*0.5, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI); 
    beginShape();
    vertex(0, 0);
    vertex(s1*0.51, 0);
    vertex(s1*0.51, s2*0.5+0.5*f);
    vertex(0, s2*0.5+0.5*f);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+s2*0.2);
    vertex(s1*0.5, s2*0.5+f+s2*0.2);
    vertex(0, s2*0.5+f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.55, s2*0.5+s2*0.2);
    vertex(s1*0.80, s2-0.75*f+s2*0.2);
    vertex(s1*0.80, s2+s2*0.2);
    vertex(s1*0.80-0.75*f, s2+s2*0.2);
    vertex(s1*0.55-f-0.25*f, s2*0.5+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.2, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+s2*0.4);
    vertex(s1*0.5, s2*0.5+f+s2*0.4);
    vertex(0, s2*0.5+f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.55, s2*0.5+s2*0.4);
    vertex(s1*0.80, s2-0.75*f+s2*0.4);
    vertex(s1*0.80, s2+s2*0.4);
    vertex(s1*0.80-0.75*f, s2+s2*0.4);
    vertex(s1*0.55-f-0.25*f, s2*0.5+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.5, s2*0.25+0.5*f+s2*0.4, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(ROUND);
  arc(s1*0.5+d, s2*0.25+0.5*f, s1*0.5, s2*0.5, PI+HALF_PI, TWO_PI+HALF_PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(0, 0);
    vertex(0, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2);
    vertex(s1*0.8+s1*0.1+0.5*f, s2-fs);
    vertex(s1*0.8-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letters() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5-0.2*s1+d, s2*0.75-0.375*f, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
  arc(s1*0.5-0.2*s1, s2*0.25+0.125*f, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.2, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.2, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.4, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.4, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.4);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    fill(c);
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5-0.2*s1, s2*0.75-0.5*f+0.125*f, s1*0.5-0.25*f, s2*0.5-0.25*f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f);
  vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f);
  vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f);
  vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.85-0.35*f, s2*0.25, s1*0.6, s2*0.6, HALF_PI, PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(-f, s2*0.2, s1*1.5+d, s2*0.2);
    line(-f, s2*0.4, s1*1.5+d, s2*0.4);
    line(-f, s2*0.6, s1*1.5+d, s2*0.6);
    line(-f, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void lettersalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5-0.2*s1+d, s2*0.75-0.375*f, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
  arc(s1*0.5-0.2*s1, s2*0.25+0.125*f, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.2, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.2, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.4, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.4, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.4);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    fill(c);
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5-0.2*s1, s2*0.75-0.5*f+0.125*f, s1*0.5-0.25*f, s2*0.5-0.25*f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f);
  vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f);
  vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f);
  vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.85-0.35*f, s2*0.25, s1*0.6, s2*0.6, HALF_PI, PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(-f, s2*0.2, s1*1.5+d, s2*0.2);
    line(-f, s2*0.4, s1*1.5+d, s2*0.4);
    line(-f, s2*0.6, s1*1.5+d, s2*0.6);
    line(-f, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void lettersdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, s2*0.8, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.2, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.2, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, TWO_PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.9-0.35*f, s2*0.25, s1*0.6, s2*0.6, HALF_PI, PI);
  }
}

void lettersdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float d = controlP5.getController("destruct").getValue();
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  arc(s1*0.5-0.2*s1+d, s2*0.75-0.375*f, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
  arc(s1*0.5-0.2*s1, s2*0.25+0.125*f, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, HALF_PI+PI);
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.2, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.2, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, HALF_PI+PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    arc(s1*0.5-0.2*s1, s2*0.75-0.375*f+s2*0.4, s1*0.5-0.25*f, s2*0.5-0.25*f, PI+HALF_PI, TWO_PI+PI);
    arc(s1*0.5-0.2*s1, s2*0.25+0.125*f+s2*0.4, s1*0.5-0.75*f, s2*0.5-0.75*f, HALF_PI, HALF_PI+PI);
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.4);
    vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f+s2*0.4);
    endShape(CLOSE);
  }
  if (fill==true || add == 6 || add == 7 || add == 8) {
    fill(c);
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    strokeJoin(MITER);
    ellipse(s1*0.5-0.2*s1, s2*0.75-0.5*f+0.125*f, s1*0.5-0.25*f, s2*0.5-0.25*f);
  }
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5-0.75*f);
  vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5-0.75*f);
  vertex(s1*0.5+0.05*f-0.2*s1, s2*0.5+0.25*f);
  vertex(s1*0.5-0.05*f-0.2*s1, s2*0.5+0.25*f);
  endShape(CLOSE);
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.85-0.35*f, s2*0.25, s1*0.6, s2*0.6, HALF_PI, PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettert() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.4-0.5*f, 0);
  vertex(s1*0.4-0.5*f, s2);
  vertex(s1*0.4+0.5*f, s2);
  vertex(s1*0.4+0.5*f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.8+d, 0);
  vertex(s1*0.8+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(s1*0.4, 0);
    vertex(s1*0.4, s2);
    vertex(s1*0.8, s2);
    vertex(s1*0.8, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.2);
    vertex(s1*0.4-0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.8, 0+s2*0.2);
    vertex(s1*0.8, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.4);
    vertex(s1*0.4-0.5*f, s2+s2*0.4);
    vertex(s1*0.4+0.5*f, s2+s2*0.4);
    vertex(s1*0.4+0.5*f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.8, 0+s2*0.4);
    vertex(s1*0.8, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(fs, 0);
    vertex(fs, s2*0.2+0.5*f);
    vertex(0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0);
    vertex(s1*0.8-fs, 0);
    vertex(s1*0.8-fs, s2*0.2+0.5*f);
    vertex(s1*0.8, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.3-0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2-fs);
    vertex(s1*0.3-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.8-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettertalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.4-0.5*f, 0);
  vertex(s1*0.4-0.5*f, s2);
  vertex(s1*0.4+0.5*f, s2);
  vertex(s1*0.4+0.5*f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.8+d, 0);
  vertex(s1*0.8+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, s2*0.2);
  vertex(s1*0.8+d, s2*0.2);
  vertex(s1*0.8+d, s2*0.2+f);
  vertex(0+d, s2*0.2+f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(s1*0.4, 0);
    vertex(s1*0.4, s2);
    vertex(s1*0.9, s2);
    vertex(s1*0.9, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.2);
    vertex(s1*0.4-0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.8, 0+s2*0.2);
    vertex(s1*0.8, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.2+s2*0.2);
    vertex(s1*0.8, s2*0.2+s2*0.2);
    vertex(s1*0.8, s2*0.2+f+s2*0.2);
    vertex(0, s2*0.2+f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.4);
    vertex(s1*0.4-0.5*f, s2+s2*0.4);
    vertex(s1*0.4+0.5*f, s2+s2*0.4);
    vertex(s1*0.4+0.5*f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.8, 0+s2*0.4);
    vertex(s1*0.8, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.2+s2*0.4);
    vertex(s1*0.8, s2*0.2+s2*0.4);
    vertex(s1*0.8, s2*0.2+f+s2*0.4);
    vertex(0, s2*0.2+f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(fs, 0);
    vertex(fs, s2*0.2+0.5*f);
    vertex(0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0);
    vertex(s1*0.8-fs, 0);
    vertex(s1*0.8-fs, s2*0.2+0.5*f);
    vertex(s1*0.8, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.3-0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2-fs);
    vertex(s1*0.3-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.8-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void lettertdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.4, s2*0.2, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.60, s2, f, f);
    ellipse(s1*0.80, s2*0.2, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.8, f, f);
    ellipse(s1*0.80, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.2);
    vertex(s1*0.4-0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.8, 0+s2*0.2);
    vertex(s1*0.8, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(fs, 0);
    vertex(fs, s2*0.2+0.5*f);
    vertex(0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0);
    vertex(s1*0.8-fs, 0);
    vertex(s1*0.8-fs, s2*0.2+0.5*f);
    vertex(s1*0.8, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.3-0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2-fs);
    vertex(s1*0.3-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.8-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void lettertdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.4-0.5*f, 0);
  vertex(s1*0.4-0.5*f, s2);
  vertex(s1*0.4+0.5*f, s2);
  vertex(s1*0.4+0.5*f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.4+0.5*f+d, 0);
  vertex(s1*0.4+0.5*f+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(s1*0.4, 0);
    vertex(s1*0.4, s2);
    vertex(s1*0.8, s2);
    vertex(s1*0.8, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.2);
    vertex(s1*0.4-0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, s2+s2*0.2);
    vertex(s1*0.4+0.5*f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.4+0.5*f, 0+s2*0.2);
    vertex(s1*0.4+0.5*f, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1*0.4-0.5*f, 0+s2*0.4);
    vertex(s1*0.4-0.5*f, s2+s2*0.4);
    vertex(s1*0.4+0.5*f, s2+s2*0.4);
    vertex(s1*0.4+0.5*f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.4+0.5*f, 0+s2*0.4);
    vertex(s1*0.4+0.5*f, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(fs, 0);
    vertex(fs, s2*0.2+0.5*f);
    vertex(0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0);
    vertex(s1*0.8-fs, 0);
    vertex(s1*0.8-fs, s2*0.2+0.5*f);
    vertex(s1*0.8, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.3-0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2);
    vertex(s1*0.5+0.5*f, s2-fs);
    vertex(s1*0.3-0.5*f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.8-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteru() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2*0.6);
  vertex(f, s2*0.6);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.8, 0);
  vertex(s1*0.8, s2*0.6);
  vertex(s1*0.8-f, s2*0.6);
  vertex(s1*0.8-f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, s2*0.59);
  vertex(0, s2*0.62);
  vertex(f, s2*0.62);
  vertex(f, s2*0.59);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.8, s2*0.59);
  vertex(s1*0.8, s2*0.62);
  vertex(s1*0.8-f, s2*0.62);
  vertex(s1*0.8-f, s2*0.59);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.8, 0);
    vertex(s1*0.8, s2*0.6);
    vertex(0, s2*0.6);
    endShape(CLOSE);
    arc(s1*0.4, s2*0.6, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2*0.6+s2*0.2);
    vertex(f, s2*0.6+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0+s2*0.2);
    vertex(s1*0.8, s2*0.6+s2*0.2);
    vertex(s1*0.8-f, s2*0.6+s2*0.2);
    vertex(s1*0.8-f, 0+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.4, s2*0.6+s2*0.2, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2*0.6+s2*0.4);
    vertex(f, s2*0.6+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0+s2*0.4);
    vertex(s1*0.8, s2*0.6+s2*0.4);
    vertex(s1*0.8-f, s2*0.6+s2*0.4);
    vertex(s1*0.8-f, 0+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.4, s2*0.6+s2*0.4, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  arc(s1*0.4+d, s2*0.6, s1*0.8-f, s2*0.8-f, 0, PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.7*s1-f, 0);
    vertex(f+0.9*s1-f, 0);
    vertex(f+0.9*s1-f, fs);
    vertex(0.7*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterualt() {  
  float d = controlP5.getController("destruct").getValue(); 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2*0.6);
  vertex(f, s2*0.6);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.8, 0);
  vertex(s1*0.8, s2*0.6);
  vertex(s1*0.8-f, s2*0.6);
  vertex(s1*0.8-f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, f*0.5);
  vertex(f+d, 0);
  vertex(s1*0.8+d, s2*0.6-f*0.75);
  vertex(s1*0.8-0.75*f+d, s2*0.6);
  endShape(CLOSE);
  beginShape();
  vertex(0, s2*0.59);
  vertex(0, s2*0.62);
  vertex(f, s2*0.62);
  vertex(f, s2*0.59);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.8, s2*0.59);
  vertex(s1*0.8, s2*0.62);
  vertex(s1*0.8-f, s2*0.62);
  vertex(s1*0.8-f, s2*0.59);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.8, 0);
    vertex(s1*0.8, s2*0.6);
    vertex(0, s2*0.6);
    endShape(CLOSE);
    arc(s1*0.4, s2*0.6, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2*0.6+s2*0.2);
    vertex(f, s2*0.6+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0+s2*0.2);
    vertex(s1*0.8, s2*0.6+s2*0.2);
    vertex(s1*0.8-f, s2*0.6+s2*0.2);
    vertex(s1*0.8-f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, f*0.5+s2*0.2);
    vertex(f, 0+s2*0.2);
    vertex(s1*0.8, s2*0.6-f*0.75+s2*0.2);
    vertex(s1*0.8-0.75*f, s2*0.6+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.4, s2*0.6+s2*0.2, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2*0.6+s2*0.4);
    vertex(f, s2*0.6+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0+s2*0.4);
    vertex(s1*0.8, s2*0.6+s2*0.4);
    vertex(s1*0.8-f, s2*0.6+s2*0.4);
    vertex(s1*0.8-f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, f*0.5+s2*0.4);
    vertex(f, 0+s2*0.4);
    vertex(s1*0.8, s2*0.6-f*0.75+s2*0.4);
    vertex(s1*0.8-0.75*f, s2*0.6+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.4, s2*0.6+s2*0.4, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  arc(s1*0.4+d, s2*0.6, s1*0.8-f, s2*0.8-f, 0, PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.7*s1-f, 0);
    vertex(f+0.9*s1-f, 0);
    vertex(f+0.9*s1-f, fs);
    vertex(0.7*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterudotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);
  ellipse(s1*0.8, s2*0.6, f, f);  
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.60, 0, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2*0.6+s2*0.2);
    vertex(f, s2*0.6+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.8, 0+s2*0.2);
    vertex(s1*0.8, s2*0.6+s2*0.2);
    vertex(s1*0.8-f, s2*0.6+s2*0.2);
    vertex(s1*0.8-f, 0+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(ROUND);
    arc(s1*0.4, s2*0.6+s2*0.2, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.7*s1-f, 0);
    vertex(f+0.9*s1-f, 0);
    vertex(f+0.9*s1-f, fs);
    vertex(0.7*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterudel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0, s2*0.6);
  vertex(f, s2*0.6);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, s2*0.59);
  vertex(0, s2*0.62);
  vertex(f, s2*0.62);
  vertex(f, s2*0.59);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.8, 0);
    vertex(s1*0.8, s2*0.61);
    vertex(0, s2*0.61);
    endShape(CLOSE);
    arc(s1*0.4, s2*0.6, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2*0.6+s2*0.2);
    vertex(f, s2*0.6+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.59+s2*0.2);
    vertex(0, s2*0.62+s2*0.2);
    vertex(f, s2*0.62+s2*0.2);
    vertex(f, s2*0.59+s2*0.2);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    arc(s1*0.4, s2*0.6+s2*0.2, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    fill(c);
    strokeWeight(f);
    noStroke();
    strokeCap(SQUARE);
    strokeJoin(MITER);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2*0.6+s2*0.4);
    vertex(f, s2*0.6+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.59+s2*0.4);
    vertex(0, s2*0.62+s2*0.4);
    vertex(f, s2*0.62+s2*0.4);
    vertex(f, s2*0.59+s2*0.4);
    endShape(CLOSE);
    noFill();
    strokeWeight(f);
    stroke(c);
    strokeCap(SQUARE);
    arc(s1*0.4, s2*0.6+s2*0.4, s1*0.8-f, s2*0.8-f, 0, PI);
  }
  noFill();
  strokeWeight(f);
  stroke(c);
  strokeCap(SQUARE);
  arc(s1*0.4+d, s2*0.6, s1*0.8-f, s2*0.8-f, 0, PI);
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.7*s1-f, 0);
    vertex(f+0.9*s1-f, 0);
    vertex(f+0.9*s1-f, fs);
    vertex(0.7*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void letterv() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-0.5*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, 0.75*f);
  vertex(f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75-0.5*f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, 0.75*f+s2*0.4);
    vertex(f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettervalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-0.5*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, 0.75*f);
  vertex(f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75-f+d, f);
  vertex(0+d, f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75-0.5*f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, 0.75*f+s2*0.4);
    vertex(f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void lettervdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);  
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.8, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.60, 0, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterv_mdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.8, s2*0.4, f, f);
  ellipse(s1*0.8, s2*0.6, f, f);
  ellipse(s1*0.8, s2*0.2, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2, f, f);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.2, f, f);  
  ellipse(s1*0.2, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.60, s2*0.2, f, f);
    ellipse(s1*0.60, 0, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0, 0.75*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void lettervdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2);
  vertex(0+d, s2-0.75*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, 0.75*f);
  vertex(0.75*f+d, s2);
  endShape(CLOSE); 
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75-0.5*f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, s2+s2*0.2);
    vertex(0+d, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.2);
    vertex(s1*0.75+d, 0+s2*0.2);
    vertex(s1*0.75+d, 0.75*f+s2*0.2);
    vertex(0.75*f+d, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, s2+s2*0.4);
    vertex(0+d, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.4);
    vertex(s1*0.75+d, 0+s2*0.4);
    vertex(s1*0.75+d, 0.75*f+s2*0.4);
    vertex(0.75*f+d, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterv_m() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.75, s2-0.5*f);
  vertex(0.75*f, 0);
  vertex(0, 0);
  vertex(0, 0.75*f);
  vertex(s1*0.75-f, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-f+d, s2);
  vertex(s1*0.75-f+d, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.75-0.5*f, s2);
    vertex(s1*0.75-0.5*f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0, 0.75*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1*0.75, s2-0.5*f+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(0, 0+s2*0.4);
    vertex(0, 0.75*f+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterv_malt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, f);
  vertex(0+f+d, f);
  endShape(CLOSE);
  beginShape();
  vertex(s1*0.75, s2-0.5*f);
  vertex(0.75*f, 0);
  vertex(0, 0);
  vertex(0, 0.75*f);
  vertex(s1*0.75-f, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-f+d, s2);
  vertex(s1*0.75-f+d, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.75-0.5*f, s2);
    vertex(s1*0.75-0.5*f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0, 0.75*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75+d, 0+s2*0.2);
    vertex(s1*0.75+d, s2+s2*0.2);
    vertex(s1*0.75-f+d, s2+s2*0.2);
    vertex(s1*0.75-f+d, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2-0.5*f+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(0, 0+s2*0.4);
    vertex(0, 0.75*f+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75+d, 0+s2*0.4);
    vertex(s1*0.75+d, s2+s2*0.4);
    vertex(s1*0.75-f+d, s2+s2*0.4);
    vertex(s1*0.75-f+d, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterv_mdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(s1*0.75, s2-0.75*f);
  vertex(0.75*f, 0);
  vertex(0, 0);
  vertex(0, 0.75*f);
  vertex(s1*0.75-0.75*f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0, 0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(0, 0+s2*0.4);
    vertex(0, 0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void letterw() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-0.5*f);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75+d, 0.5*f);
  vertex(f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-f+d, s2-0.5*f);
  vertex(s1*1.5-f-0.75*f+d, 0);
  vertex(s1*1.5-f+d, 0);
  vertex(s1*1.5-f+d, 0.75*f);
  vertex(s1*0.75+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, 0);
  vertex(s1*0.75-f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74, 0);
    vertex(s1*0.74, s2);
    vertex(s1*1.5-f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75, 0.5*f+s2*0.2);
    vertex(f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-0.75*f, 0+s2*0.2);
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, 0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75, 0.5*f+s2*0.4);
    vertex(f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, s2-0.5*f+s2*0.4);
    vertex(s1*1.5-f-0.75*f, 0+s2*0.4);
    vertex(s1*1.5-f, 0+s2*0.4);
    vertex(s1*1.5-f, 0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterw_m() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.75*f);
  vertex(0+d, 0);
  vertex(0.75*f+d, 0);
  vertex(s1*0.75+d, s2-0.5*f);
  vertex(s1*0.75-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-f+d, 0.5*f);
  vertex(s1*0.75+d, 0);
  vertex(s1*1.5-f+d, s2-0.5*f);
  vertex(s1*1.5-f-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, 0);
  vertex(s1*0.75-f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*1.5-f, 0);
  vertex(s1*1.5-f, s2);
  vertex(s1*1.5-2*f, s2);
  vertex(s1*1.5-2*f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74, 0);
    vertex(s1*1.5-f, s2);
    vertex(s1*1.5-f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.75*f+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, 0.5*f+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*1.5-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-2*f, s2+s2*0.2);
    vertex(s1*1.5-2*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, 0.75*f+d+s2*0.4);
    vertex(0+d, 0+d+s2*0.4);
    vertex(0.75*f+d, 0+d+s2*0.4);
    vertex(s1*0.75+d, s2-0.5*f+d+s2*0.4);
    vertex(s1*0.75-f+d, s2+d+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f+d, 0.5*f+d+s2*0.4);
    vertex(s1*0.75+d, 0+d+s2*0.4);
    vertex(s1*1.5-f+d, s2-0.5*f+d+s2*0.4);
    vertex(s1*1.5-f-f+d, s2+d+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.4);
    vertex(s1*1.5-f, s2+s2*0.4);
    vertex(s1*1.5-2*f, s2+s2*0.4);
    vertex(s1*1.5-2*f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.5-f-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterwalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-0.5*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, 0.75*f);
  vertex(f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.5-f+d, s2-0.5*f);
  vertex(s1*1.25-f-0.75*f+d, 0);
  vertex(s1*1.25-f+d, 0);
  vertex(s1*1.25-f+d, 0.75*f);
  vertex(s1*0.5+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.5, 0);
  vertex(s1*0.5-f, 0);
  vertex(s1*0.5-f, s2);
  vertex(s1*0.5, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, 0);
    vertex(s1*0.49, s2);
    vertex(s1*1.24-f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.25-f-0.75*f, 0+s2*0.2);
    vertex(s1*1.25-f, 0+s2*0.2);
    vertex(s1*1.25-f, 0.75*f+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5, 0+s2*0.2);
    vertex(s1*0.5-f, 0+s2*0.2);
    vertex(s1*0.5-f, s2+s2*0.2);
    vertex(s1*0.5, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, 0.75*f+s2*0.4);
    vertex(f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-f, s2-0.5*f+s2*0.4);
    vertex(s1*1.25-f-0.75*f, 0+s2*0.4);
    vertex(s1*1.25-f, 0+s2*0.4);
    vertex(s1*1.25-f, 0.75*f+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5, 0+s2*0.4);
    vertex(s1*0.5-f, 0+s2*0.4);
    vertex(s1*0.5-f, s2+s2*0.4);
    vertex(s1*0.5, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterwdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2*0.6, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.2, s2*0.8, f, f);
  ellipse(s1, s2*0.6, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*1.2, s2*0.4, f, f);
  ellipse(s1*1.2, s2*0.2, f, f);
  ellipse(s1*1.2, 0, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, s2*0.6, f, f);
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.80, s2*0.2, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.80, 0, f, f);
    ellipse(s1, s2*0.2, f, f);
    ellipse(s1, s2*0.4, f, f);
    ellipse(s1, 0, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75, 0.5*f+s2*0.2);
    vertex(f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-0.75*f, 0+s2*0.2);
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, 0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
}

void letterw_malt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0);
  vertex(0.75*f+d, 0);
  vertex(s1*0.75-0.25*f+d, s2-0.75*f);
  vertex(s1*0.75-f+d, s2);
  vertex(0+d, 0.75*f);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.5-f+d, 0.75*f);
  vertex(s1*0.5-f+d, 0);
  vertex(s1*0.5-0.25*f+d, 0);
  vertex(s1*1.25-f+d, s2-0.5*f);
  vertex(s1*1.25-f-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, 0);
  vertex(s1*0.75-f, s2);
  vertex(s1*0.75, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*1.25-f, 0);
  vertex(s1*1.25-f, s2);
  vertex(s1*1.25-f-f, s2);
  vertex(s1*1.25-f-f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.49, 0);
    vertex(s1*0.49, s2);
    vertex(s1*1.24-f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.75-0.25*f, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(0, 0.75*f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-f, 0.75*f+s2*0.2);
    vertex(s1*0.5-f, 0+s2*0.2);
    vertex(s1*0.5-0.25*f, 0+s2*0.2);
    vertex(s1*1.25-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.25-f-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.25-f, 0+s2*0.2);
    vertex(s1*1.25-f, s2+s2*0.2);
    vertex(s1*1.25-f-f, s2+s2*0.2);
    vertex(s1*1.25-f-f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(s1*0.75-0.25*f, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(0, 0.75*f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.5-f, 0.75*f+s2*0.4);
    vertex(s1*0.5-f, 0+s2*0.4);
    vertex(s1*0.5-0.25*f, 0+s2*0.4);
    vertex(s1*1.25-f, s2-0.5*f+s2*0.4);
    vertex(s1*1.25-f-f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, 0+s2*0.4);
    vertex(s1*0.75-f, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.25-f, 0+s2*0.4);
    vertex(s1*1.25-f, s2+s2*0.4);
    vertex(s1*1.25-f-f, s2+s2*0.4);
    vertex(s1*1.25-f-f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.25+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.25-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.25-f-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterw_mdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(s1*1.2, 0, f, f);
  ellipse(s1*1.2, s2*0.8, f, f);
  ellipse(s1*1.2, s2*0.6, f, f);
  ellipse(s1*1.2, s2*0.4, f, f);
  ellipse(s1*1.2, s2*0.2, f, f);
  ellipse(s1*1.2, s2, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.6, s2*0.8, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.6, s2*0.4, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(0, 0, f, f);
  ellipse(0, s2*0.2, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.8, f, f);
  ellipse(0, s2*0.4, f, f);
  ellipse(s1, s2*0.8, f, f);
  ellipse(s1*1*0.8, s2*0.6, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.2, f, f);
    ellipse(s1*0.20, s2*0.4, f, f);
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.40, s2*0.4, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.80, s2*0.2, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.80, 0, f, f);
    ellipse(s1, s2*0.2, f, f);
    ellipse(s1, s2*0.4, f, f);
    ellipse(s1, s2*0.6, f, f);
    ellipse(s1, 0, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.75*f+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f, 0.5*f+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*1.5-f, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, 0+s2*0.2);
    vertex(s1*0.75-f, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-2*f, s2+s2*0.2);
    vertex(s1*1.5-2*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.25-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void letterwdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-0.5*f);
  vertex(s1*0.75-0.75*f+d, 0);
  vertex(s1*0.75+d, 0);
  vertex(s1*0.75+d, 0.75*f);
  vertex(f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-0.75*f+d, s2);
  vertex(s1*0.75-0.75*f+d, s2-0.75*f);
  vertex(s1*1.5-f-0.75*f+d, 0);
  vertex(s1*1.5-f+d, 0);
  vertex(s1*1.5-f+d, 0.75*f);
  vertex(s1*0.75+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0, s2);
  vertex(f, s2);
  vertex(f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(0, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74-0.75*f, 0);
    vertex(s1*0.74-0.75*f, s2);
    vertex(s1*1.5-f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, s2-0.5*f+s2*0.2);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.2);
    vertex(s1*0.75+d, 0+s2*0.2);
    vertex(s1*0.75+d, 0.75*f+s2*0.2);
    vertex(f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-0.75*f+d, s2+s2*0.2);
    vertex(s1*0.75-0.75*f+d, s2-0.75*f+s2*0.2);
    vertex(s1*1.5-f-0.75*f+d, 0+s2*0.2);
    vertex(s1*1.5-f+d, 0+s2*0.2);
    vertex(s1*1.5-f+d, 0.75*f+s2*0.2);
    vertex(s1*0.75+d, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0, s2+s2*0.2);
    vertex(f, s2+s2*0.2);
    vertex(f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, s2-0.5*f+s2*0.4);
    vertex(s1*0.75-0.75*f+d, 0+s2*0.4);
    vertex(s1*0.75+d, 0+s2*0.4);
    vertex(s1*0.75+d, 0.75*f+s2*0.4);
    vertex(f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-0.75*f+d, s2+s2*0.4);
    vertex(s1*0.75-0.75*f+d, s2-0.75*f+s2*0.4);
    vertex(s1*1.5-f-0.75*f+d, 0+s2*0.4);
    vertex(s1*1.5-f+d, 0+s2*0.4);
    vertex(s1*1.5-f+d, 0.75*f+s2*0.4);
    vertex(s1*0.75+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0, s2+s2*0.4);
    vertex(f, s2+s2*0.4);
    vertex(f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(0+0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI, PI+HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterw_mdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.75*f);
  vertex(0+d, 0);
  vertex(0.75*f+d, 0);
  vertex(s1*0.75-0.25*f+d, s2-0.75*f);
  vertex(s1*0.75-0.25*f+d, s2);
  vertex(s1*0.75-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.75-f+d, 0.75*f);
  vertex(s1*0.75-f+d, 0);
  vertex(s1*0.75-0.25*f+d, 0);
  vertex(s1*1.5-f+d, s2-0.5*f);
  vertex(s1*1.5-f-f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*1.5-f, 0);
  vertex(s1*1.5-f, s2);
  vertex(s1*1.5-2*f, s2);
  vertex(s1*1.5-2*f, 0);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.75-0.25*f, s2);
    vertex(s1*0.75-0.25*f, 0);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.74-0.75*f, 0);
    vertex(s1*1.5-f, s2);
    vertex(s1*1.5-f, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, 0.75*f+s2*0.2);
    vertex(0+d, 0+s2*0.2);
    vertex(0.75*f+d, 0+s2*0.2);
    vertex(s1*0.75-0.25*f+d, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-0.25*f+d, s2+s2*0.2);
    vertex(s1*0.75-f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f+d, 0.75*f+s2*0.2);
    vertex(s1*0.75-f+d, 0+s2*0.2);
    vertex(s1*0.75-0.25*f+d, 0+s2*0.2);
    vertex(s1*1.5-f+d, s2-0.5*f+s2*0.2);
    vertex(s1*1.5-f-f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.2);
    vertex(s1*1.5-f, s2+s2*0.2);
    vertex(s1*1.5-2*f, s2+s2*0.2);
    vertex(s1*1.5-2*f, 0+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, 0.75*f+s2*0.4);
    vertex(0+d, 0+s2*0.4);
    vertex(0.75*f+d, 0+s2*0.4);
    vertex(s1*0.75-0.25*f+d, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-0.25*f+d, s2+s2*0.4);
    vertex(s1*0.75-f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.75-f+d, 0.75*f+s2*0.4);
    vertex(s1*0.75-f+d, 0+s2*0.4);
    vertex(s1*0.75-0.25*f+d, 0+s2*0.4);
    vertex(s1*1.5-f+d, s2-0.5*f+s2*0.4);
    vertex(s1*1.5-f-f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*1.5-f, 0+s2*0.4);
    vertex(s1*1.5-f, s2+s2*0.4);
    vertex(s1*1.5-2*f, s2+s2*0.4);
    vertex(s1*1.5-2*f, 0+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, 0);
    vertex(s1*1.5+s1*0.1+0.5*f-1.5*f, fs);
    vertex(s1*1.5-s1*0.1-0.5*f-1.5*f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*1.5-f-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterx() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.75*f);
  vertex(0+d, 0);
  vertex(0.75*f+d, 0);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2);
  vertex(0, s2-0.75*f);
  vertex(s1*0.75-0.75*f, 0);
  vertex(s1*0.75, 0);
  vertex(s1*0.75, 0.75*f);
  vertex(0.75*f, s2);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.375, s2*0.5);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0);
    vertex(s1*0.375, s2*0.5);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.75*f+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0.75*f+s2*0.4);
    vertex(0, 0+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, 0.75*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterxalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(s1*0.75, 0);
  vertex(s1*0.75-f, f);
  vertex(f, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2);
  vertex(s1*0.75, s2);
  vertex(s1*0.75-f, s2-f);
  vertex(f, s2-f);
  endShape(CLOSE); 
  beginShape();
  vertex(0+d, 0.75*f);
  vertex(0+d, 0);
  vertex(0.75*f+d, 0);
  vertex(s1*0.75+d, s2-0.75*f);
  vertex(s1*0.75+d, s2);
  vertex(s1*0.75-0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2);
  vertex(0, s2-0.75*f);
  vertex(s1*0.75-0.75*f, 0);
  vertex(s1*0.75, 0);
  vertex(s1*0.75, 0.75*f);
  vertex(0.75*f, s2);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.375, s2*0.5);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0);
    vertex(s1*0.375, s2*0.5);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75-f, f+s2*0.2);
    vertex(f, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-f, s2-f+s2*0.2);
    vertex(f, s2-f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0.75*f+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75-f, f+s2*0.4);
    vertex(f, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-f, s2-f+s2*0.4);
    vertex(f, s2-f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0.75*f+s2*0.4);
    vertex(0, 0+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(s1*0.75, s2-0.75*f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    vertex(s1*0.75-0.75*f, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-0.75*f, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, 0.75*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterxdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(0, 0, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(0, s2*0.8, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.6, s2*0.6, f, f);
  ellipse(s1*0.8, s2*0.8, f, f);
  ellipse(s1*0.8, s2, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, 0, f, f);
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.20, s2, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.40, s2, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.60, s2, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0.75*f+s2*0.2);
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.75, s2-0.75*f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    vertex(s1*0.75-0.75*f, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-0.75*f, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, 0.75*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
}

void letterxdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, 0.75*f);
  vertex(0+d, 0);
  vertex(0.75*f+d, 0);
  vertex(s1*0.375+d, s2*0.5-0.75*f);
  vertex(s1*0.375+d, s2*0.5);
  vertex(s1*0.375-0.75*f+d, s2*0.5);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2);
  vertex(0, s2-0.75*f);
  vertex(s1*0.375-0.75*f, s2*0.49);
  vertex(s1*0.375, s2*0.49);
  vertex(s1*0.375, s2*0.49+0.75*f);
  vertex(0.75*f, s2);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.375, s2*0.5);
    vertex(s1*0.75, s2);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0);
    vertex(s1*0.375, s2*0.5);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, 0.75*f+s2*0.2);
    vertex(0+d, 0+s2*0.2);
    vertex(0.75*f+d, 0+s2*0.2);
    vertex(s1*0.375+d, s2*0.5-0.75*f+s2*0.2);
    vertex(s1*0.375+d, s2*0.5+s2*0.2);
    vertex(s1*0.375-0.75*f+d, s2*0.5+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-0.75*f+s2*0.2);
    vertex(s1*0.375-0.75*f, s2*0.49+s2*0.2);
    vertex(s1*0.375, s2*0.49+s2*0.2);
    vertex(s1*0.375, s2*0.49+0.75*f+s2*0.2);
    vertex(0.75*f, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, 0.75*f+s2*0.4);
    vertex(0+d, 0+s2*0.4);
    vertex(0.75*f+d, 0+s2*0.4);
    vertex(s1*0.375+d, s2*0.5-0.75*f+s2*0.4);
    vertex(s1*0.375+d, s2*0.5+s2*0.4);
    vertex(s1*0.375-0.75*f+d, s2*0.5+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-0.75*f+s2*0.4);
    vertex(s1*0.375-0.75*f, s2*0.49+s2*0.4);
    vertex(s1*0.375, s2*0.49+s2*0.4);
    vertex(s1*0.375, s2*0.49+0.75*f+s2*0.4);
    vertex(0.75*f, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(0-s1*0.1, 0);
    vertex(s1*0.1+f, 0);
    vertex(s1*0.1+f, fs);
    vertex(0-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1, s2);
    vertex(s1*0.1+f, s2);
    vertex(s1*0.1+f, s2-fs);
    vertex(0-s1*0.1, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, 0);
    vertex(s1*0.1+f+0.75*s1-f, fs);
    vertex(0-s1*0.1+0.75*s1-f, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0-s1*0.1+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2);
    vertex(s1*0.1+f+0.75*s1-f, s2-fs);
    vertex(0-s1*0.1+0.75*s1-f, s2-fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void lettery() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0.75*f, 0);
  vertex(s1*0.35+0.5*f, s2*0.5-0.5*f);
  vertex(s1*0.35-0.5*f, s2*0.5);
  vertex(0, f*0.75);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.7, 0);
  vertex(s1*0.7-0.75*f, 0);
  vertex(s1*0.35-0.5*f, s2*0.5-0.5*f);
  vertex(s1*0.35+0.5*f, s2*0.5);
  vertex(s1*0.7, f*0.75);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.35-0.5*f+d, s2*0.5);
  vertex(s1*0.35-0.5*f+d, s2);
  vertex(s1*0.35+0.5*f+d, s2);
  vertex(s1*0.35+0.5*f+d, s2*0.5);
  vertex(s1*0.35+d, s2*0.5-0.5*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.35, s2*0.5);
    vertex(s1*0.7, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(0, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.2);
    vertex(s1*0.7-0.75*f, 0+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.7, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35-0.5*f, s2+s2*0.2);
    vertex(s1*0.35+0.5*f, s2+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.4);
    vertex(0, f*0.75+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.4);
    vertex(s1*0.7-0.75*f, 0+s2*0.4);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.7, f*0.75+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.35-0.5*f, s2+s2*0.4);
    vertex(s1*0.35+0.5*f, s2+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.35, s2*0.5-f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.25-0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2-fs);
    vertex(s1*0.25-0.5*f, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.6*s1-f, 0);
    vertex(0.8*s1, 0);
    vertex(0.8*s1, fs);
    vertex(0.6*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.7-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letteryalt() { 
  float d = controlP5.getController("destruct").getValue();
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(s1*0.7, 0);
  vertex(s1*0.7-f, f);
  vertex(f, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(0.75*f, 0);
  vertex(s1*0.35+0.5*f, s2*0.5-0.5*f);
  vertex(s1*0.35-0.5*f, s2*0.5);
  vertex(0, f*0.75);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.7, 0);
  vertex(s1*0.7-0.75*f, 0);
  vertex(s1*0.35-0.5*f, s2*0.5-0.5*f);
  vertex(s1*0.35+0.5*f, s2*0.5);
  vertex(s1*0.7, f*0.75);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.35-0.5*f+d, s2*0.5);
  vertex(s1*0.35-0.5*f+d, s2);
  vertex(s1*0.35+0.5*f+d, s2);
  vertex(s1*0.35+0.5*f+d, s2*0.5);
  vertex(s1*0.35+d, s2*0.5-0.5*f);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.35, s2*0.5);
    vertex(s1*0.7, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.7, 0+s2*0.2);
    vertex(s1*0.7-f, f+s2*0.2);
    vertex(f, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(0, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.2);
    vertex(s1*0.7-0.75*f, 0+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.7, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35-0.5*f, s2+s2*0.2);
    vertex(s1*0.35+0.5*f, s2+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.7, 0+s2*0.4);
    vertex(s1*0.7-f, f+s2*0.4);
    vertex(f, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.4);
    vertex(0, f*0.75+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.4);
    vertex(s1*0.7-0.75*f, 0+s2*0.4);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.7, f*0.75+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.35-0.5*f, s2+s2*0.4);
    vertex(s1*0.35+0.5*f, s2+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.35, s2*0.5-f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.25-0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2-fs);
    vertex(s1*0.25-0.5*f, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.6*s1-f, 0);
    vertex(0.8*s1, 0);
    vertex(0.8*s1, fs);
    vertex(0.6*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.7-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterydotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(s1*0.2, s2*0.2, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.4, s2*0.6, f, f);
  ellipse(s1*0.4, s2*0.8, f, f);
  ellipse(s1*0.4, s2, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, 0, f, f);
    ellipse(s1*0.40, 0, f, f);
    ellipse(s1*0.40, s2*0.2, f, f);
    ellipse(s1*0.60, 0, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(0, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.2);
    vertex(s1*0.7-0.75*f, 0+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.7, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35-0.5*f, s2+s2*0.2);
    vertex(s1*0.35+0.5*f, s2+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35, s2*0.5-f+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.25-0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2-fs);
    vertex(s1*0.25-0.5*f, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.6*s1-f, 0);
    vertex(0.8*s1, 0);
    vertex(0.8*s1, fs);
    vertex(0.6*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.7-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
}

void letterydel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0, 0);
  vertex(0.75*f, 0);
  vertex(s1*0.35+0.5*f, s2*0.5-0.5*f);
  vertex(s1*0.35-0.5*f, s2*0.5);
  vertex(0, f*0.75);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.7, 0);
  vertex(s1*0.7-0.75*f, 0);
  vertex(s1*0.35-0.5*f, s2*0.5-0.5*f);
  vertex(s1*0.35+0.5*f, s2*0.5);
  vertex(s1*0.7, f*0.75);
  endShape(CLOSE); 
  beginShape();
  vertex(s1*0.35-0.5*f, s2*0.5);
  vertex(s1*0.35, s2*0.5-0.5*f);
  vertex(s1*0.35+0.5*f, s2*0.5);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, 0);
    vertex(s1*0.35, s2*0.5);
    vertex(s1*0.7, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(0.75*f, 0+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(0, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.2);
    vertex(s1*0.7-0.75*f, 0+s2*0.2);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.7, f*0.75+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.2);
    vertex(s1*0.35, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(0.75*f, 0+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.4);
    vertex(0, f*0.75+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.7, 0+s2*0.4);
    vertex(s1*0.7-0.75*f, 0+s2*0.4);
    vertex(s1*0.35-0.5*f, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.7, f*0.75+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(s1*0.35-0.5*f, s2*0.5+s2*0.4);
    vertex(s1*0.35, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.35+0.5*f, s2*0.5+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0.25-0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2);
    vertex(s1*0.45+0.5*f, s2-fs);
    vertex(s1*0.25-0.5*f, s2-fs);
    endShape(CLOSE);
    beginShape();
    vertex(-s1*0.1, 0);
    vertex(f+s1*0.1, 0);
    vertex(f+s1*0.1, fs);
    vertex(-s1*0.1, fs);
    endShape(CLOSE);
    beginShape();
    vertex(0.6*s1-f, 0);
    vertex(0.8*s1, 0);
    vertex(0.8*s1, fs);
    vertex(0.6*s1-f, fs);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.7-0.1*f, s2*0.3+0.5*f, s1*0.6, s2*0.6, PI+HALF_PI, TWO_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterz() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.75-f+d, f*0.5);
  vertex(s1*0.75+d, f);
  vertex(f+d, s2-0.5*f);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(s1*0.75, 0);
  vertex(s1*0.75, f);
  vertex(0, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0+d, s2);
  vertex(0+d, s2-f);
  vertex(s1*0.75+d, s2-f);
  vertex(s1*0.75+d, s2);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75-f, f*0.5+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(f, s2-0.5*f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75-f, f*0.5+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(f, s2-0.5*f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0, 0);
    vertex(s1*0+fs, 0);
    vertex(s1*0+fs, s2*0.2+0.5*f);
    vertex(s1*0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2-s2*0.2-0.5*f);
    vertex(s1*0.75, s2-s2*0.2-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}

void letterzalt() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float d = controlP5.getController("destruct").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2-f);
  vertex(s1*0.75-f+d, f*0.5);
  vertex(s1*0.75+d, f);
  vertex(f+d, s2-0.5*f);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(s1*0.75, 0);
  vertex(s1*0.75, f);
  vertex(0, f);
  endShape(CLOSE); 
  beginShape();
  vertex(0+d, s2*0.5-0.5*f);
  vertex(s1*0.75+d, s2*0.5-0.5*f);
  vertex(s1*0.75+d, s2*0.5+0.5*f);
  vertex(0+d, s2*0.5+0.5*f);
  endShape(CLOSE); 
  beginShape();
  vertex(0, s2);
  vertex(0, s2-f);
  vertex(s1*0.75, s2-f);
  vertex(s1*0.75, s2);
  endShape(CLOSE);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75-f, f*0.5+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(f, s2-0.5*f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.2);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.2);
    vertex(0, s2*0.5+0.5*f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75-f, f*0.5+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(f, s2-0.5*f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.4);
    vertex(0, s2-f+s2*0.4);
    vertex(s1*0.75, s2-f+s2*0.4);
    vertex(s1*0.75, s2+s2*0.4);
    endShape(CLOSE);
    beginShape();
    vertex(0, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.5-0.5*f+s2*0.4);
    vertex(s1*0.75, s2*0.5+0.5*f+s2*0.4);
    vertex(0, s2*0.5+0.5*f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0, 0);
    vertex(s1*0+fs, 0);
    vertex(s1*0+fs, s2*0.2+0.5*f);
    vertex(s1*0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2-s2*0.2-0.5*f);
    vertex(s1*0.75, s2-s2*0.2-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1*1.5+d, s2*0.2);
    line(0, s2*0.4, s1*1.5+d, s2*0.4);
    line(0, s2*0.6, s1*1.5+d, s2*0.6);
    line(0, s2*0.8, s1*1.5+d, s2*0.8);
  }
}

void letterzdotted() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue(); 
  float fs = controlP5.getController("SerifThickness").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  ellipse(0, 0, f, f);
  ellipse(s1*0.2, 0, f, f);
  ellipse(s1*0.4, 0, f, f);
  ellipse(s1*0.6, 0, f, f);
  ellipse(s1*0.8, 0, f, f);
  ellipse(0, s2, f, f);
  ellipse(s1*0.2, s2, f, f);
  ellipse(s1*0.4, s2, f, f);
  ellipse(s1*0.6, s2, f, f);
  ellipse(s1*0.8, s2, f, f);
  ellipse(s1*0.6, s2*0.2, f, f);
  ellipse(s1*0.4, s2*0.4, f, f);
  ellipse(s1*0.2, s2*0.6, f, f);
  ellipse(0, s2*0.8, f, f);
  if (fill==true || add == 6 || add == 7 || add == 8) {
    ellipse(s1*0.20, s2*0.8, f, f);
    ellipse(s1*0.40, s2*0.6, f, f);
    ellipse(s1*0.40, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.6, f, f);
    ellipse(s1*0.60, s2*0.8, f, f);
    ellipse(s1*0.60, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.2, f, f);
    ellipse(s1*0.80, s2*0.4, f, f);
    ellipse(s1*0.80, s2*0.6, f, f);
    ellipse(s1*0.80, s2*0.8, f, f);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75-f, f*0.5+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(f, s2-0.5*f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, s2+s2*0.2);
    vertex(0, s2-f+s2*0.2);
    vertex(s1*0.75, s2-f+s2*0.2);
    vertex(s1*0.75, s2+s2*0.2);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0, 0);
    vertex(s1*0+fs, 0);
    vertex(s1*0+fs, s2*0.2+0.5*f);
    vertex(s1*0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2-s2*0.2-0.5*f);
    vertex(s1*0.75, s2-s2*0.2-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
}

void letterzdel() { 
  float f = controlP5.getController("Thickness").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  float add = controlP5.getController("add-ons").getValue();
  float fs = controlP5.getController("SerifThickness").getValue();
  float d = controlP5.getController("destruct").getValue();
  fill(c);
  strokeWeight(f);
  noStroke();
  strokeCap(SQUARE);
  strokeJoin(MITER);
  beginShape();
  vertex(0+d, s2);
  vertex(0+d, s2-0.75*f);
  vertex(s1*0.75-f+d, f*0.5);
  vertex(s1*0.75+d, f);
  vertex(0.75*f+d, s2);
  endShape(CLOSE); 
  beginShape();
  vertex(0, 0);
  vertex(s1*0.75, 0);
  vertex(s1*0.75, f);
  vertex(0, f);
  endShape(CLOSE); 
  if (fill==true || add == 6 || add == 7 || add == 8) {
    beginShape();
    vertex(0, s2);
    vertex(s1*0.75, s2);
    vertex(s1*0.75, 0);
    endShape(CLOSE);
  }
  if (duplicate==true || add == 9 || add == 10 || add == 11) {
    beginShape();
    vertex(0+d, s2+s2*0.2);
    vertex(0+d, s2-0.75*f+s2*0.2);
    vertex(s1*0.75-f+d, f*0.5+s2*0.2);
    vertex(s1*0.75+d, f+s2*0.2);
    vertex(0.75*f+d, s2+s2*0.2);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.2);
    vertex(s1*0.75, 0+s2*0.2);
    vertex(s1*0.75, f+s2*0.2);
    vertex(0, f+s2*0.2);
    endShape(CLOSE);
  }
  if (triplicate==true || add == 12 || add == 13 || add == 14) {
    beginShape();
    vertex(0+d, s2+s2*0.4);
    vertex(0+d, s2-0.75*f+s2*0.4);
    vertex(s1*0.75-f+d, f*0.5+s2*0.4);
    vertex(s1*0.75+d, f+s2*0.4);
    vertex(0.75*f+d, s2+s2*0.4);
    endShape(CLOSE); 
    beginShape();
    vertex(0, 0+s2*0.4);
    vertex(s1*0.75, 0+s2*0.4);
    vertex(s1*0.75, f+s2*0.4);
    vertex(0, f+s2*0.4);
    endShape(CLOSE);
  }
  if (serifs==true || add == 3 || add == 4 || add == 5) {
    fill(c2);
    noStroke();
    beginShape();
    vertex(s1*0, 0);
    vertex(s1*0+fs, 0);
    vertex(s1*0+fs, s2*0.2+0.5*f);
    vertex(s1*0, s2*0.2+0.5*f);
    endShape(CLOSE);
    beginShape();
    vertex(s1*0.75, s2);
    vertex(s1*0.75-fs, s2);
    vertex(s1*0.75-fs, s2-s2*0.2-0.5*f);
    vertex(s1*0.75, s2-s2*0.2-0.5*f);
    endShape(CLOSE);
  }
  if (deco==true || add == 18 || add == 19 || add == 20) {
    noFill();
    strokeWeight(f);
    stroke(c2);
    strokeCap(MITER);
    arc(s1*0.75-0.1*f, s2*0.7-0.5*f, s1*0.6, s2*0.6, 0, HALF_PI);
  }
  if (stripes==true || add == 15 || add == 16 || add == 17) {
    noFill();
    strokeWeight(8);
    stroke(255);
    strokeCap(PROJECT);
    line(0, s2*0.2, s1+d, s2*0.2);
    line(0, s2*0.4, s1+d, s2*0.4);
    line(0, s2*0.6, s1+d, s2*0.6);
    line(0, s2*0.8, s1+d, s2*0.8);
  }
}


void alphabeta() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettera();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letteraalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letteradel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letteradotted();
  }
}

void alphabetb() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterb();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterbalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterbdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterbdotted();
  }
}

void alphabetc() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterc();
  } 
  if (styles == 4 || styles==5 || styles==6) {
    lettercalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettercdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettercdotted();
  }
}

void alphabetd() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterd();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterdalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterddel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterddotted();
  }
}

void alphabete() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettere();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterealt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letteredel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letteredotted();
  }
}

void alphabetf() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterf();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterfalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterfdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterfdotted();
  }
}

void alphabetg() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterg();
  }
  if (styles == 4 || styles==5 || styles==6) {
    lettergalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettergdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettergdotted();
  }
}

void alphabeth() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterh();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterhalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterhdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterhdotted();
  }
}

void alphabeti() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letteri();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letteri();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letteri();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letteridotted();
  }
}

void alphabetj() { 
  float styles = controlP5.getController("styles").getValue(); 
  if (styles==1 || styles==2 || styles==3) {
    letterj();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterj();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterjdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterjdotted();
  }
}

void alphabetk() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterk();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterkalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterkdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterkdotted();
  }
}

void alphabetl() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterl();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterlalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterldel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterldotted();
  }
}

void alphabetm() { 
  float styles = controlP5.getController("styles").getValue(); 
  if (styles==1 || styles==2 || styles==3) {
    letterm();
  }
  if (styles == 4 || styles==5 || styles==6) {
    lettermalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettermdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettermdotted();
  }
}

void alphabetn() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettern();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letternalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterndel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterndotted();
  }
}

void alphabeto() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettero();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letteroalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterodel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterodotted();
  }
}

void alphabetp() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterp();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterpalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterpdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterpdotted();
  }
}

void alphabetq() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterq();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterqalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterqdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterqdotted();
  }
}

void alphabetr() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterr();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterralt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterrdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterrdotted();
  }
}

void alphabets() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letters();
  }
  if (styles == 4 || styles==5 || styles==6) {
    lettersalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettersdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettersdotted();
  }
}

void alphabett() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettert();
  }
  if (styles == 4 || styles==5 || styles==6) {
    lettertalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettertdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettertdotted();
  }
}

void alphabetu() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letteru();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterualt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterudel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterudotted();
  }
}

void alphabetv() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterv();
  }
  if (styles == 4 || styles==5 || styles==6) {
    lettervalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettervdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettervdotted();
  }
}

void alphabetw() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterw();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterwalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterwdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterwdotted();
  }
}

void alphabetx() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterx();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterxalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterxdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterxdotted();
  }
}

void alphabety() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettery();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letteryalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterydel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterydotted();
  }
}

void alphabetz() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterz();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterzalt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterzdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterzdotted();
  }
}

void alphabetam() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    lettera_m();
  }
  if (styles == 4 || styles==5 || styles==6) {
    lettera_malt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    lettera_mdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    lettera_mdotted();
  }
}

void alphabetwm() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterw_m();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterw_malt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterw_mdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterw_mdotted();
  }
}

void alphabetmm() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterm_m();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterm_malt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterm_mdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterm_mdotted();
  }
}

void alphabetvm() {
  float styles = controlP5.getController("styles").getValue();
  if (styles==1 || styles==2 || styles==3) {
    letterv_m();
  }
  if (styles == 4 || styles==5 || styles==6) {
    letterv_malt();
  } 
  if (styles == 7 || styles==8 || styles==9) {
    letterv_mdel();
  }
  if (styles == 10 || styles==11 || styles==12) {
    letterv_mdotted();
  }
}

void draw() {
  float f = controlP5.getController("Thickness").getValue();
  float styles = controlP5.getController("styles").getValue();
  float space = controlP5.getController("letterspace").getValue();
  float texop = controlP5.getController("textoptions").getValue();
  float leading = controlP5.getController("leading").getValue();
  float s1 = controlP5.getController("width").getValue();
  float s2 = controlP5.getController("height").getValue();
  background(0xffffffff);
  if (texop <= 1) {
    pushMatrix();
    translate(100, 50);
    alphabeta();
    translate(space+s1, 0);
    alphabetb();
    translate(space+s1, 0);
    alphabetc();
    translate(space+s1, 0);
    alphabetd();
    translate(space+s1, 0);
    alphabete();
    translate(space+s1, 0);
    alphabetf();
    translate(space+s1, 0);
    alphabetg();
    popMatrix();
    pushMatrix();
    translate(100, leading+s2+50);
    alphabeth();
    translate(space+s1, 0);
    alphabeti();
    translate(space+s1, 0);
    alphabetj();
    translate(space+s1, 0);
    alphabetk();
    translate(space+s1, 0);
    alphabetl();
    translate(space+s1, 0);
    alphabetm();
    popMatrix();
    pushMatrix();
    translate(100, leading*2+s2*2+50);
    alphabetn();
    translate(space+s1, 0);
    alphabeto();  
    translate(space+s1, 0);
    alphabetp();  
    translate(space+s1, 0);
    alphabetq();
    translate(space+s1, 0);
    alphabetr();
    translate(space+s1, 0);
    alphabets();
    translate(space+s1, 0);
    alphabett();
    popMatrix();
    pushMatrix();
    translate(100, leading*3+s2*3+50);
    alphabetu();
    translate(space+s1, 0);
    alphabetv();
    translate(space+s1, 0);
    alphabetw();
    translate(space+s1, 0);
    alphabetx(); 
    translate(space+s1, 0);
    alphabety(); 
    translate(space+s1, 0);
    alphabetz(); 
    popMatrix();
    pushMatrix();
    translate(100, leading*4+s2*4+50);
    alphabetam();
    translate(space+s1, 0);
    alphabetvm();
    translate(space+s1, 0);
    alphabetwm();
    translate(space+s1, 0);
    alphabetmm(); 
    popMatrix();
  }
  if (texop == 2) {
    pushMatrix();
    translate(100, 50);
    alphabett();
    translate(space+s1*0.25, 0);
    alphabeth();
    translate(space+s1*0.25, 0);
    alphabete();
    translate(space+s1*1.5, 0);
    alphabetq();
    translate(space+s1*0.5, 0);
    alphabetu();
    translate(space+s1*0.5-0.5*f, 0);
    alphabeti();
    translate(space-s1*0.25, 0);
    alphabetc();
    translate(space+s1*0.5, 0);
    alphabetk();
    popMatrix();
    pushMatrix();
    translate(100, leading+s2+50);
    alphabetb();
    translate(space+s1*0.35, 0);
    alphabetr();
    translate(space+s1*0.35, 0);
    alphabeto();
    translate(space+s1*0.5, 0);
    alphabetw();
    if (styles == 4 || styles==5 || styles==6) {
      translate(space+s1*0.75-f, 0);
    } 
    else {
      translate(space+s1-f, 0);
    }
    alphabetn();
    translate(space+s1*1.5, 0);
    alphabetf();
    translate(space+s1*0.25, 0);
    alphabeto();
    translate(space+s1*0.5, 0);
    alphabetx();
    popMatrix();
    pushMatrix();
    translate(100, leading*2+s2*2+50);
    alphabetj();
    translate(space+s1*0.15, 0);
    alphabetu();
    translate(space+s1*0.5, 0);
    alphabetm();
    if (styles == 4 || styles==5 || styles==6) {
      translate(space+s1*0.75-f, 0);
    } 
    else {
      translate(space+s1-f, 0);
    }
    alphabetp();
    translate(space+s1*0.25+0.5*f, 0);
    alphabets();
    translate(space+s1*1.5, 0);
    alphabeto();
    translate(space+s1*0.5, 0);
    alphabetv();
    translate(space+s1*0.25, 0);
    alphabete();
    translate(space+s1*0.25, 0);
    alphabetr();
    popMatrix();
    pushMatrix();
    translate(100, leading*3+s2*3+50);
    alphabett();
    translate(space+s1*0.25, 0);
    alphabeth();
    translate(space+s1*0.25, 0);
    alphabete();
    translate(space+s1*1.5, 0);
    alphabetl(); 
    translate(space+s1*0.25, 0);
    alphabetam(); 
    translate(space+s1*0.5, 0);
    alphabetz(); 
    translate(space+s1*0.25, 0);
    alphabety();
    translate(space+s1*1.5, 0);
    alphabetd();
    translate(space+s1*0.25, 0);
    alphabeto(); 
    translate(space+s1*0.5, 0);
    alphabetg(); 
    popMatrix();
  }
  if (texop == 3) {
    pushMatrix();
    translate(100, 50);
    alphabett();
    translate(space+s1*0.25, 0);
    alphabety();
    translate(space+s1*0.25, 0);
    alphabetp();
    translate(space+s1*0.25, 0);
    alphabeto();
    translate(space+s1*0.5, 0);
    alphabetg();
    translate(space+s1*0.5-f*0.5, 0);
    alphabetr();
    translate(space+s1*0.5-f*0.5, 0);
    alphabetam();
    translate(space+s1*0.5, 0);
    alphabetp();
    translate(space+s1*0.25, 0);
    alphabeth();
    translate(space+s1*0.25, 0);
    alphabety();
    translate(space+s1, 0);
    alphabeti();
    translate(space-s1*0.25, 0);
    alphabets();
    popMatrix();
    pushMatrix();
    translate(100, leading+s2+50);
    alphabeta();
    translate(space+s1*1.5, 0);
    alphabetd();
    translate(space+s1*0.5-f, 0);
    alphabeti();
    translate(space-s1*0.25, 0);
    alphabets();
    translate(space+s1*0.15-0.5*f, 0);
    alphabetc();
    translate(space+s1*0.5-f, 0);
    alphabeti();
    translate(space-s1*0.25, 0);
    alphabetp();
    translate(space+s1*0.25, 0);
    alphabetl();
    translate(space+s1*0.25, 0);
    alphabeti();
    translate(space-s1*0.25, 0);
    alphabetn();
    translate(space+s1*0.25, 0);
    alphabete();
    popMatrix();
    pushMatrix();
    translate(100, leading*2+s2*2+50);
    alphabeth();
    translate(space+s1*0.25, 0);
    alphabetam();
    translate(space+s1*0.5, 0);
    alphabetl();
    translate(space+s1*0.25, 0);
    alphabetf();
    translate(space+s1*0.25, 0);
    alphabetw();
    if (styles == 4 || styles==5 || styles==6) {
      translate(space+s1*0.25-f*0.5, 0);
    } 
    else {
      translate(space+s1*0.5-f*0.5, 0);
    }
    alphabeta();
    translate(space+s1*0.5, 0);
    alphabety();
    translate(space+s1*1.5, 0);
    alphabetb();
    translate(space+s1*0.25, 0);
    alphabete();
    translate(space+s1*0.25-0.5*f, 0);
    alphabett();
    translate(space+s1*0.5-f, 0);
    alphabetw();
    if (styles == 4 || styles==5 || styles==6) {
      translate(space+s1*0.75-f, 0);
    } 
    else {
      translate(space+s1-f, 0);
    }
    alphabete();
    translate(space+s1*0.25, 0);
    alphabete();
    translate(space+s1*0.25, 0);
    alphabetn();
    popMatrix();
    pushMatrix();
    translate(100, leading*3+s2*3+50);
    alphabets();
    translate(space+s1*0.25-0.5*f, 0);
    alphabetc();
    translate(space+s1*0.5-0.5*f, 0);
    alphabeti();
    translate(space-s1*0.25, 0);
    alphabete(); 
    translate(space+s1*0.25, 0);
    alphabetn(); 
    translate(space+s1*0.25, 0);
    alphabetc(); 
    translate(space+s1*0.5-0.5*f, 0);
    alphabete();
    translate(space+s1, 0);
    alphabeta();
    translate(space+s1*0.5, 0);
    alphabetn(); 
    translate(space+s1*0.25, 0);
    alphabetd(); 
    translate(space+s1, 0);
    alphabeta();
    translate(space+s1*0.5, 0);
    alphabetr(); 
    translate(space+s1*0.25, 0);
    alphabett(); 
    popMatrix();
  }
}



