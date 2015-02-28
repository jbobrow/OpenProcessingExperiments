
 /* 
 * Copyright (c) 2011 Martin Prout
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

/**
 * advance.pde by Martin Prout requires my lsystem library (available on kenai)
 * based on pentive? fractal see http://www.nahee.com/spanky/www/fractint/lsys/spacefilling.html
 */

import lsystem.util.*;
import lsystem.collection.*;
import lsystem.*;
 
Grammar grammar;
float drawLength;
float xpos;
float ypos;
float DELTA = 36; // 36 degrees lookup table takes degree not radians input
float theta = 0;
String production;
ArrayList points;
 
void setup() {
  size(800, 800);
  createLSystem();
  points = new ArrayList();
  stroke(255);
  strokeWeight(3);
  smooth();
  LUT.initialize();
  xpos = 0;
  ypos = 0;
  translateRules();
  colorMode(HSB, 1.0);
  frameRate(5);
}
 
void createLSystem(){
  int generations = 5;
  String axiom = "Q";
  grammar = new SimpleGrammar(this, axiom);
  grammar.addRule('F', "");
  grammar.addRule('P',"1-FR3+FS1-FU");
  grammar.addRule('Q', "FT1+FR3-FS1+");
  grammar.addRule('R', "1+FP3-FQ1+FT");
  grammar.addRule('S', "FU1-FP3+FQ1-");
  grammar.addRule('T', "+FU1-FP+");
  grammar.addRule('U', "-FQ1+FT-");
  drawLength = 30;
  production = grammar.createGrammar(generations);
}
 
void translateRules() {
  int repeats = 1;
  CharacterIterator it = grammar.getIterator(production);
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch(ch){
    case 'F':
      float[] temp = {
        xpos, ypos, (xpos += drawLength * LUT.cos(theta)), (ypos -= drawLength * LUT.sin(theta))
        };
        points.add(temp);
      break;
    case '+':
      theta += (DELTA * repeats);
      repeats = 1;
      break;
    case '-':
      theta -= (DELTA * repeats);
      repeats = 1;
      break;
    case '1':
    case '3':
      repeats += (int)ch - 48;
      break;
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
      break;
    default:
      System.err.println("character " + ch + " not in grammar");
    }
  }
}
 
void draw(){
  background(20, 20, 20);
  translate(width/2, height/2);
  for (int i = 0; i<10; i++)
  {
    rotate(PI/5);
    drawElement();
  }
}
 
void drawElement() {
  stroke(color(random(1.0), random(1.0), random(1.0)));
  fill(color(random(1.0), random(1.0), random(1.0)));
  float[] tmp; // placeholder for array of points that describe line
  beginShape();
  for (int i = 0; i < points.size(); i++)
  {
    tmp = (float[])points.get(i);
    vertex(tmp[0], tmp[1]);
    vertex(tmp[2], tmp[3]);
  }
  endShape(CLOSE);
}

