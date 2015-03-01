
/*
 *  WheelEncoderSimulator - Simulates the wheel and encoder system on a MuriBot
 *  Copyright (C) 2014 M.Stone
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

float rotation; // Rotation of the wheel
float dt, dt_counter, last_time; // Time keeping variables
int counts, last_counts; // Variables to store the encoder counts

// The speed of the wheel (0.0f-1.0f)
float speed = 1f;
float SliceWidthInMM;

// Kalman filter variables
float xhat, phat = 1.0f, k, xnew, pnew = 1.0f;
float p_noise = .00001f;
float m_noise = .001f;

void setup() {
  size(800, 600);
  frameRate(10000);
  smooth();
  textFont(loadFont("spritefont.vlw"), 16);
  SliceWidthInMM = ((PI*2.0f)*16.0f)/92.0f;
}

void draw() {
  // Calculate umber of milliseconds between frames
  dt = (millis() - last_time)/1000.0f;
  // Update our waveform frequency counter and store the
  // last time
  dt_counter += dt;  
  last_time = millis();
  
  // Calculate rotation
  rotation += (((2.0f*PI)*(((80*(3.33/4.5))*.9f)/60)) * speed)*dt;
  
  // Store last counts so we can check to see if we've got
  // a new tick
  last_counts = counts;
  // Convert our current rotation into encoder ticks
  // the Muribot encoder has 92 ticks per revolution.
  // ratio = rotation / 2PI
  // encoder counts = 92 * ratio;  
  counts = (int)((rotation / (2.0f*PI)) * 92.0f);
  
  // If we detect an encoder tick
  if(counts != last_counts)
  {
      // Update kalman filter
      xhat = xnew+p_noise;
      phat = pnew;      
      k = phat / (phat + m_noise);
      xnew = xhat + (k * ((SliceWidthInMM/dt_counter) - xhat));
      pnew = (1.0f - k) * phat;            
      //println(phat + ", " + xhat  + ", " + k  + ", " + pnew  + ", " + xnew);
      // Clear waveform frequency counter
      dt_counter = 0;
  }     
  // Clear background, and draw the wheel, and information panel
  background(0,0,33);     
  stroke(255);
  strokeWeight(2);
  fill(0,0,33);
  line(0, 350, 800, 350);
  pushMatrix();
  translate(400, 300);
  rotate(rotation);
  ellipse(0, 0, 100, 100);
  line(0, 0, 0, 50);
  popMatrix(); 
  noStroke();
  fill(33, 33, 33, 127);
  rect(0, 550, 800, 600);
  fill(255);
  text("Counts: " + counts + ", Speed: " + xnew + "mm/s" , 10, 575);
}


