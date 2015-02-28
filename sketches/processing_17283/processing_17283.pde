
void setup(){
  size(200,200);
  int x = width/2;
  int y = height/2;
  int thesize = 150;
}
  
void drawDuck(int x, int y, int thesize, color c){
  int offset = thesize/6;
    
  float r = random(255);
  float g = random(255);
  float b = random(255);
    
 //draw ducks legs
  stroke(0,0,0);
  fill(0,0,0);
  line(x+offset,y+(4*offset),x,y);
  line(x-offset,y+(4*offset),x,y);
    
 // draw ducks hair
  stroke(255,0,0);
  fill(255,0,0);
  line(x,y,x-(2*offset),y-(3.3*offset));
  line(x,y,x-(offset),y-(3.7*offset));
  line(x,y,x,y-(3.8*offset));
  line(x,y,x+(offset),y-(3.7*offset));
  line(x,y,x+(2*offset),y-(3.3*offset));
    
 //duck body
  ellipseMode(CENTER);
  stroke(255,150,0);
  fill(c);
  ellipse(x,y,thesize,thesize);
    
 //duck left eye
  stroke(0,0,255);
  fill(r,g,b);
  ellipse(x-offset,y-offset,offset,offset);
  ellipse(x-offset,y-offset,offset/1.5,offset/1.5);
  ellipse(x-offset,y-offset,offset/4,offset/4);
    
 //ducks right eye
  stroke(255,0,0);
  fill(r,g,b);
  ellipse(x+offset,y-offset,offset,offset);
  ellipse(x+offset,y-offset,offset/1.5,offset/1.5);
  ellipse(x+offset,y-offset,offset/4,offset/4);
    
 //draw ducks feet
  noStroke();
  fill(r,g,b);
  ellipse(x+offset,y+(offset*4),offset/2.5,offset/2.5);
  ellipse(x-offset,y+(offset*4),offset/2.5,offset/2.5);

 // ducks wings
  noStroke();
  fill(255,100,0);
  triangle(x-(2*offset),y,mouseX-(4*offset),mouseY+(2*offset),x-(3*offset),y);
  triangle(x+(2*offset),y,mouseX+(4*offset),mouseY+(2*offset),x+(3*offset),y);
  
 //draw ducks beak
 //draw top
  stroke(255,100,0);
  fill(255,100,0);
  triangle(x-(2*offset),y+offset,x,y-(offset/50),x+(2*offset),y+offset);

 //draw bottom
  stroke(255,100,0);
  fill(255,100,0);
  triangle(x-(2*offset),y+offset,x,y+(2*offset),x+(2*offset),y+offset);
    
 //draw tongue
  stroke(255,0,0);
  fill(255,0,0);
  triangle(x-(2*offset),y+offset,x,y+(1.5*offset),x+(2*offset),y+offset);
}
  
void draw(){
  background(255);
  drawDuck(100,100,150,color(255,150,0));
  }

