
void setup() {
  size(200,200);
  smooth();
}

void draw() {
  frameRate(60);
  background(196,233,251);
  noStroke();
  
//body
  fill(241, 90,41);
  triangle(89.36, 38.78, 53.23, 182.9, 124, 182.9);

//tail  
  ellipse(159,138, 72, 150);
  fill(196,233,251);
  ellipse(175,196, 80, 141);
  
//face  
  fill(241, 90,41);
  rect(53, 38, 72, 47.91);
  triangle(68.68, 5.65, 53.23, 38.78, 85.6, 38.78);
  fill(0);
  triangle(68.68, 5.65, 63.77, 16.18, 74.05, 16.18);

//ears  
  fill(241, 90,41);
  triangle(108, 5.65, 92.55, 38.78, 124.92, 38.78);
  fill(0);
  triangle(108, 5.65, 103.09, 16.18, 113.37, 16.18);
  
//cheeks  
  fill(241, 90,41);
  triangle(53.23, 38.78, 34.93, 62.74, 53.23, 86.69);
  triangle(124.78, 38.78, 143.08, 62.74, 124.78, 86.69);
  fill(252,240,155);
  triangle(34.93, 62.74, 71.21, 67.04, 53.23, 86.69);
  triangle(71.21, 67.04, 53.23, 86.69, 82.5, 87.58);
  triangle(143.08, 62.74, 106.8, 67.04, 124.78, 86.69);
  triangle(95.51, 87.58, 106.8, 67.04, 124.78, 86.69);

//legs  
  fill(241, 90,41);
  ellipse(118.23, 174.83, 52.32, 85);
  ellipse(59.57, 174.83,52.32, 85);
  rect(123.98, 172.04, 31.19, 10.8);
  rect(22.85, 172.04, 31.19, 10.8);
  
//belly  
  fill(252,240,155);
  ellipse(89.01, 182.84, 35.24, 115.66); 

//feets  
  fill(187, 70, 29);
  rect(60.76, 174.83, 21.09, 8.01);
  rect(96.16, 174.83, 21.09, 8.01);

  
//nose  
  fill(0);
  triangle(85.49, 92.41, 89.06, 98.51, 92.56, 92.38);

//ground  
  fill(141, 198, 63);
  rect(0, 182.84, 200, 100);
  
//eyes  
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(64.84, 51.14, 10.54, 18.1);
  ellipse(113.38, 51.14, 10.54, 18.1);
  noStroke();
  fill(241, 90,41);
  rect(53.23, 40.95, 71.55, 8.06);

//whiskers  
  strokeWeight(1);
  stroke(0);
  line(64.84, 92.38-mouseY/30, 82.5, 82.77);
  line(71.39, 95.44-mouseY/30, 82.5, 85);
  line(95.72, 82.77, 113.38, 92.38-mouseY/30);
  line(95.72, 85, 106.83, 95.44-mouseY/30);
  
// aw chicken feathers 
  noStroke();
  fill(255);
  ellipse(mouseX,mouseY,13.42, 30.18);
  fill(0);
  rect(mouseX,mouseY-8,1.46,30);
  stroke(0);
  strokeWeight(1);
  line(mouseX, mouseY, mouseX+5, mouseY-5); 
  line(mouseX-4, mouseY, mouseX, mouseY+5); 
  line(mouseX-4, mouseY-9, mouseX, mouseY-4); 

}

void mousePressed() {
  frameRate(3);
  noStroke();
  fill(196,233,251);
  triangle(108.06, 3.77, 100.48, 16.21, 116.24, 16.21);
  fill(187, 70, 29);
  triangle(103.09, 15.95, 108.43, 26.48, 113.38, 15.95);
}               
