
float n;
float theta = 0;
PGraphics pg;

void setup() {
 size(700, 400);
 background(255); 
 frameRate(10);
 pg = createGraphics(700, 400, P3D);
 pg.beginDraw();
 pg.background(255);

 pg.endDraw();
}

void draw() {
  pg.beginDraw();
  pg.noStroke();
  pg.fill(255, 255, 255, 1.01);
  pg.rect(0, 0, width, height);
  pg.pushMatrix();
  pg.translate(width/2, height/2); 
  theta = n*PI/100;
  pg.rotate(-theta);
  
   
  pg.stroke(0);
  pg.strokeWeight(5);
  pg.line(0, 0, 0, -mouseY/2);
  pg.popMatrix();
  
  pg.endDraw();
  
  pushMatrix();
  translate(width/2, height/2); 
  rotate(theta);
  translate(-width/2, -height/2); 
  image(pg, 0, 0);
  popMatrix();
  
   n = n + 1;
 
  /*translate
    rotate
    pushMatrix
    popMatrix
    PGraphics
  */
}

