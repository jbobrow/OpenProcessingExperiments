


float x, y, z;
float angle = 0; 
float r = 500;
float diff = 1; 
//second
float radius = 60.0;


void setup() {
  size(600, 600);
  background(54,52,52);

}

void draw() {

  noFill(); 


//circle
  x = r * cos(angle); 
  y = r * sin(angle);
  
//translate(width/2, height/2); 
  
float sinval = sin(angle);
float cosval = cos(angle);
float x = 180 + (cosval * radius);
float y = 180 + (sinval * radius);
//blue
//fill(120,180,190,5);
//orange
fill(250,190,100,5);
//ellipse(width/2,height/2 , 30, 30); 




  strokeWeight(0.1); 
  stroke(255,255,255,55); 

 translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
 // ellipse(x, 0, x, 50);
  line( 0, 0, x, y); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


