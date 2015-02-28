
float x, y; 
float angle = 0;  
float r = 100; 
float diff = 1;  

void setup() { 
  size(600, 600); 
  background(#F7CFCF); 
}

void draw(){
  x= r*cos(angle);
  y= r*sin(angle);
  
  stroke(random(255),20);
  
  translate(300,300);
  fill(#A1A9F2,20);
  ellipse(x,y,100,100);
  
  translate(150,150);
  fill(#AFFFB2,20);
  ellipse(x*2,y*2,150,150);
  
  translate(100,100);
  fill(#E8AFFF,20);
  ellipse(x*12,y*12,100,100);
  
  translate(150,150);
  fill(#FDFFAF,50);
  ellipse(x*10,y*10,150,150);

  translate(150,150);
  fill(#C73BFF,20);
  ellipse(x*6,y*6,100,100);
  
  angle = angle +0.1;
  r=r-diff;
  
  if ( r == 0 || r == 200) {  
    diff =  diff * -1; 
  } 
}
