
/**
 * InteractiveField02.pde - Marius Watz, 2012
 * http://workshop.evolutionzone.com
 * 
 * Example of a grid of regular points being
 * repulsed by the mouse cursor.
 */
 
 import controlP5.*;

import unlekker.util.*;
import unlekker.modelbuilder.*;
import unlekker.modelbuilder.filter.*;
import ec.util.*;


public Pt pt[];
public int nx, ny, n;
public float step, fieldForce, velocity;
public PVector mousePos, mouseDelta;
public boolean drawLine=true;
public USimpleGUI gui;

public void setup() {
  size(800, 600);
  
  step=60;
  fieldForce=200;
  velocity=0.1f;
  mousePos=new PVector();
  mouseDelta=new PVector();

  initGUI();
  build();
}

public void draw() {
  float d, force, rad;

  background(255);

  fill(255);
  stroke(0);
  mousePos.set(mouseX, mouseY,0);

  for (int i=0; i<n; i++) pt[i].update();
  
  // draw lines first
  if(drawLine) {
    for (int i=0; i<n; i++) pt[i].draw(true);
  }
  
  for (int i=0; i<n; i++) pt[i].draw(false);

  gui.draw();
}

