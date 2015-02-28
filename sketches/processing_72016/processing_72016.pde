
PVector circleCenter;
PVector circleRadii;
PVector colors;
PVector colorsChanging;

int armRadius;

int numArms = 6;
float armWidth = PI/(numArms*2);
float angle = 0.0;
float inc = PI/240; //used for creating the spiral
int rotSpeedDenominator = 60;
float rotspeed = PI/rotSpeedDenominator;
float rotation;
PGraphics spiral;

void setup() {
  size(500,500,P2D);
  background(0);
  circleCenter = new PVector(width/2,height/2);
  circleRadii = new PVector(1,1);
  colors = new PVector(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  colorsChanging = new PVector(1,0,0);
  noStroke(); 
  smooth();
  cursor(CROSS);
  ellipseMode(RADIUS);
  ellipseMode(CENTER);
  armRadius = (int)circleRadii.x;
  
  spiral = generateSpiral();
}

PGraphics generateSpiral() {
  PGraphics ret;
  float startTime = millis();
  ret = createGraphics(width*2,height*2,P2D);
  ret.beginDraw();
  ret.background(0);
  
  pickColor();
  ret.fill(255,255,255);
  ret.noStroke();
  ret.smooth();
  //background(0);
  
  
  ret.translate(width,height);
  
  for (int l = 0; l < width*2; l++) {
    ret.rotate(inc);  //angle
    ret.ellipse(0,0,circleRadii.x,circleRadii.y);
    
    ret.noFill();
    ret.stroke(255,255,255);
    ret.strokeWeight(2);
  
    for (int i = 0; i < numArms; i=i+2) {
      ret.arc(0,0,armRadius, armRadius, PI*i/numArms*2, PI*(i+1)/numArms*2);
    }
    armRadius++;
    if (armRadius > (width*2)) armRadius = (int)circleRadii.x;
    angle += inc;

  }
  
  
  
  
  
  ret.endDraw();
  float duration = millis() - startTime;
  println("generated in " + duration);
  return ret;
}

void pickColor() {
  
  if (random(1) > .95) {
    int bit = int(random(1,3));
    if (bit == 1) colorsChanging = new PVector(1,0,0);
    else if (bit == 2) colorsChanging = new PVector(0,1,0);
    else if (bit == 3) colorsChanging = new PVector(0,0,1);
  }
  
  if (colorsChanging.x != 0) {
    colors.x=colors.x+colorsChanging.x;
    if (colors.x > 255) colorsChanging.x = -1;
    if (colors.x <= 0) colorsChanging.x = 1;
  } 
  if (colorsChanging.y != 0) {
    colors.y=colors.y+colorsChanging.y;
    if (colors.y > 255) colorsChanging.y = -1;
    if (colors.y <= 0) colorsChanging.y = 1;
  }  
  if (colorsChanging.z != 0) {
    colors.z=colors.z+colorsChanging.z;
    if (colors.z > 255) colorsChanging.z = -1;
    if (colors.z <= 0) colorsChanging.z = 1;
  } 
  //fill(colors.x,colors.y,colors.z);
}

void draw() {  
  
  pickColor();
  
  //translate(mouseX-width/2,mouseY-height/2);
  pushMatrix();
  translate(width/2,height/2);
  rotate(-rotation);
  translate(-width/2,-height/2);
  
  tint(colors.x,colors.y,colors.z);
  image(spiral,0-width/2,0-height/2);
  popMatrix();
  //fill(255,255,255);
  float dis = dist(mouseX,mouseY,width/2,height/2);
  if (dis < 50) { 
    if (rotSpeedDenominator > 40) rotSpeedDenominator--;
  } else {
    rotSpeedDenominator = 60;
  }
  rotspeed = PI/rotSpeedDenominator;
  rotation += rotspeed;
  
  if (rotspeed > PI) {angle = 0;}
}

