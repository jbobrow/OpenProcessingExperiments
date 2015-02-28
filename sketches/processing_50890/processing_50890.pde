
float rand;
float centerx;
float centery;

void setup() {
  
 size(900,900);
 background(0);
 smooth();
 frameRate(500); 

}

void draw() {
  rand = random(800);
  
  float r = random(0,100);
  float g = random(150,255);
  float b = random(255);
  float o = random(100);
  float t = random(255);
  float u = random(0,100);
  float v = random(150,255);
  float w = random(100);
  
  if (rand <= 400 && (mousePressed && (mouseButton == LEFT))) {
   stroke(r,g,b,o);
   strokeWeight(1);
   line(mouseX,mouseY,centerx,centery);
   
  }else if (mousePressed && (mouseButton == RIGHT)) {
    stroke(t,u,v,w);
    strokeWeight(2);
    line(mouseX,mouseY,centerx,centery);
  
  }else if (keyPressed) {
    if (key == ' ') {
     background(0); 
    }
  } 
  
}

void mousePressed() {
  centerx = mouseX;
  centery = mouseY;
  }

