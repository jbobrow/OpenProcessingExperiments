
color c;
int wheelRadius = 256;
PGraphics wheel;

void setup() {
  colorMode(HSB);
  size(1024, 512);
  smooth();
  noLoop();
  
  wheel = createGraphics(512,512);
  colorTriangle(256, 0, 256, wheelRadius);
}


void colorTriangle(int iteration, int hue, int saturation, int triHeight) {
  wheel.beginDraw();
  wheel.smooth();
  wheel.colorMode(HSB);
  wheel.translate(256, 256);
    
  for(int i = 0; i< iteration; i++){
    wheel.fill((hue+i)%256, saturation, 256);
    wheel.stroke((hue+i)%256, saturation, 256);
    wheel.triangle(0, 0, 128*tan(radians(5.625/4)), triHeight, -128*tan(radians(5.625/4)), triHeight);
    //wheel.ellipse(0,150,25,150);
    wheel.rotate(radians(5.625/4));
  }
  
  wheel.endDraw();
}


void draw(){
  background(0);
  image(wheel,0,0);
  translate(256, 256);
  float angle = atan2(mouseY-256,mouseX-256);

  c = get(256+(int)(150*cos(angle)),256+(int)(150*sin(angle)));
  
  strokeWeight(2);
  // centre wheel
  fill(c);
  stroke(200);
  ellipse(0,0, 100,100);
  
  // white track
  noFill();
  ellipse(0,0,200,200);
  
  // outer circle
  ellipse(0,0,512,512);
  
  // tracker circle  
  pushMatrix();
  rotate(angle);
  stroke(0);
  fill(120,100);
  ellipse(100,0,10,10);
  popMatrix();
  
  // text box 
  fill(200);
  stroke(200);
  textSize(15);
  text("Color: "+hex(c,6),150,240);
  
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


