



float x, y;
float angle = 0; 
float r = 35;
float diff = 1; 
float a = 150;



void setup() {
  size(600, 600);
  background(0, 0, 0);
}

void draw() {


  x = r * cos(angle); 
  y = r * sin(angle);

  noFill();
  strokeWeight(0.1); 
  stroke(0, 255, 255); 


  translate(width/2, height/2); 

  rotate(r); 
  ellipse(0, 0, x, y);
  ellipse(x, 0, x, 80);
  line( 0, 0, x, y); 


  stroke(87, 255, 35);
  strokeWeight(0.2);
  rect(x+200, 0, y+200, 20);





  noStroke();
  fill(140, 255, 120, 20);
  strokeWeight(0.5);
  triangle(0, x, y, 0, x/3, y/3); 



noStroke();
  fill(255, 130, 120, 20);
  strokeWeight(0.1);
  ellipse(x/2, 0, x/2, 80);

  angle = angle +a;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}






