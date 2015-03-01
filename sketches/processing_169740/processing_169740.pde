
float recx = 0;
float recy = 0;
float r = 1;
float x = 10;
float y = 10;

void setup() {

  size(800, 800);
  background(175,10,10);
  rectMode(CENTER);
  noStroke();
  smooth();
}

void draw() {

  fill(0,11);
  rect(width/2,height/2, width, height);
  fill(255);
  translate(width / 2, height / 2);
  rotate(r);
  fill(255);
  
  rect(x, y, 40, 40);
  rotate(r);
  rect(recx,recy,40,40);
  //rect(0,y,40,40);
  
  r = r + .01;
  
  x = x+5;
  y = y+5;
  recx = recx+0.5;
  recy = recy +0.5;
  
  if( recx >= 50 || recx >= 50){
   recx = recx-0.1;
  recy = recy-0.1; 
  }
   if( recy >= 50 || recy >= 50){
   recx = recx-0.5;
  recy = recy-0.5; 
  }
  
  if( x>=400 || x<=-400){ 
  x=0;
  y=0;
  }
   if( y>=400 || y<=-400){ 
  x=0;
  y=0;
  }
  
  if( y>=400 || y<=-400){ 
  x=0;
  y=0;
  }
   
 }

