
int counter = 0;
ArrayList<Dot> dots;
int time = 20;

void setup(){
  size(512,512);
  background(0);
  ellipseMode(CENTER);
  dots = new ArrayList();
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
        if (i % 2 == 0 && j % 2 == 0 || i % 2 != 0 && j % 2 != 0) {//if i is even AND j is even
          dots.add(new Dot(color(0,0,0), color(0,0,255), color(0,0,0), i*(512/5) + 512/5, j*(512/5) + 512/5, 20, 32));
        }
        else {
          dots.add(new Dot(color(0,0,255), color(0,0,0), color(0,0,255), i*(512/5) + 512/5, j*(512/5) + 512/5, 20, 32));
        } 
    }  
  }
    counter = 0;
}

void draw(){
  
  if (counter == time) {
    for (Dot d: dots) {
      d.blink();
    }  
    counter = 0; 
  }
  
  for (Dot d : dots) {
    d.display();
  }
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
    stroke(curr_color);
    fill(curr_color);
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
    

