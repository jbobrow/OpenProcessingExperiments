
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */

int num;

float[] x, y;       // current drawing position
float[] dx, dy;     // change in position at each frame
float[] i_phase;    // phase for first invisible circle
float[] v_phase;    // phase for visible line
float[] len;        // max length of visible line

color bkg_color;
boolean showConstruct;


void init_new_drawing(int elements_num) {
  num = elements_num;
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  i_phase = new float[num];
  v_phase = new float[num];
  len = new float[num];
  
  randomSeed(hour() + minute() + second() + millis());
  
  for (int i = 0; i < num; i++) {
      // initial position in the centre of the screen
      x[i] = width/2;
      y[i] = height/2;
      // dx and dy are the small change in position each frame
      dx[i] = random(-1, 1);
      dy[i] = random(-1, 1);
      //
      i_phase[i] = random(TWO_PI);
      v_phase[i] = random(TWO_PI);
      //
      len[i] = random(50, 150);      
  }
  
}

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0);
  
  init_new_drawing(200);
  
  showConstruct = false;
    
}


void draw() {
  // blend the old frames into the background
  //blendMode(ADD);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);

  float max = 1;
  float min = 0.5;

  
  for (int i = 0; i < num; i++) {
    
        float rad = radians(frameCount);


        // calculate new position
        x[i] += dx[i];
        y[i] += dy[i];
      
      
        //When the shape hits the edge of the window, it reverses its direction and changes velocity
        if (x[i] > width-len[i] || x[i] < len[i]) {
          dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
        }
      
        if (y[i] > height-len[i] || y[i] < len[i]) {
          dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
        }
        
        
        /// Hidden construct
        
        if (showConstruct) {
            stroke(255, 0, 0);
            point(x[i],y[i]);
            
//            stroke(255,255,0,25);
//            ellipseMode(RADIUS);
//            ellipse(x[i],y[i],200,200);
        }
       
        
        // Draw Art
        
        int H = 100;
        int S = 255;
        int B = 255;
        int A = 50;
        
        if (i<num-1) {
            float distance = dist(x[i], y[i], x[i+1], y[i+1]);
            H = (int)map(distance,0,width/sqrt(2),0,360);            
        }
        
        float bx = x[i] + len[i] * sin(rad + i_phase[i]);
        float by = y[i] + len[i] * cos(rad + i_phase[i]);
      
        //fill(180);
      
        float radius = len[i] * sin(rad*0.05 + v_phase[i]);
        float angle = rad*3 + v_phase[i];
        if (i % 2 == 1) angle *= -1;
        float handX = bx + radius * sin(angle);
        float handY = by + radius * cos(angle);
      
        stroke(H, S, B, 50);
        noFill();
        ellipseMode(CORNERS);
        line(bx, by, handX, handY);
      
  }
}


void mousePressed() {
    int new_num = (int)map(dist(width/2, height/2, mouseX, mouseY), 0, height/sqrt(2), 5, 500);
    init_new_drawing(new_num);
  
}

void keyPressed() {
    switch (key) {
        case 'h': 
            showConstruct = !showConstruct;
            break;
        case CODED:
            if (keyCode == UP || keyCode == RIGHT) init_new_drawing(++num);
            if (keyCode == DOWN || keyCode == LEFT) init_new_drawing(--num);
            break;
        default:
            break;
  }
}

