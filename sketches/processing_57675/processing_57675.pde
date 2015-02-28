
void setup(){
  size(900,900);
  smooth();
  background(255);
}

void draw(){

float x = mouseX;
float y = mouseY;
float r = 10;
strokeWeight(0.1);
//draw my name 'g''a'

if(mousePressed){

fill(255,30);
rect(x-r,y-2*r,r,r);
rect(x,y-2*r,r,r);
rect(x+r,y-r,r,r);
rect(x-r,y,r,r);
rect(x,y,r,r);
rect(x+r,y,r,r);
rect(x-2*r,y+r,r,r);
rect(x+r,y+r,r,r);
rect(x-r,y+2*r,r,r);
rect(x,y+2*r,r,r);
rect(x+r,y+2*r,r,r);
fill(206,200,60);  
triangle(x-2*r,y-r,x-r,y-r,x-r,y-2*r);
triangle(x+r,y-2*r,x+r,y-r,x+2*r,y-r);
triangle(x-2*r,y+r,x-r,y+r,x-r,y);
triangle(x-2*r,y+2*r,x-r,y+3*r,x-r,y+2*r);
}else{

fill(255,30);
rect(x-r,y-2*r,r,r);
rect(x,y-2*r,r,r);
rect(x+r,y-2*r,r,r);
rect(x-2*r,y-r,r,r);
rect(x+r,y-r,r,r);
rect(x-2*r,y,r,r);
rect(x+r,y,r,r);
rect(x-r,y+r,r,r);
rect(x,y+r,r,r);
rect(x+r,y+r,r,r);
rect(x+r,y+2*r,r,r);
rect(x-r,y+3*r,r,r);
rect(x,y+3*r,r,r);
fill(0,54,99,20);
triangle(x-2*r,y-r,x-r,y-r,x-r,y-2*r);
triangle(x-2*r,y+r,x-r,y+r,x-r,y+2*r);
triangle(x-2*r,y+3*r,x-r,y+3*r,x-r,y+4*r);
triangle(x+r,y+3*r,x+2*r,y+3*r,x+r,y+4*r);
}
}




