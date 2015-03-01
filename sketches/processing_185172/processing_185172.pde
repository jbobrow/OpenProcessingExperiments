
int black = #000000;
int white = #ffffff;
int[] angles = { 90, 90, 90,90};
PFont f; 
void setup() {
  background(white);
size (600,600);
  noStroke();
  noLoop();  // Run once and stop
 f = createFont("Times roman",16,true);
}
void draw(){

fill(black);
ellipse(300, 300, 500, 500);
fill (white);
ellipse(300, 300, 300, 300);

  pieChart(300, angles);
  
  textFont(f,85);                 // STEP 4 Specify font to be used
  fill(255);                        // STEP 5 Specify font color 
  text("B",140,180);
  text("M", 255, 140);
  text("W", 390 , 180);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0 ; i < data.length; i++) {
    float gray = map(i, 0, data.length, 50, 255);
    fill(gray);
    
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
  
}

