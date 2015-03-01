
int radius = 200;
int startX = 250;
int stopX = 240;
int startY = 250;
int stopY = 250;
float x = startX;
float y = startY;
float speed = .5;
float direction = 1;

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  background(51, 153, 255);
}

void draw() {
    
  fill (255, 204, 153);
  beginShape();
  vertex(225, 800);
  vertex(225, 200);
  vertex(200, 100);
  vertex(0, 100);
  vertex(0, 25);
  vertex(200, 0);
  vertex(600, 0);
  vertex(800, 25);
  vertex(800, 100);
  vertex(600, 100);
  vertex(575, 200);
  vertex(575, 800);
  endShape(CLOSE);
  noStroke();
  
  fill (255, 204, 153);
  
  x += speed * direction;
 
  if ((x > 270) || (x < 240)){
    direction = -direction;
  }
  ellipse (x, 250, radius, radius);
  ellipse (width - x, 250, radius, radius);
  
  fill(255, 0, 255);
  triangle(220, 160, 320, 315, 160, 315);
  triangle(580, 160, 480, 315, 640, 315);
  quad(218, 162, 298, 1, 302, 1, 222, 162);
  quad(582, 162, 502, 1, 498, 1, 578, 162);
  quad(312, 308, 312, 312, 483, 312, 483, 308);
  
  if(mousePressed) {
    fill(255, 204, 153);
    triangle(220, 160, 320, 315, 160, 315);
    triangle(580, 160, 480, 315, 640, 315);
    quad(218, 162, 298, 1, 302, 1, 222, 162);
    quad(582, 162, 502, 1, 498, 1, 578, 162);
    quad(312, 308, 312, 312, 483, 312, 483, 308);
    
    fill(255, 0, 255);
    triangle(220, 160, 120, 245, 160, 315);
    triangle(580, 160, 680, 245, 640, 315);
    quad(218, 162, 298, 1, 302, 1, 222, 162);
    quad(582, 162, 502, 1, 498, 1, 578, 162);
    
    fill(0);
    quad(180, 320, 180, 180, 620, 180, 620, 320);
}else{
  fill(51, 153, 255);
  quad(1, 1, 1, 800, 800, 800, 800, 1);
  
  fill (255, 204, 153);
  beginShape();
  vertex(225, 800);
  vertex(225, 200);
  vertex(200, 100);
  vertex(0, 100);
  vertex(0, 25);
  vertex(200, 0);
  vertex(600, 0);
  vertex(800, 25);
  vertex(800, 100);
  vertex(600, 100);
  vertex(575, 200);
  vertex(575, 800);
  endShape(CLOSE);
  noStroke();
  
  fill (255, 204, 153);
  
  x += speed * direction;
 
  if ((x > 250) || (x < 240)){
    direction = -direction;
  }
  ellipse (x, 250, radius, radius);
  ellipse (width - x, 250, radius, radius);
  
  fill(255, 0, 255);
  triangle(220, 160, 320, 315, 160, 315);
  triangle(580, 160, 480, 315, 640, 315);
  quad(218, 162, 298, 1, 302, 1, 222, 162);
  quad(582, 162, 502, 1, 498, 1, 578, 162);
  quad(312, 308, 312, 312, 483, 312, 483, 308);
}
}
