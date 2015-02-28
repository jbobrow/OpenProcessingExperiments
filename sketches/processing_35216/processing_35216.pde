
void setup(){
  size(300,300);
  smooth();
}
float x=2;
void draw(){
  background(200);
fill(0,0,255);
triangle(width/3,height/2-2*mouseX,width/3-2*mouseX,height/2+2*mouseX,width/3+2*mouseX,height/2+2*mouseX);

fill(255,0,0);
ellipse(width/2,height/2,mouseX,mouseX);

fill(255,255,0);
ellipse(width/2+100,height/2,60,60);

rectMode(CENTER);
fill(0,255,0);
rect(mouseX/x,height/2,80,80);

stroke(255,122,0);
strokeWeight(2);
line(width*2/3,150+mouseX/2+3*x,width*2/3,150-mouseX/2-3*x);
}



