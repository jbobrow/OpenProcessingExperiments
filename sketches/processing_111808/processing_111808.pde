
float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 

color col = color(206, 146, 250,10);

void setup() {
  size(600, 600);
  background(255, 255, 255);

}

void draw() {

  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(0); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  ellipse(x, 0, x, 30);
  line(0,0,x,y);
  

  angle = angle +0.1;
  r = r - diff;

  if ( r == 0 || r == 100) { 
    diff =  diff * -1;
  }
}
