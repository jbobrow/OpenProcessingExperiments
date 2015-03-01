
int yy = 1;
int xx = 2;
color b1, b2, c1, c2;

float angle;
float jitter;

void setup() {
 
size(1000, 500);
smooth();


 b1 = color(255);
 b2 = color(255,0,0);
 c1 = color(204, 102, 0);
 c2 = color(0, 102, 153);

}

void draw() {
 
 if (key == 'q' || key == 'Q') {
  ch4();
 } 
 
 if(key == 'w' || key == 'W') {
   ch5();
 }
 
 if(key == 'e' || key == 'E') {
   ch6();
 }
 
}

void ch4() {
  
    // background
  setGradient(0, 0, width, height, b1, b2, xx);
  
  rectMode(CENTER);
  // foreground
  noStroke();
  fill(155, 0, 0);
  rect(100, 250, 750, 150);

  }

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {

  // gradient
  
if (axis == xx) {  
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void ch5() {
  

  
  rectMode(CENTER);
     background(0);
     smooth(4);
 fill(255);
 PFont poopFont;
 poopFont = loadFont("Helvetica-Bold-48.vlw");
 textFont(poopFont, 20);
 text("click", 200, height/2);

  // during click jitters
  if (mousePressed) {  
    jitter = random(-0.5, 0.2);
    fill(200,50,50);
         
   
  } else {
    fill(255);
    noStroke();
    jitter = random(0);
  } 
  
  angle = angle + jitter;
  float c = tan(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(0, 0, 180, 180); 
   
   
  
}

void ch6() { 
  
 background(0);
 smooth(4);
 PFont poopFont;
 poopFont = loadFont("Helvetica-Bold-48.vlw");
 textFont(poopFont, 45);
 fill(255);
 text("poop", mouseX, 255);
 fill(0);
 ellipse(300,250, 200, 200);
 ellipse(700,250, 200, 200);

}


