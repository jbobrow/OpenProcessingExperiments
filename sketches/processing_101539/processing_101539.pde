
float x, y;
//r, g, b;
int timer;
color shapecolor;

float coffset; 
float sides = 5;
float size = 75;
float angleoffset = radians(10); 
float tan1, tan2;
float autox, autoy;

float tx = 0.02; // time for perlin noise
float ty = 400000.0;

boolean debug = false;
boolean auto = false;
 
void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  background(0);
  rectMode(CENTER);
  frameRate(15);
  autox = width/2;
  autoy = height/2;
  regen();
}

void regen() {
  if (millis() - timer >= 1000) {  
  
    if (random(10) <= 3) {
      sides += random(10) < 5 ? 1 : -1;
      sides = constrain(sides, 3, 10);
    }
    
    if (random(10) < 3) {
      if (random(10) < 5) {
        size = constrain(size+random(-20,20), 30, 120);
      }
    }
    
    if (random(10) < 5) {
      coffset = random(-size*0.5, size*0.5);
    }
  
    if (random(10) < 4) {
      angleoffset = degrees(angleoffset);
        angleoffset = angleoffset+random(-15,15);
        angleoffset = angleoffset % 360;
        angleoffset = radians(angleoffset);
    }
    
    if (random(10) < 2) {
      float a = random(-10,10);
      tan1 = radians((360 - 90 - a) % 360);
      tan2 = radians((360 + 90 + a) % 360);    
    }
    
    if (random(10) < 3) {
      float r = noise(frameCount * 0.01) * 255;
      float g = frameCount % 255;
      float b = 255 - noise(1 + frameCount * 0.025) * 255;
      shapecolor = color(r,g,b);
    }
    
    timer = millis();
  }
}
 
void draw() {
  
  float alpha = random(2);
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  regen();
  
  if(auto) {
      
    float maxmove = random(10,80);
    
    float xnoise = noise(tx) * maxmove - maxmove/2;
    autox += xnoise;
    if (autox < 0) autox += width;
    if (autox > width) autox -= width;
    tx += 0.2;
    
    float ynoise = noise(ty) * maxmove - maxmove/2;
    autoy += ynoise;
    if (autoy < 0) autoy += height;
    if (autoy > height) autoy -= height;
    ty += 0.8;
    
    float radius = noise(frameCount * 0.1) * 100;
    //fill(color(r, g, b),64);
    brush6(autox, autoy, maxmove, maxmove, radius);
  }
  
}

void mouseDragged() {
 
  // use frameCount and noise to change the radius
  float radius = noise(frameCount * 0.01) * 100;
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  brush6(mouseX, mouseY,speed, speed, radius);
  
}

void brush6(float x,float y, float px, float py, float lineWidth) {
  
  float c1x, c1y, c2x, c2y;
  
  
  fill(shapecolor, 64);
  
  beginShape();
  
  float firstx = x + size * sin(angleoffset);
  float firsty = y + size * cos(angleoffset);
  vertex(firstx, firsty);
  float prevx = firstx;
  float prevy = firsty;

  for (int i = 1; i <= sides; i++) {  
      float theta = radians(360/sides*i);
      theta = theta + angleoffset;
      float ptx = x + size * sin(theta);
      float pty = y + size * cos(theta);
      c1x = ptx + coffset * sin(theta - tan2);
      c1y = pty + coffset * cos(theta - tan2);
      c2x = ptx + coffset * sin(theta + tan2);
      c2y = pty + coffset * cos(theta + tan2);
      stroke(blue(shapecolor),green(shapecolor),red(shapecolor));
      strokeWeight(6);
      line (x,y,ptx,pty);
      
      if (debug) {
        point(ptx,pty);
        stroke(255,0,0);
        line(ptx, pty, c1x, c1y);
        stroke(255);
        line(ptx, pty, c2x, c2y);
      }
      
      // scale yellow profile's alpha to speed
      float alpha = map(px, 0,10, 0,255);
      stroke(255,255,200, alpha);
      strokeWeight(3);
      bezierVertex(c1x, c1y, c2x, c2y, ptx, pty);
      prevx = ptx;
      prevy = pty;
  }
  c1x = prevx + coffset * sin(tan1+angleoffset);
  c1y = prevy + coffset * cos(tan1+angleoffset);
  c2x = firstx + coffset * sin(tan2+angleoffset);
  c2y = firsty + coffset * cos(tan2+angleoffset);
  bezierVertex(c1x, c1y, c2x, c2y, firstx, firsty);
  endShape(CLOSE); 
  noStroke();
  return;
}

void keyPressed() {
  if (key == 'a') {
    auto = !auto;
    println("auto=" + auto); 
  }
}




