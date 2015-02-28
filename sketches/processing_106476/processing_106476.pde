
float y;
float v;
float plus;
float minus;



void setup() {
 size(500,500);
 
 y = 1;
 v = 1;

 frameRate(30);
   background(0); 
   strokeWeight(5);
}

void draw() {
  
  plus = random(150);
  minus = random(300);
  
  
 if(v == 1) {
   
   y = y + 20;
   
 } else {
   
   y = y - 20;
 }
  
  noStroke();
  smooth();
  stroke(0);
  ellipse(width/2, height/2, y, y);
  stroke(random(255), random(255), 0);
  fill(random(255), 0, 0);
  ellipse(width/2, height/2, y, y);
  fill(40, random(255), random(255));
  ellipse(width/2, height/2, y, y);

  fill(0);
  ellipse(width/2, height/2, y, y);
 
 
  
   if( y >= (250) ) {
     
   v = 0;
 
 } 
 
 if( y <= 0 ) {
   
   v = 1;
  
 }
 
 
  
}
