
//Modified by dharman Gersch 2013
/*
 * Copyright (c) 2010 Karsten Schmidt
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
//-----------------------------------------imports

import toxi.sim.grayscott.*;
import toxi.math.*;
import toxi.color.*;
import controlP5.*;
//-----------------------------------------global variables

GrayScott gs;
ToneMap toneMap;
PImage img;
ControlP5 controlP5;
ControlWindow controlWindow;
// initialise GS coefficient variables for sliders
float coefficientA = 0.023;
float coefficientB = 0.074;
float coefficientC = 0.13;
float coefficientD = 0.13;
//-----------------------------------------setup
void setup() {
  size(256, 256);

  gs=new GrayScott(width, height, false);
  controlP5 = new ControlP5(this);
  setupP5();
  //set coefficients. vary these
  //gs.setCoefficients(0.023,0.074,0.095,0.03);
  
  img=loadImage("SZ_GS_input_image.png");
  // create a duo-tone gradient map with 256 steps
  toneMap=new ToneMap(0, 0.33, NamedColor.BLACK, NamedColor.WHITE, 256);
  gs.seedImage(img.pixels, img.width, img.height);
}
//-----------------------------------------draw
void draw() {
  gs.setCoefficients(coefficientA, coefficientB,coefficientC, coefficientD);
  
  if (mousePressed) {
    gs.setRect(mouseX, mouseY, 20, 20);
  }
  loadPixels();
  for (int i=0; i<10; i++) gs.update(1);
  // read out the V result array
  // and use tone map to render colours
  for (int i=0; i<gs.v.length; i++) {
    pixels[i]=toneMap.getARGBToneFor(gs.v[i]);
  }
  updatePixels();
//saves frames for volume extrusion in medical software or animation
  if (frameCount <= 250) {
   // saveFrame("SZ_GS_image_01-####.jpg");
  }
}
//-----------------------------------------additional functions
void keyPressed() {
  if (key>='1' && key<='9') {
    gs.setF(0.02+(key-'1')*0.001);
  } 
  else {
    gs.reset();
  }
}


