
// Luke Spicer
// For University of Louisville ECE 613
// 3/5/2012
// Based on Tutorial and Code from http://www.ai-junkie.com/ann/som/som1.html
// File SOFM orignal, Author: Luke Spicer

import controlP5.*;

ControlP5 cp5;

SOMLattice lattice;
SOMGraphics latticeGraphic;
SOMTrainer trainer;

void setup() {
  size(640,400);
  background(50);
  smooth();
  cp5 = new ControlP5(this);
  
  lattice = new SOMLattice(40, 40);
  latticeGraphic = new SOMGraphics(lattice, 10);
  latticeGraphic.updateLatticeGraphic(lattice, 1);
  
  trainer = new SOMTrainer();
  latticeGraphic.updateButtons(mouseX, mouseY);
}

void draw() {
  if(!trainer.getStatus()) {
    // Make some colors.  Red, Green, Blue, Yellow, Purple, Black,white, and gray
    color[] colors = latticeGraphic.getVectorColors();
    trainer.setTrainingVectors(colors);
    trainer.setTraining(lattice, latticeGraphic);
    latticeGraphic.updateButtons(mouseX, mouseY);
  }
}

void mousePressed() {
  if(!trainer.getStatus()) {
    if(latticeGraphic.getStartStatus()) {
      cp5.window("Color Chooser").hide();
      trainer.start();
    }
    if(latticeGraphic.getResetStatus()) {
      lattice = new SOMLattice(40, 40);
      latticeGraphic = new SOMGraphics(lattice, 10);
      latticeGraphic.updateLatticeGraphic(lattice, 1);
      cp5.window("Color Chooser").hide();
    }
    boolean[] tempBool = latticeGraphic.getColorCircleStatus();
    for(int i = 0; i < 9; i++) {
      if(tempBool[i]) {
        cp5.controller("Red").setValue(red(latticeGraphic.getVectorColors()[i]));
        cp5.controller("Green").setValue(green(latticeGraphic.getVectorColors()[i]));
        cp5.controller("Blue").setValue(blue(latticeGraphic.getVectorColors()[i]));
        choiceColor = color(cp5.controller("Red").getValue(),cp5.controller("Green").getValue(),cp5.controller("Blue").getValue());
        choiceColorActive = color(cp5.controller("Red").getValue(),cp5.controller("Green").getValue(),cp5.controller("Blue").getValue(),50);
        cp5.controller("Choose").setColorBackground(choiceColor);
        cp5.controller("Choose").setColorForeground(choiceColorActive);
        if((red(choiceColor)+green(choiceColor)+blue(choiceColor))/3 <= 128) {
          cp5.controller("Choose").setColorCaptionLabel(color(255,255,255,0));
        }
        else {
          cp5.controller("Choose").setColorCaptionLabel(color(0,0,0,0));
        }
        vectorColorId = i;
        cp5.window("Color Chooser").setUndecorated(true);
        cp5.window("Color Chooser").show();
      }
    }
  }
}



