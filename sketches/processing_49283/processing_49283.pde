
width = 500;
height = 300;
float DRAG = 0.3;
float GRAVITY = 200;
float MAX_SWING = 12;
float SWING_INITIAL = 3;
float SWING_INCREASE = 0.2;
float RELEASE_FLICK = 1.3;
float BOUNCE = 0.8;

class Ball {
  float cx, cy;              // Center values
  float ct;                  // Swing theta
  float cvt = SWING_INITIAL; // Swing speed
  float clen = 40.0;         // Swing length
  float x, y;                // Ball position
  float vx=0.0f, vy=0.0f;    // Ball velocity
  boolean released=false;
  Ball(int ix, int iy) {
    cx=ix;
    cy=iy;
  }
  
  // Convert angular momentum to directional, change the physics state
  void release() {
    released = true;
    float dx = clen*sin(ct);
    float dy = clen*cos(ct);
    vx = dy*cvt*RELEASE_FLICK;
    vy = -dx*cvt*RELEASE_FLICK;
  }
  
  // Update the physics, depending on the release state
  void update(float dt) {
    if (released) {
      vx *= 1-(DRAG*dt);
      vy *= 1-(DRAG*dt);
      vy += GRAVITY*dt;
      
      if (x < 0) {
        x = 0;
        vx = abs(vx)*BOUNCE; 
      } else if (x > width) {
        x = width;
        vx = -abs(vx)*BOUNCE;
      }
      if (y < 0) {
        y = 0;
        vy = abs(vy)*BOUNCE; 
      } else if (y > height) {
        y = height;
        vy = -abs(vy)*BOUNCE;
      }
      
      x += vx*dt;
      y += vy*dt;
    } else {
      if (cvt < MAX_SWING) {
        cvt += SWING_INCREASE;
      }
      ct += cvt*dt;
      float dx = clen*sin(ct);
      float dy = clen*cos(ct);
      x = cx+dx;
      y = cy+dy;
    }
  }
  
  // Draw ball and thrower
  void draw() {
    ellipse(cx, cy, 8, 8);
    ellipse(x, y, 8, 8);
  }
}

Ball b;
void setup() {
  size(500, 300);    // LAME! OpenProcessing doesn't size the applet
                     // correctly if you use variables for size
  smooth();
}

void mousePressed() {
  b = new Ball(mouseX, mouseY);
}

void mouseReleased() {
  b.release();
}


int current_time;
int previous_time;
int dt;
void draw() {
    background(0);
    previous_time = current_time;
    current_time = millis() / 1000;
    if (previous_time != null) {
        if (b != null) {
            dt = current_time - previous_time;
            b.update(dt);
            b.draw();
        }
    }
}
                
                                                                                                                                                                                                
