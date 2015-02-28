
/****************************************
To David:
    Yeah it's soooo easy!
    After 2 glasses of wisky and 1 glass of wine,
    on the flight from Frankfurt to Shanghai,
    I got it ;)
    
    yours,
    S
****************************************/
float x, y, d;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(255);
  ellipseMode(CENTER);
  
  x=width/2;
  y=height/2;
  d=width-10; //leave some white space on the canvas
  drawCircle(x, y, d);
  
}

void drawCircle(float x0, float y0, float d0){
  float x, y, d; //coordination and diameter
  int n; //devident number of the inner circles

  x = x0;
  y = y0;
  d = d0;
  n = 3; //This number can be changed for fun,
          //but note that when n > 8 it's getting slow
  
  stroke(205, 153, 0);
  fill(205, 153, 0, 20);
  ellipse(x, y, d, d);
  
  if(d > 30){ //define the minimun diameter to quit the loop
        
    float angle=PI/2;
    d = d/2;
    
    for(int i=0; i<n; i++){
      x = x0+d/2*cos(angle);
      y = y0-d/2*sin(angle);
      drawCircle(x,y,d);
      angle += 2*PI/n;
    }
 }
}

