
float x, y;
float angle = 0; 
float r = 10;
float diff = 1; 

color col = color(255);


void setup() {
  size(600, 600);
  background(0);

  
}

void draw() {

 
  
  
  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.5); 
  stroke(216,255,255,40); 

  translate(width/2, height/2); 
  rotate(r); 
  
  
  fill(1,18,19,-100);
  ellipse(9,100, x, y/8);
  ellipse(19,130, x, y/10);
  
  
  
  
 // fill(0);
  //ellipse(100,0, x, y);
//ellipse(x, 0, x, 50);
  line( 70,120, x, y); 
  
  
  noStroke();
  fill(255,50);
  ellipse(120,120,x, y);
  
  ellipse(40,40,x/4,y/4);
  

  angle = angle +80;
  r = r - diff;

  if ( r == 0 || r == 100) { 
    diff =  diff * -1;
  }
}
