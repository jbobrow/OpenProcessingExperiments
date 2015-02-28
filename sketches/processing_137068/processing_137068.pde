
                                                                    /* 
 * Copyright (c) 2009 Karsten Schmidt
 * 
 * This library is free software; you can redistribute it and/or
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

Ryan Mills: to use in processing js
 1. uncomment the below sections (leave as PDE)
 2. copy toxiclibs.js to the export base directory
 3. modify index.html to put in the js reference to toxiclibs.js

 Uploading as such will work (magic?) on OpenProcessing and standard browsers

 Thus, toxiclibs is game on in usage for processing.js
 */


// uncomment for JavaScript usage
 var  AbstractWave = toxi.math.waves.AbstractWave,
      SineWave = toxi.math.waves.SineWave,
      FMTriangleWave = toxi.math.waves.FMTriangleWave,
      FMSawtoothWave = toxi.math.waves.FMSawtoothWave,
      FMSquareWave = toxi.math.waves.FMSquareWave,
      FMHarmonicSquareWave = toxi.math.waves.FMHarmonicSquareWave,
      FMSineWave = toxi.math.waves.FMSineWave,
      AMFMSineWave = toxi.math.waves.AMFMSineWave,
      ConstantWave = toxi.math.waves.ConstantWave;


console.log("FMHarmonicSquareWave",FMHarmonicSquareWave);

//the below sketch will work in Processing as well
     
import toxi.math.waves.*;
import processing.opengl.*;

AbstractWave waveX,waveY;

int STEP = 25;
int DIM = 800;
int D2 = DIM/2;
int AMP = 50;

void setup() {
  size(940, 600, OPENGL);
  noStroke();
  waveX=createRandomWave();
  waveY=createRandomWave();
  textFont(createFont("SansSerif", 14));
}

void draw() {
  background(0);
  //lights();
  pushMatrix();
  translate(width*0.5, height*0.4, 0);
  rotateX(0.8);
  rotateZ(mouseX*0.01);
  scale(0.5);
  float prevY = waveY.update();
  float colPrevY = 0;
  waveY.push();
  for(int y = 0; y < DIM; y += STEP) {
    float valueY = waveY.update();
    float colY = valueY * 128 + 128;
    waveX.push();
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < DIM; x += STEP) {
      float valueX = waveX.update();
      float colX = valueX * 128 + 128;
      fill(colX, 0, colPrevY);
      vertex(x - D2, y - STEP - D2, (valueX + prevY) * AMP);
      fill(colX, 0, colY);
      vertex(x - D2, y - D2, (valueX + valueY) * AMP);
    }
    endShape();
    waveX.pop();
    prevY = valueY;
    colPrevY = colY;
  }
  waveY.pop();
  waveX.update();
  waveY.update();
  popMatrix();
  fill(255);
  text(waveX.getClass().toString(), 20, 30);
  text(waveY.getClass().toString(), 20, 45);
}

void mousePressed() {
  waveX=createRandomWave();
  waveY=createRandomWave();
}

AbstractWave createRandomWave() {
  AbstractWave w=null;
  AbstractWave fmod = new SineWave(0, random(0.005, 0.02), random(0.1, 0.5), 0);
  float freq=random(0.005, 0.05);
  //var r =(int)random(7);
  int r = (int) random(7);
  //console.log(r);
  switch(r) {
  case 0:
    w = new FMTriangleWave(0, freq, 1, 0, fmod);
    break;
  case 1:
    w = new FMSawtoothWave(0, freq, 1, 0, fmod);
    break;
  case 2:
    w = new FMSquareWave(0, freq, 1, 0, fmod);
    break;
  case 3:
    w = new FMHarmonicSquareWave(0, freq, 1, 0, fmod);
    ((FMHarmonicSquareWave)w).maxHarmonics=(int)random(3,30);
    break;
  case 4:
    w = new FMSineWave(0, freq, 1, 0, fmod);
    break;
  case 5:
    w = new AMFMSineWave(0, freq, 0, fmod, new SineWave(0, random(0.01,0.2), random(2, 3), 0));
    break;
  case 6:
    w = new ConstantWave(random(-1,1));
    break;
  }
  return w;
}


