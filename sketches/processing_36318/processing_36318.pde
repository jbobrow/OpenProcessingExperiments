
int numellipse = 0;
float x = 100;
float y = 100;
 
float[] ellipseXps = new float[1];
float[] ellipseYps = new float[1];

void setup() {
  size(700, 400);
  background(255);
  smooth();
}
 
void draw() {
  //fill(255,3);
  //rect(0, 0, 700, 400);
  noFill();
  strokeWeight(.8);
  int i = 0;
  while (i < numellipse) {
    ellipseMode(1);
    ellipse(ellipseXps[i], ellipseYps[i], 350, 300);
    ellipseXps[i]=ellipseXps[i]+1;
    i=i+100;
       
  } 
 
}
 
void mousePressed() {
  
  if (mousePressed && ( mouseButton == LEFT)){
  numellipse = numellipse + 1;
  
 
 
  ellipseXps = expand(ellipseXps, numellipse);
  ellipseYps = expand(ellipseYps, numellipse);
 
  ellipseXps[0] = mouseX;
  ellipseYps[0] = mouseY;
}
  else if (mousePressed && (mouseButton == RIGHT)) {
  setup();
    
  }
}

