
PGraphics pg1, pg2, pg3; 

color c1, c2, c3;
float diam = 150;
float radius = 75;  
float step1, step2, step3; 
float mx, my; 
int bgColor = 360; 

void setup() {
  size(300, 300); 
  noStroke(); 
  smooth(); 
  frameRate(200); 
  colorMode(HSB, 360, 100, 100);

  pg1 = createGraphics(width, height);
  pg2 = createGraphics(width, height);
  pg3 = createGraphics(width, height);

  mx = width/2; 
  my = height/2;

  c1 = color(random(360), 100, 100);
  c2 = color(random(360), 100, 100);
  c3 = color(random(360), 100, 100);

  step1 = 0; 
  step2 = 0; 
  step3 = 0; 
}

void draw() {
  background(bgColor);

  float x, y; 
  translate(width/2, height/2); 

  x = mx + radius * cos(step1); 
  y = my + radius * sin(step1); 

  pg1.beginDraw(); 
  pg1.background(0, 0);
  pg1.noStroke();
  pg1.smooth(); 
  pg1.fill(c1); 
  pg1.ellipse(x, y, diam, diam);
  pg1.endDraw();  

  x = mx + radius * cos(step2); 
  y = my + radius * sin(step2); 
  pg2.beginDraw(); 
  pg2.background(0, 0);
  pg2.noStroke();
  pg2.smooth(); 
  pg2.fill(c2); 
  pg2.ellipse(x, y, diam, diam);
  pg2.endDraw();  

  x = mx + radius * cos(step3); 
  y = my + radius * sin(step3); 
  pg3.beginDraw(); 
  pg3.background(0, 0);
  pg3.noStroke();
  pg3.smooth(); 
  pg3.fill(c3); 
  pg3.ellipse(x, y, diam, diam);
  pg3.endDraw();  
  
  pg1.blend(pg2, 0, 0, width, height, 0, 0, width, height, DIFFERENCE); 
  pg1.blend(pg3, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);

  image(pg1, -mx, -my);

  step1 += 0.01; 
  step2 += 0.03; 
  step3 += 0.05; 

}

void mouseReleased(){
  c1 = color(random(360), 100, 100);
  c2 = color(random(360), 100, 100);
  c3 = color(random(360), 100, 100);
}

void keyReleased(){
  if(key == 'b' || key == 'B'){
    bgColor = (bgColor == 360) ? 0 : 360;
  }
}

/* ***********************************************************

Unforunately processing.js doesn't know blendMode()...
Below is the Procesing version: 

color c1, c2, c3, c4, c5;
float diam = 175;
float radius = 100;  
float step1, step2, step3, step4, step5; 
int bgColor = 360; 

void setup() {
  size(400, 400, P2D); 
  noStroke(); 
  smooth(); 
  background(bgColor); 
  blendMode(EXCLUSION); 
  colorMode(HSB, 360, 100, 100);

  c1 = color(random(360), 100, 100);
  c2 = color(random(360), 100, 100);
  c3 = color(random(360), 100, 100);
  c4 = color(random(360), 100, 100);
  c5 = color(random(360), 100, 100);

  step1 = 0; 
  step2 = 0; 
  step3 = 0; 
  step4 = 0;
  step5 = 0;
}

void draw() {
  background(bgColor);

  float x, y; 
  translate(width/2, height/2); 

  x = radius * cos(step1); 
  y = radius * sin(step1); 
  fill(c1); 
  ellipse(x, y, diam, diam); 

  x = radius * cos(step2); 
  y = radius * sin(step2); 
  fill(c2); 
  ellipse(x, y, diam, diam);

  x = radius * cos(step3); 
  y = radius * sin(step3); 
  fill(c3); 
  ellipse(x, y, diam, diam); 

  x = radius * cos(step4); 
  y = radius * sin(step4); 
  fill(c4); 
  ellipse(x, y, diam, diam);  

  x = radius * cos(step5); 
  y = radius * sin(step5); 
  fill(c5); 
  ellipse(x, y, diam, diam); 

  step1 += 0.01; 
  step2 += 0.015; 
  step3 += 0.02; 
  step4 += 0.025;
  step5 += 0.03;
}

void mouseReleased() {
  c1 = color(random(360), 100, 100);
  c2 = color(random(360), 100, 100);
  c3 = color(random(360), 100, 100);
  c4 = color(random(360), 100, 100);
  c5 = color(random(360), 100, 100);
}

void keyReleased(){
  if(key == 'b' || key == 'B'){
    bgColor = (bgColor == 360) ? 0 : 360;
  }
}

*/


