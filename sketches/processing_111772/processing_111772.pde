
float x, y;
float angle = 0; 
float r = 100;
float diff = 1;

void setup() {
  size(600, 600);
  background(255);

}
void draw() {
  fill(random(255), random(255), random(255),random(100)); 
 
  x = r * cos(angle+5); 
  y = r* sin(angle);

  strokeWeight(r/10); 
  stroke(0);
  translate(width/2, height/2); 
  rotate(r+10);
  rect(r, r, x, y);
  ellipse(r*2, r*2, x, y);
  
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y);
  angle = angle +3;
  r = r - diff;
  if ( r == 0 || r == 100) { 
    diff =  diff * -1;
  }
 
  
  
  
  
  
  
  
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
