
float x, y;
float a, b;
float angle = 0; 
float r = 600;
float R = 600;
float diff = 1; 
float diff2 = 1;



void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  
  color col = color(0,220,random(255));
   
  
  x = r * cos(angle); 
  y = r * sin(angle);
  
  a = R * cos(angle);
  b = R * sin(angle);


  strokeWeight(0.5); 
  stroke(col); 
  noFill();

  translate(width/2, height/2); 
  rotate(r); 


  ellipse(0, 0, 1000, 700);
  ellipse(0, 0, 600, 500);
  ellipse(0, 0, 450, 250);

  //rect(0,0,a,b);
  
  line(0, 0, a, b); 

  angle = angle +0.5;
  r = r - diff;
  R = R + diff2;

  if ( r == 0 || r == 600) { 
    diff =  diff * -1;
  }
  
  if (R == 0 || R == 600) {
    diff2 = diff + 500;
  }
    
  
}
