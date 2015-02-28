
float x, y;
float a, b;
float A = 0; 
float r = 260;
float r_2 = 260;
float diff = 1; 

void setup() {
  size(600, 600);
  background(255); 
}

void draw() {

  x = r * cos(A); 
  y = r * sin(A); 
  
  a = r_2 * cos(A);
  b = r-2 * sin(A);
  
  translate(width/2, height/2);
  rotate(r);
 
  noStroke(); 
  strokeWeight(3);
  fill(28,129,255,40);
  ellipse(x, y, x/3, y/3);

  noStroke(); 
  strokeWeight(1);
  line(2+x, 2+y, width/2 + x, height/2);
  fill(197,186,255,40);
  rect(x, y, y/2, y/2);  

  noStroke(); 
  fill(249,111,166, 20);
  ellipse(x, x, x/5, y/5);
  
  noFill();
  stroke(255);
  strokeWeight(1); 
  ellipse(0,0,a*5,b*5);
  
  A = A + 1;
  
  r_2 = r_2 - diff;
  if(r_2 == 0 || r_2 == 400){
    diff = diff * -1;
   }
}
