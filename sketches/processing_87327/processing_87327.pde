
float x, y, wd, ht;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  x = 200;
  y = 200;
  wd = 250;
  ht = 250;
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  figure(mouseX, mouseY, wd, ht);
}

void keyPressed() {
  if (key == 'a') {
    wd = wd + (wd / 2);
  }
  if (key == 's') {
    wd = wd - (wd / 2);
  }
  if (key == 'z') {
    ht = ht + (ht / 2);
  }
  if (key == 'x') {
    ht = ht - (ht / 2);
  }
}

void figure (float fx, float fy, float fwd, float fht) {
  
  strokeWeight(4);
  stroke(255, 150, 150);
  noFill();
    
    // Left Lens
    beginShape();
    curveVertex(fx - (fwd * .125), fy - (fht * .75));
    
    curveVertex(fx - (fwd * .125), fy - (fht * .5));
    curveVertex(fx - (fwd * .375), fy - (fht * .375));
    curveVertex(fx - (fwd * .625), fy - (fht * .5));
    
    curveVertex(fx - (fwd * .625), fy - fht);
    endShape();
     
    // Right Lens
    beginShape();
    curveVertex(fx + (fwd * .125), fy - (fht * .75));
    
    curveVertex(fx + (fwd * .125), fy - (fht * .5));
    curveVertex(fx + (fwd * .375), fy - (fht * .375));
    curveVertex(fx + (fwd * .625), fy - (fht * .5));
    
    curveVertex(fx + (fwd * .625), fy - fht);
    endShape();
      
    // Glasses Top
    beginShape();
    curveVertex(fx - (fwd * .625), fy - (fht * .5));
    
    curveVertex(fx - (fwd * .625), fy - (fht * .5));
    curveVertex(fx + (fwd * .625), fy - (fht * .5));
    
    curveVertex(fx + (fwd * .625), fy - (fht * .5));
    endShape();
      
  // Glasses End
    
  // Moustache
   
    // Top Curve
    beginShape();
    curveVertex(fx - (fwd * .625), fy);
    
    curveVertex(fx - (fwd * .625), fy + (fht * .5));
    curveVertex(fx, fy - (fht * .125));
    curveVertex(fx + (fwd * .625), fy + (fht * .5));
    
    curveVertex(fx + (fwd * .625), fy);
    endShape(); 
  
    // Bottom Curve
    beginShape();
    curveVertex(fx - (fwd * .625), fy + (fht * .5));
    
    curveVertex(fx - (fwd * .625), fy + (fht * .5));
    curveVertex(fx - (fwd * .125), fy + (fht * .25));
    curveVertex(fx, fy - (fht * .125));
    curveVertex(fx + (fwd * .125), fy + (fht * .25));
    curveVertex(fx + (fwd * .625), fy + (fht * .5));
    
    curveVertex(fx + (fwd * .625), fy + (fht * .5));
    endShape(); 
    
  // Cheeks
  ellipse(fx - (fwd * .375), fy - (fht * .125), fwd * .125, fht * .125);
  ellipse(fx + (fwd * .375), fy - (fht * .125), fwd * .125, fht * .125);
  
  // Eyes
  ellipse(fx - (fwd * .375), (fy - (fht * .5)) + (fht * .025), fwd * .05, fht * .05);
  ellipse(fx + (fwd * .375), (fy - (fht * .5)) + (fht * .025), fwd * .05, fht * .05);
  
  noStroke();
}

