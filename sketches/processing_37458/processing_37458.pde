

void setup() {
  size(200, 575);
  smooth();
}




void draw() {
  background(0);
  int a = 10;
  for (int y = 25; y < 500; y+=a) {

  
    fill(255,0,0,a);
    stroke(255);
    strokeWeight(1);
    a+=5;
    arc (100,(2*y+a)/2,a,a,radians(90),radians(270));
    
      stroke(255);
    strokeWeight(y/40);
    point(100,y);
   
   
  }
  
  strokeWeight(2);
  stroke(255,0,0);
fill(255,0,0,100);
  
  ellipse(100,535,15,15);
}




