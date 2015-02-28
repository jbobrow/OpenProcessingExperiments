
float daexx = 200;
float daexy = 200;
float estyx = 300;
float estyy = 300;

void setup(){
  size(500,500);
  background(255,255,255);
  noStroke();
}

void draw(){
  esty();
  daex();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(255,255,255);
    rect(0,0,width,height);
    daexx = mouseX;
    daexy = mouseY;
  } else if (mouseButton == RIGHT) {
    fill(255,255,255);
    rect(0,0,width,height);
    estyx = mouseX;
    estyy = mouseY;

  }
}

void esty(){
      noStroke();
  fill (255,230,230);
    ellipse (estyx, estyy, 100, 100);
    ellipse (estyx+35, estyy+15, 60, 60);
    ellipse (estyx-35, estyy+15, 60, 60);  
  fill (245,200,200);
    ellipse (estyx+35, estyy+15, 40, 30);
    ellipse (estyx-35, estyy+15, 40, 30);
  fill (0,0,0);
    ellipse (estyx+15, estyy-5, 10, 10);
    ellipse (estyx-15, estyy-5, 10, 10);  
  fill (155,0,0);
    ellipse (estyx, estyy+20, 20, 10);
   fill (200,50,155);
    ellipse (estyx, estyy-50, 10, 10); 
    triangle (estyx, estyy-50, estyx+20, estyy-35, estyx+20, estyy-65); 
    triangle (estyx, estyy-50, estyx-20, estyy-35, estyx-20, estyy-65);
  textAlign(CENTER);
  text("esty", estyx, estyy+45); 
}

void daex(){ 
    strokeWeight(1);
  stroke(0,0,0);
    line (daexx, daexy, daexx-50, daexy-50);
    line (daexx, daexy, daexx+50, daexy-50);
    line (daexx, daexy, daexx-40, daexy-60);
    line (daexx, daexy, daexx+40, daexy-60);
    line (daexx, daexy, daexx-30, daexy-66);
    line (daexx, daexy, daexx+30, daexy-66);
    line (daexx, daexy, daexx-20, daexy-70);
    line (daexx, daexy, daexx+20, daexy-70);
    line (daexx, daexy, daexx, daexy-75);
  noStroke();
  fill (255,235,130);
    ellipse (daexx, daexy, 100, 100);
    ellipse (daexx+35, daexy+15, 60, 60);
    ellipse (daexx-35, daexy+15, 60, 60);  
  fill (0,0,0);
    ellipse (daexx+15, daexy-5, 10, 10);
    ellipse (daexx-15, daexy-5, 10, 10);
  fill (155,0,0);
    ellipse (daexx, daexy+20, 50, 10);
  textAlign(CENTER);
  text("daex", daexx, daexy+45);  
}
