
float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 

void setup() {
  size(600, 600);
  background(101,37,137);
}

void draw() {

  noFill();
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(209,237,203); 

  translate(width/2, height/2); 
  rotate(r); 
  
  
  stroke(209,237,203);
  ellipse(0, 0, x+100, y+100);
  
  fill(101,37,137,100);
  noStroke();
  rect(0,0,70,70);

  
  fill(209,237,203,50);
  ellipse(0, 0, x/2, y/2);
  //line( 0, 0, x, y); 

  angle = angle +0.5;
  r = r + diff;

  if ( r == 400 || r == 600) { 
    diff =  diff * -1;
  }
}
