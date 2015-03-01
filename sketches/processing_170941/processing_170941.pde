
/*
  Project:     fmsoda animated logo
  Name:        fmsoda
  Purpose:     Main module
              
  Author:      Dr. Martin Braendle
               mpbraendle__AT__gmail
               
  Address:     Switzerland
  
  Date:        2012-12-27
  Modified:    2013-01-04 added lower/upper edge array for logo edges
               2013-02-07 major revision - use of SVG instead of font
               2013-02-10 resolution independent display (for high-res displays such as Retina)
  Uses:        -
  
  Copyright:   2012- Martin Brändle
  License:     The fmsoda animated logo code is Open Source Software. It is released under the 
               GNU GPL (General Public License). For more information, see 
               http://www.opensource.org/licenses/gpl-license.php
               
               THE fmsoda animated logo code IS PROVIDED TO YOU "AS IS", AND WE MAKE NO EXPRESS 
               OR IMPLIED WARRANTIES WHATSOEVER WITH RESPECT TO ITS FUNCTIONALITY, OPERABILITY, 
               OR USE, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, 
               FITNESS FOR A PARTICULAR PURPOSE, OR INFRINGEMENT. WE EXPRESSLY DISCLAIM ANY 
               LIABILITY WHATSOEVER FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL OR SPECIAL 
               DAMAGES, INCLUDING, WITHOUT LIMITATION, LOST REVENUES, LOST PROFITS, LOSSES RESULTING 
               FROM BUSINESS INTERRUPTION OR LOSS OF DATA, REGARDLESS OF THE FORM OF ACTION OR LEGAL 
               THEORY UNDER WHICH THE LIABILITY MAY BE ASSERTED, EVEN IF ADVISED OF THE POSSIBILITY 
               OR LIKELIHOOD OF SUCH DAMAGES. 
               
               By using this code, you agree to the specified terms.             
  
  Requires:    Processing Development Environment (PDE), http://www.processing.org/
               
  Generates:   JavaScript code that can be used in a Web browser.
  
==========================================================================================================================  
*/

/* 
  Visualisation model:
  
  The animation displays rising bubbles in letters of string  (or any other object), similar to gas bubbles in a fluid 
  (e.g. carbonated water, beer, ...). There are 4 phases:
  
  phase 0: nucleation: after random (time, position) creation, bubble grows to some random size
  phase 1: rise: bubble rises to upper edge of letter
  phase 2: pop:  bubble stays at upper edge and gets slowly smaller for some time
  phase 3: remove: bubble is removed
*/

// Control parameters
int canvas_width_init = 263;
int canvas_height_init = 70;
int max_bubbles = 50;                        // maximum number of bubbles 
int bubble_diameter_min_init = 3;            // minimum diameter of a bubble             
int bubble_diameter_max_init = 6;            // maximum diameter of a bubble
int nucleation_freq_min = 15;                // minimum number of frame counts until next bubble is created
int nucleation_freq_max = 40;                // maximum number of frame counts until next bubble is created
int growth_time_min = 10;                    // minimum number of frame counts until bubble has grown to its final diameter
int growth_time_max = 40;                    // maximum number of frame counts until bubble has grown to its final diameter
float speed_factor_init = 1.0;               // speed of rise
float acceleration_init = 0.04;              // acceleration per frame until speed is reached
float chitter_init = 0.5;                    // side chitter, should be <= 1, otherwise unrealistic effect
int pop_factor = 3;                          // determines pop time, which is pop_factor * bubble size
int detect = 0xFF65BEEC - 4294967296;        // detection color

float resolution;
int canvas_width;
int canvas_height;
int bubble_diameter_min;
int bubble_diameter_max;
float speed_factor;
float acceleration;
float chitter;

PShape logo;
ArrayList bubbles;
int [] edge_lower;
int [] edge_upper;
int nucleation_time;
float scale_factor;

float fm_width;
float soda_width; 
float logo_height;
float logo_width;
float logo_offset;
int bubble_edge_x;

void setup() {
  resolution = window.devicePixelRatio;
  if (resolution == undefined) {
    resolution = 1.0;
  }
  canvas_width = int(canvas_width_init * resolution);
  canvas_height = int(canvas_height_init * resolution);
  bubble_diameter_min = int(bubble_diameter_min_init * resolution);
  bubble_diameter_max = int(bubble_diameter_max_init * resolution);
  speed_factor = speed_factor_init * resolution;
  acceleration = acceleration_init * resolution;
  chitter = chitter_init * resolution;
  
  size(canvas_width,canvas_height);
  colorMode(RGB);
  bubbles = new ArrayList();
  nucleation_time = int(random(nucleation_freq_min,nucleation_freq_max));
  // logo = loadShape("/wp-content/themes/ETHERNA_WP/fmsoda_logo.svg");
  logo = loadShape("fmsoda_logo.svg");
  
  scale_factor = min(canvas_width/logo.width, canvas_height/logo.height);
  logo_width = logo.width * scale_factor;
  logo_height = logo.height * scale_factor;
  
  logo.scale(scale_factor);
  
  // determine edges
  edge_lower = new int[canvas_width];
  edge_upper = new int[canvas_width];
  
  background(255,255,255,0);
  shape(logo,0,0);
   
  int j;
  int white_space = int(0.5 * (height - logo_height));
  for (int i = 0; i < canvas_width; i++) {
    // determine lower edge position
    j = min(height-1,height - white_space + 1);
    while (j > 0 && get(i,j) != detect) {
      j--; 
    }
    edge_lower[i] = j;
    // determine upper edge position
    j = max(0,white_space - 1);
    while (j < height && get(i,j) != detect) {
      j++;
    }
    edge_upper[i] = j;
  }
  
  // determine left edge position from which on bubbles will be created
  bubble_edge_x = 0;
  while (bubble_edge_x < canvas_width && edge_lower[bubble_edge_x] == 0) {
    bubble_edge_x++;
  }
}

void draw() {
  background(255,255,255,0);
  smooth();
  shape(logo,0,0);
   
  // create bubbles
  if (frameCount == nucleation_time) {
    // create a bubble
    if (bubbles.size() < max_bubbles) {
      float bubble_size_init = random(0,bubble_diameter_min-2);
      float bubble_size = random(bubble_diameter_min,bubble_diameter_max);
      float x_pos = random(bubble_edge_x + bubble_size/2, canvas_width - bubble_size/2);
      float y_pos = random(bubble_size/2,bubble_size);
      // println(int(x_pos) + " " + edge_lower[int(x_pos)]);
      if (edge_lower[int(x_pos)] > canvas_height/2) {
        // bubble within letters
        int growth_time = int(random(growth_time_min,growth_time_max));
        float max_speed = speed_factor * bubble_size;
        int pop_time = int(pop_factor * bubble_size);  
        bubbles.add(new Bubble(x_pos, edge_lower[int(x_pos)] - y_pos, bubble_size_init, bubble_size, growth_time,max_speed,pop_time));
        nucleation_time = frameCount + int(random(nucleation_freq_min,nucleation_freq_max));
      } else {
        // bubble outside letters, repeat next frame
        nucleation_time++; 
      }  
    } else {
      nucleation_time = frameCount + int(random(nucleation_freq_min,nucleation_freq_max));
    }
  }
  
  // animate and draw bubbles
  for (int i = bubbles.size()-1; i >= 0 ; i--) {
    Bubble bubble = (Bubble) bubbles.get(i);
    if (bubble.phase == 0) {
      bubble.nucleate();
    }
    if (bubble.phase == 1) {
      bubble.rise();
    }
    if (bubble.phase == 2) {
      bubble.pop();
    }
    if (bubble.phase == 3) {
      bubbles.remove(i);
    }
    bubble.display();
  }
}

class Bubble {
  float x,y;
  float size;
  float size_max;
  float growth_speed;
  int growth_time;
  float max_speed;
  int pop_time;
  float aspect_ratio;
  float speed;
  int growth_counter;
  int pop_counter;
  float pop_speed;
  int phase;  // 0 = nucleation, 1 = rise, 2 = pop, 3 = remove
  
  // constructor
  Bubble(float x_init, float y_init, float size_init, float size_max_init, int growth_time_init, float max_speed_init, int pop_time_init) {
    x = x_init;
    y = y_init;
    size = size_init;
    size_max = size_max_init;
    growth_time = growth_time_init;
    max_speed = max_speed_init;
    pop_time = pop_time_init;
    phase = 0;
    aspect_ratio = 1;
    growth_speed = (size_max - size) / growth_time;
    growth_counter = 0;
    pop_counter = 0;
    pop_speed = 1.0/float(pop_time);
    speed = 0;
  }
  
  // methods
  void display() {
   ellipseMode(CENTER);
   fill(0x80EEEEEE);
   stroke(0xE0FFFFFF);
   strokeWeight(0.5);
   float y_offset = size - size*aspect_ratio;
   ellipse(x,y - y_offset,size,size*aspect_ratio);
   fill(0xC0FFFFFF);
   stroke(0xC0FFFFFF);
   arc(x,y - y_offset,size - 0.5, size*aspect_ratio - 0.5 * aspect_ratio, PI, TWO_PI, 2);
  }
 
  void nucleate() {
    size = size + growth_speed;
    growth_counter++;
    if (growth_counter > growth_time) {
      phase = 1;
    }
  }
  
  void rise() {
    speed = speed + acceleration;
    if (speed >  max_speed) {
      speed = max_speed;
    }
    // add some side chitter for more realistic effect
    x = x + random(-chitter,chitter);
    y = y - speed;
    if (y < edge_upper[int(x)] + size/2) {
      phase = 2;
    }
  }
 
  void pop() {
    pop_counter++;
    aspect_ratio = aspect_ratio - pop_speed / 2; 
    if (pop_counter > pop_time) {
      phase = 3;
    }
  }
}


