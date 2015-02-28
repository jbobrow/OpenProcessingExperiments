
int counter = 0;
Dot dot1;
Dot dot2;
Dot dot3;
Dot dot4;

void setup(){
  size(512,512);
  background(0);
  ellipseMode(CENTER);
  dot1 = new Dot(color(0,0,0), color(0,0,255), color(0,0,0), 128, 128, 20, 32);
  dot2 = new Dot(color(0,0,255), color(0,0,0), color(0,0,255), 384, 128, 20, 32);
  dot3 = new Dot(color(0,0,255), color(0,0,0), color(0,0,255), 128, 384, 20, 32);
  dot4 = new Dot(color(0,0,0), color(0,0,255), color(0,0,0), 384, 384, 20, 32);
  counter = 0;
}

void draw(){
  
  if (counter == dot1.time) {
    dot1.blink();
    dot2.blink();
    dot3.blink();
    dot4.blink();
    counter = 0; 
  }
  
  stroke(dot1.curr_color);
  fill(dot1.curr_color);
  dot1.display();
  stroke(dot2.curr_color);
  fill(dot2.curr_color);
  dot2.display();
  stroke(dot3.curr_color);
  fill(dot3.curr_color);
  dot3.display();
  stroke(dot4.curr_color);
  fill(dot4.curr_color);
  dot4.display();

  counter++;
}

class Dot {
  color start_color;
  color osc_color;
  color curr_color;
  float xpos;
  float ypos;
  int time;
  float radius;
  
  Dot(color temp_color1, color temp_color2, color current_color, float dot_xpos, float dot_ypos, int dot_counter, float dot_radius) {
    start_color = temp_color1;
    osc_color = temp_color2;
    curr_color = current_color;
    xpos = dot_xpos;
    ypos = dot_ypos;
    time = dot_counter;
    radius = dot_radius;
  }
  
  void display() {
    ellipse(xpos, ypos, radius, radius);
  }
  
  void blink() {
    if (curr_color == start_color) { 
      stroke(osc_color);
      fill(osc_color);
      curr_color = osc_color;
    }
    else {
      stroke(start_color);
      fill(start_color);
      curr_color = start_color;
    }
  }
}
    

