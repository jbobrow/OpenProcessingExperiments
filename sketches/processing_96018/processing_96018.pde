
// Pi Sectors
//
// Press 's' to switch between fill and stroke

int globalsize = 20;
int gd = 200/globalsize;
Quarter[] circles = new Quarter[int(sq(gd))];
boolean strokes = false;
color bgr = color(0);

void setup() {
 size(300,300);
 background(bgr);
 ellipseMode(CENTER);
 
 for (int i = 0; i < gd; i++) {
  for (int u = 0; u < gd; u++) {
    circles[i+u*(gd)] = new Quarter( ((100+500%globalsize)/2)+ i*globalsize, ((100+500%globalsize)/2)+ u*globalsize);
  }
 } 
 
}

void draw() {
 background(bgr);
 for (int i = 0; i < gd; i++) {
  for (int u = 0; u < gd; u++) {
    circles[i+u*(gd)].Show();
  }
 } 
  
  
}

class Quarter {
  
  int x,y;
  boolean fade = false;
  float r,g,b,o,t;
  color c;
  int type;
  
  Quarter(int p, int k) {
    r = random(255);
    g = random(255);
    b = random(255);
    o = random(200);
    t = random(3, 8);
    type = int(random(4));
    switch(type) {
      case 0:
        x=p+globalsize; y=k+globalsize; break; 
      case 1:
        x=p; y=k+globalsize; break; 
      case 2:
        x=p+globalsize; y=k; break;
      case 3:
        x=p; y=k; break; 
    }
  }
  
  void Show() {

    if (strokes) { stroke(r,255,b,o); noFill(); } else { noStroke(); fill(r,255,b,o); }
     switch(type) {
      case 0:
        arc(x,y,globalsize,globalsize, PI, PI+HALF_PI); break;
      case 1:
        arc(x,y,globalsize,globalsize, PI+HALF_PI, TWO_PI); break;   
      case 2:
        arc(x,y,globalsize,globalsize, HALF_PI, PI); break;  
      case 3:
        arc(x,y,globalsize,globalsize, 0, HALF_PI); break;  
    }
    if (!fade) { o+=t; } else { o-=t; }
    if ( o >= 255 ) { fade = true; }
    if ( o <= 0 ) { r = random(255); g = random(255); b = random(255); fade = false; t = random(2, 5); type = int(random(4)); t = random(2, 3); }
    
       
  }
  
  
}

void keyPressed() {
 if (key == 's') { strokes = !strokes; } 
  
}


