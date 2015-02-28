
void setup(){
  
  
  
  size(400,400);
   background(255,255,255);
 
 
 }

void draw(){
  
float r;
r = random(10,90);
smooth();
noStroke();

    //background(255,0,255);
fill(255,0,255,50);
rectMode(CENTER);
rect(200,200,400,400);
  
noStroke(); 
colorMode(HSB);
fill(mouseX,255,255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,r,r);

ellipse(100,100,r,r);
ellipse(50,140,r,r);
ellipse(160,190,r,r);
ellipse(40,270,r,r);
ellipse(250,30,r,r);
ellipse(300,300,r,r);

stroke(0);
strokeWeight(5);
line(mouseX,mouseY,200,200);



}


