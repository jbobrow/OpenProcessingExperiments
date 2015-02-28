
/**
 * A 3D LSystem example with a SimpleGrammar 
 * Features use of a my sin/cos lookup tables for calculation of cylinder faces (and to compute normal). 
 * There is a fixed precision of 1 degree in my lookup tables(note degree rather than radian input for 
 * lookup tables) so makes sense to set number of sides of "cylinder" accordingly
 * This LSystem library is available at Kenai version 0.7.2
 * http://kenai.com/projects/l-system-utilities/downloads
 * Comment out 'size(800, 600, P3D);' and uncomment the opengl lines for a better experience
 * works best with new opengl (formerly opengl2, else there is clipping)
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

import lsystem.util.*;
import lsystem.turtle.*;
import lsystem.collection.*;
import lsystem.*;
//import processing.opengl.*; // optimised for new version (else there is clipping)
// It'll be even better when I get PShapes3D to work!!!

Grammar grammar;

float distance = 300;  // reduce size or increase depth for old opengl (see above)
int depth = 2;

// adjust centre of hilbert
float[] adjust = {
  0.0, 0.5, 1.5, 3.5, 7.5
};

// adjust resolution with depth (ie decrease)
int[] detail = {
  36, 24, 18, 15, 12
};
float THETA = radians(90);
float PHI = radians(90);
String production = "";

void setup() {
  //size(800, 600, OPENGL);
  size(800, 600, P3D);
  //configureOpenGL();
  LUT.initialize(); 
  setupGrammar();
  float fov = PI/3.0; 
  float cameraZ = (height/2.0) / tan(fov/2.0); 
  perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
  noStroke();
}

//void configureOpenGL() {
//  hint(ENABLE_OPENGL_4X_SMOOTH);
//  hint(DISABLE_OPENGL_ERROR_REPORT);
//}

/**
 * Encapulates the lsystem rules, and calls the grammar to create the production rules
 * depth is number of repeats, and distance is adjusted according to the number of repeats
 */

void setupGrammar() {
  grammar = new SimpleGrammar(this, "A");   // this only required to allow applet to call dispose()
  grammar.addRule('A', "B>F<CFC<F>D+F-D>F<1+CFC<F<B1^");
  grammar.addRule('B', "A+F-CFB-F-D1->F>D-1>F-B1>FC-F-A1^");
  grammar.addRule('C', "1>D-1>F-B>F<C-F-A1+FA+F-C<F<B-F-D1^");
  grammar.addRule('D', "1>CFB>F<B1>FA+F-A1+FB>F<B1>FC1^");
  production = grammar.createGrammar(depth);
  if (depth > 0) {
    distance *= 1/(pow(2, depth) - 1);
  }
}

void draw() {
  background(20, 20, 200);
  lights();
  pushMatrix();  
  translate(width/2, height/2, 0);
  rotateX(LUT.sin(frameCount));
  rotateY(LUT.cos(frameCount));
  pushMatrix();
  translate(-distance * adjust[depth], distance/2 * adjust[depth], -distance/2 * depth);   
  render();
  popMatrix();
  popMatrix();
}

/**
 * Draw a smooth cylinder capped at one end with a sphere uses
 * a look up table for sin and cos (NB: degree not radians)
 * @distance the length of the cylinder
 */
void drawRod(float distance) {
  int sides = detail[depth]; // ensure 360 % sides is zero
  float r = distance/7;
  int angle = 0;
  int angleIncrement = 360 / sides;
  translate(0, 0, distance/2);
  beginShape(QUAD_STRIP);
  for (int i = 0; i <=  (sides + 1); i++) {
    normal(LUT.cos(angle), LUT.sin(angle), 0);  
    vertex(r*LUT.cos(angle), r*LUT.sin(angle), distance/2);
    vertex(r*LUT.cos(angle), r*LUT.sin(angle), -distance/2);     
    angle += angleIncrement;
  }
  endShape();  
  translate(0, 0, distance/2);
  // hemisphere cap cylinder
  nextCap(distance/7, detail[depth], detail[depth]);
}

/**
 * Render wraps the drawing logic; draws a cylinder at origin,
 * followed by successive drawRod(distance) to complete the hilbert
 * according to lsystem rules (ie whenever there is an 'F').
 */

void render() {
  int repeats = 1;  
  fill(191, 191, 191);
  ambientLight(80, 80, 80);
  directionalLight(100, 100, 100, -1, -1, 1);
  ambient(122, 122, 122); 
  lightSpecular(30, 30, 30); 
  specular(122, 122, 122); 
  shininess(0.7); 
  sphereDetail(detail[depth]);
  sphere(distance/7);  // draw a sphere to cap the 1st cylinder
  CharacterIterator it = grammar.getIterator(production);
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch (ch) {
    case 'F': 
      drawRod(distance); // NB pre and post translation all done in drawRod()
      break;
    case '+':
      rotateX(THETA * repeats);
      repeats = 1;
      break;
    case '-':
      rotateX(-THETA * repeats);
      repeats = 1;
      break;  
    case '>':
      rotateY(THETA * repeats);
      repeats = 1;
      break;
    case '<':
      rotateY(-THETA * repeats);
      repeats = 1;
      break;
    case '^':
      rotateZ(PHI * repeats);
      repeats = 1;
      break;
    case '1':
      repeats += 1;
      break;  
    case 'A':
    case 'B':
    case 'C':
    case 'D': 
      break;
    default:
      System.err.println("character " + ch + " not in grammar");
    }
  }
}

/**
* hemisphere cap, saves drawing spheres detail is number of lat
* long divisions of the sphere
* @r radius float
* @lats latitude division int
* @long longitude division int
*/

void nextCap(float r, int lats, int longs) {
  int halfLats = lats / 2; 
  for (int i = 0; i <= halfLats; i++) 
  {
    float lat0 = -90 + 180 * (i - 1)/ lats;
    float z0 = LUT.sin(lat0) * r;
    float zr0 = -LUT.cos(lat0) * r;

    float lat1 = -90 + 180 * i/ lats;
    float z1 = LUT.sin(lat1) * r;
    float zr1 = -LUT.cos(lat1) * r;
    beginShape(QUAD_STRIP);
    for (int j = 0; j <= longs; j++)
    {
      int direct = -1;
      float lng = 360 * (j - 1) / longs;
      float x = LUT.cos(lng);
      float y = -LUT.sin(lng);
      normal(x * zr0, y * zr0, -z0);
      vertex(x * zr0, y * zr0, -z0);       
      normal(x * zr1, y * zr1, -z1);
      vertex(x * zr1, y * zr1, -z1);
    }
    endShape();
  }
}

void keyReleased() {
  switch(key) {
  case '+':
    if (depth <= 3) { // guard against a depth we can't handle
      depth++;
      distance = 300;
      setupGrammar();
    }
    break;
  case '-':
    if (depth >= 2) {
      depth--;
      distance = 300;
      setupGrammar();
    }
    break;
  }
}


