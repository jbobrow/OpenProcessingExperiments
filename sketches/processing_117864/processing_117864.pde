
/* 
click to edit the sketch
*/

color[] palette1 = {#61FF0B, #FE19FF, #B200B2, #FFF900};
color[] palette2 = {#1A00B2, #3B19FF, #1FFF1D, #2B1140};

void setup() {
 size (1000, 400); 
 background(0);
 smooth();
}

void draw() {
  
  float x = random(50);
  float b = random(4);
  
  noFill();
  stroke(palette1[int(b)]);
  strokeWeight(random(3));
  ellipse(width/2, height/2, 500, 500); 
  strokeWeight(1);
  line(0, height/2, width, height/2);
  line(width/2, height, width/2, 0);
  
  strokeWeight(random(5));
  stroke(palette1[int(b)], 20);
  fill(palette1[int(b)], 50);
  ellipse(250, height/2, x, x);
  
  strokeWeight(random(20));
  stroke(palette1[int(b)]);
  fill(palette1[int(b)], 50);
  ellipse(500, height/2, x+30, x+30);
  
  strokeWeight(random(5));
  stroke(palette1[int(b)], 20);
  fill(palette1[int(b)], 50);
  ellipse(750, height/2, x, x);
  
  fill(0);
  stroke(random(3));
  ellipse(250, height/2, 4, 4);
  ellipse(750, height/2, 4, 4);
  ellipse(500, height/2, 6, 6);
}

void mousePressed() {
  float x = random(600);
  float x1 = random(800);
  float b = random(4);
  
  if (x < 200) {
  strokeWeight(random(3));
  stroke(palette2[int(b)], 70);
  fill(palette2[int(b)], 90);
  ellipse(250, height/2, x, x);
  
  strokeWeight(random(3));
  stroke(palette2[int(b)], 70);
  fill(palette2[int(b)], 90);
  ellipse(750, height/2, x, x);
  
   } if (x < 300) {
    noFill();
    stroke(palette1[int(b)], 30);
    strokeWeight(random(20));
    ellipse(250, height/2, x, x);
    
    noFill();
    stroke(palette1[int(b)], 30);
    strokeWeight(random(20));
    ellipse(750, height/2, x, x);
    
    } else {
    fill(0);
    ellipse(250, height/2, x, x);
    ellipse(750, height/2, x, x);
    
    fill(0);
    ellipse(250, height/2, x, x);
    ellipse(750, height/2, x, x);
  }
  
  
  if (x1 > 400) {
  strokeWeight(random(20));
  stroke(palette2[int(b)]);
  fill(palette2[int(b)], 60);
  ellipse(500, height/2, x1, x1);
  } else {
  strokeWeight(random(20));
  stroke(0);
  fill(palette2[int(b)], 60);
  ellipse(500, height/2, x1, x1);
 }
}
