
float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 

color col = color(255,0,0);

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(0); 

  translate(width/2, height/2); 
  rotate(r); 


fill(0,0,random(300,0),100); 


  stroke(random(300,100),random(300,100),random(200,100),100); 


  strokeWeight(0.5); 


  rect(x, 300, x, 5); 


  strokeWeight(1); 


  fill(100,300,503,random(100,100)); 

  ellipse(0, 0, x, y);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
