
float t = 90;

void setup() {
  size(1000,700);
  smooth();
  
  PFont font;
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font, 40);
  
}

void draw() {
  background(255);
  // Starting point for graph
  int s = second();
  int m = millis();
  int h = 47304000 - (m /900);
  float xoff = t;
 
  for (int i = 100 ;  i < 900  ; i++) {
    stroke(255,0,0);
    strokeWeight(4);
    smooth();
    // Get current and "next" noise value
    float y1 = noise(xoff)*height;
    float y2 = noise(xoff+0.01)*height;
    // Draw line
    line(i,y1,i+1,y2);
    text(h,800,60);
    fill(100);
    //line(0,350,100,350);
    //line(900,350,1000,350);
    //line(100,350,100,i);
    text("heartbeats remaining :",350,60);
    //line(900,i,900,350);
    
    fill(255,0,0);
    // Increment xoff
    xoff += 0.01;

  }
  // Increment "time" for whole graph
 t+= 0.03;
}

