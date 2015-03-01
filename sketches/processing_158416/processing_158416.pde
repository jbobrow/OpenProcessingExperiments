
int drawMode = 0;
int drawSpeed = 600; 
color bgcolor = color(255);
color pgcolor = color(0);

PGraphics pg;
PGraphics pg2;

void setup() {
  size(900, 330);
  background(bgcolor); 
  colorMode(HSB, 360, 100, 100); 
  rectMode(CENTER);
  PFont f = createFont("bariol-regular",350);
  PFont f2 = createFont("Bitter-Bold",250);


  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textFont(f);
  pg.textSize(350);
  pg.textAlign(CENTER, CENTER);
  pg.fill(pgcolor);
  pg.text("kiwi", pg.width/2, pg.height/2); 
  pg.endDraw();
  
  pg2 = createGraphics(width, height, JAVA2D);
  pg2.beginDraw();
  pg2.textFont(f2);
  pg2.textSize(250);
  pg2.textAlign(CENTER, CENTER);
  pg2.fill(pgcolor);
  pg2.text("ice", pg2.width/2, pg2.height/2); 
  pg2.endDraw();
}

void draw() {
  
  switch (drawMode) {
  case 0:
  for (int i=0; i<drawSpeed; i++) {

    int x = (int) random(width);
    int y = (int) random(height);
    
    boolean insideText = (pg.get(x, y) == pgcolor);
 
    if (insideText) {      
      pushMatrix();
      translate(x, y);
        float er = random(5,9);
        color ec = color(random(70, 130), 90, 95);
        stroke(0, 170);
        fill(ec);
        ellipse(0, 0, er, er);
       popMatrix();
    } else{
      pushMatrix();
      translate(x, y);
      float er = random(5, 7);
      color ec = color(random(40, 45), 30, 60);
      stroke(0, 170);
      fill(ec);
      ellipse(0, 0, er, er); 
      popMatrix();
    }    
  }
  break;
  case 1:
  for (int i=0; i<drawSpeed; i++) {

    int x = (int) random(width);
    int y = (int) random(height);
    
    boolean insideText2 = (pg2.get(x, y) == pgcolor);
 
    if (insideText2) {      
      pushMatrix();
      translate(x, y);
        float td = random(5, 7);
        float tr = random(TWO_PI);
        color tc = color(random(180, 200), random(0,13), 100);
        stroke(0,170);
        fill(tc);
        rotate(tr);
        triangle(0, -td, -td, td, td, td);
       popMatrix();
    } else{
      pushMatrix();
      translate(x, y);
      float td = random(4, 6);
      float tr = random(TWO_PI);
      color tc = color(random(170, 210), random(50,100), 100);
      stroke(0,170);
      fill(tc);
      rotate(tr);
      triangle(0, -td, -td, td, td, td);
      popMatrix();
    }    
  }
  break;
  
  
}
}
void mousePressed() {
  background(bgcolor); 
  drawMode = ++drawMode%2; 
}



