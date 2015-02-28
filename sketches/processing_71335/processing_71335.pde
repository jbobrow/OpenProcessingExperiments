
float p = 0, q = 1000, x, y, r = 20;
  
void setup() {
  size(600,600);
  background(0);
  smooth();
  noFill();
  frameRate(1000);

}
 
void draw() {
  strokeWeight(1);
  stroke(55, 100 + 200 * sin(r/10), random(255));//colors
  x = 300+ 173 *cos(r)-50*cos(r*155/77);
  y = 300+ 173*sin(r)-50*sin(r*155/77);
  if(p > 0)
    line(p, q, x, y);
  else background(255);
  p = x;
  q = y;
  r+= PI/20;
}
 
void mouseDragged() {
  if (key == '1') {
     strokeWeight(5);
  }
  else if (key == '2') {
     strokeWeight(3);
  }
  else if (key == '3') {
  
  }
  else {
  }
}
 
void mousePressed() {
  if (key == '1') {
  }
  else if (key == '2') {
     strokeWeight(1);
  }
  else if (key == '3') {
     strokeWeight(1);
  }

  else {
     
  }
}
//background change  
void keyPressed() {
  if (key == 'q') {
      strokeWeight(1);
  stroke(55, 100 + 200 * sin(r/10), random(255));//colors
  x = 300+ 173 *cos(r)-50*cos(r*155/77);
  y = 300+ 173*sin(r)-50*sin(r*155/77);
  if(p > 0)
    line(p, q, x, y);
  else background(255);
  p = x;
  q = y;
  r+= PI/20;
    
  }
  
  else if (key == 'w') {
     strokeWeight(2);
  }
  if (key == 'e') {
    fill (0, 255, 0);
  }
  if (key == 'r') {
    fill (0, 0, 255);
  }
  if (key == 't') {
    fill (random(256), random(256), random(256));
  }
}


