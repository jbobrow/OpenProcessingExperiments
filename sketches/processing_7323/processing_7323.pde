
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7323*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * A LSystem example with a SimpleGrammar 
 * This LSystem library is available at Kenai version 0.8.1
 * http://kenai.com/projects/l-system-utilities/downloads
 */
 
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
* Adapted from lystem-animated.py by mark meyer | http://www.photo-mark.com
*/

import lsystem.*;
 
float distance = 300;
float rightTurnAngle = 0.92921; // ca. 180 degrees
float leftTurnAngle =  0.92921;
int depth = 5;
Grammar grammar;
 
void setup(){
  size(500, 500);
  setupGrammar();
  frameRate(15);
}
 
void setupGrammar(){
  grammar = new SimpleGrammar(this, "w");
  grammar.addRule('w', "A"); // This is the starting rule
  grammar.addRule('A', "B+A+B");
  grammar.addRule('B', "A-B-A");
  grammar.generateGrammar(depth);
  distance *= pow(0.95, depth);
}
 
void draw(){
  background(0);
  strokeWeight(1);
  colorMode(HSB, 1.0);
  stroke(random((frameCount%14)/15.0),1,1);
  noFill();
  translate(width/2, height/2); //starting point
  render();
}
 
void render(){
  CharacterIterator it = grammar.getIterator();
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch(ch){
    case 'A':
    case 'B':
      line(0, 0, 0, -distance);
      translate(0, -distance);
      break;   
    case '+':
      rotate(rightTurnAngle);
      break;
    case '-':
      rotate(leftTurnAngle);
      break;
    case '[':
      pushMatrix();
      break;
    case ']':
      popMatrix();
      break;
    default:
    }
  }
  leftTurnAngle -= PI/180; // 1 degree increments
  rightTurnAngle -= PI/180;
}



