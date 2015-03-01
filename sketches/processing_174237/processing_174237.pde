
void setup() {
  size(600, 900);
}

void draw() {
  frameRate(3);
  background(#F5285E);
  drawTree(width/2, height, -70, 8);
}

void drawTree(float x1, float y1, float angle, float depth) {
  if (depth ==0) return;
  float x2 
    = x1 + cos(radians(angle)) * depth * 10;
  float y2 
    = y1 + sin(radians(angle)) * depth * 10;
  line(x1, y1, x2, y2);
  stroke(255);
  strokeWeight(random(1,10));
  drawTree(x2, y2, angle-20, depth-1); 
  drawTree(x2, y2, angle+20, depth-1);
  
  ellipse(width/2,height/2,5,5);
   fill(255);
 
 
  float size = random(1,5);
  float d1= random(0,600);
  float d2= random(0,600);
  float d3= random(0,600);
  ellipse(mouseX,mouseY,size,size);
  ellipse(mouseX+d1,mouseY+d2,size,size);
  ellipse(mouseX-d2,mouseY-d1,size,size);
  ellipse(mouseX-d2,mouseY+d3,size,size);
  ellipse(mouseX+d3,mouseY-d1,size,size);

  
  
}

