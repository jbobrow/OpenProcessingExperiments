
float x, y;
float angle = 0; 
float r = 500;
float diff = 5; 

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  fill(0,0,0,5+diff); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);
  
  translate(width/2, height/2); 
  rotate(r);

  stroke(0,0,0,diff);

  strokeWeight(0.1); 
 
  fill(154,6,214,random(10,40));
  ellipse(x, 0, x, 100);
  noFill();
  strokeWeight(2);
  stroke(174,227,5,random(30,50));
  ellipse(50, 50, x, y);
  strokeWeight(0.1); 
  stroke(255,255,255);
  line( 0, 0, x, y); 


  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
