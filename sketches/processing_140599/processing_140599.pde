
float stepx = 3;
float stepy = 1;
float xx=0, xx2=0;


void setup(){
  size(500, 300);
  smooth();
  frameRate(30);
  clearBackground();
  
}

void keyPressed(){
  save("tmp.jpg");
}

void clearBackground() {
  background(0);
}
 
void draw()  { 
  float radius = random(40)+2;
  float x=0,x2=0;
  float y1 = random(height/2);
  float y2 = random(height/2,height);
  float rd,bl,gr,al;
  
  rd = random(255);
  bl = random(255);
  gr = random(255);
  al = random(255); 
  
  fill(rd,bl,gr,al);
  stroke(rd,bl,gr);
  strokeWeight(random(6));
  
  xx+=random(stepx)+10;
  xx2+=random(stepx)+10;  
    
  ellipse(xx,y1,radius,radius);
  ellipse(xx2,y2,radius,radius);
  
  if(xx > width+radius || xx2 > width+radius){xx=0;xx2=0;}
  
}
  

