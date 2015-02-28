
//Chun Wi Wu
//practice curve with random in class

PImage pc1 ;

void setup() {
  size(400, 300);
  //noLoop();
  frameRate(1);
  smooth();
  pc1 = loadImage("moon.jpeg");
  
  
}
void draw() {
  
  //background picture
  pushMatrix();
  noStroke();
  scale(2);
  image(pc1, -6, -40);
  popMatrix();
  // dark level
  fill(0, random(110,130));
  rect(0, 0, width, height);
  float radius1 = 206; 
  int centX = 200; 
  int centY = 150; 
  //blue shine
  strokeWeight(180);
  stroke(3,23,67,random(70,90)); 
  noFill(); 
  ellipse(centX, centY, radius1*2, radius1*2);
  float radius = 105;
  // draw the filled circle using "shape"
  float x, y; 
  float noiseval = random(10);
  float radVariance1, radVariance2, thisRadius1, thisRadius2, rad;
  float a, b;

  beginShape();
  for (float ang=0; ang<=360; ang+=3) { 
    rad = radians(ang); 
    // noise define
    noiseval += 0.1; 
    //===============================================================
    radVariance1 = random(40);
    radVariance2 = random(20);
    //===============================================================
    // funtion with circle
    thisRadius1 = radius+radVariance1; 
    thisRadius2 = radius+radVariance2; 
    x = centX + (thisRadius1 * cos(rad)); 
    y = centY + (thisRadius1 * sin(rad)); 
    a = centX + (thisRadius2 * cos(rad)); 
    b = centY + (thisRadius2 * sin(rad));
    // between 2 point line
    strokeWeight(0.2);
    stroke(200,40);
    line(x, y, a, b);
    // point
    noFill(); 
    strokeWeight(2);
    stroke(193,73,4,50); 
    point(x, y);
    point(a, b);
    // curve
    strokeWeight(0.6);
    stroke(220,20); 
    curveVertex(x, y); 
    //curveVertex(a, b);    
  }
  endShape(CLOSE);
  
}



 



