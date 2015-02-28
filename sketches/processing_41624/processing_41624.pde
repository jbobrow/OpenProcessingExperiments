
float cx1 = 0;
float cx2 = 0;
float cy1 = 0;
float cy2 = 0;

float c2x1 = 0;
float c2x2 = 0;
float c2y1 = 0;
float c2y2 = 0;

float pos1 = random (1,500);

void setup(){
  size(400,700);
  background(255);
  stroke(4);
  smooth();
}

void draw (){
  fill(255,50);
  rect(0,0,width,height);
 
  cx1 = random (0,400);
  cx2 = random (0,400);
  cy1 = random (0,400);
  cy2 = random (0,400);
  noFill();
  bezier((mouseX-pos1), (mouseY+100), cx1, cy2, cx2, cy2, (mouseX+100), (mouseY-100)); 
  c2x1 = random (0,400);
  c2x2 = random (0,400);
  c2y1 = random (0,400);
  c2y2 = random (0,400);
  noFill();
 bezier((mouseX+100), (mouseY-100), c2x1, c2y2, c2x2, c2y2, (mouseX-100), (mouseY+100)); 
}


