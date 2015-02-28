
float y=3.0;
float x;
void setup(){
  size(250, 250);
  smooth();
 }
void draw() 
{ 
  background(#317697);
 strokeWeight(10);
 stroke(#4D9AB7, 150);
 line(0, 0, 0, 250);
 line(25, 0, 25, 250);
 line(50, 0, 50, 250);
 line(75, 0, 75, 250);
 line(100, 0, 100, 250);
 line(125, 0, 125, 250);
 line(150, 0, 150, 250);
 line(175, 0, 175, 250);
 line(200, 0, 200, 250);
 line(225, 0, 225, 250);
 line(250, 0, 250, 250);
 
 stroke(#A2D8ED, 150);
 line(0, 0, 250, 0);
 line(0, 25, 250, 25);
 line(0, 50, 250, 50);
 line(0, 75, 250, 75);
 line(0, 100, 250, 100);
 line(0, 125, 250, 125);
 line(0, 150, 250, 150);
 line(0, 175, 250, 175);
 line(0, 200, 250, 200);
 line(0, 225, 250, 225);
 line(0, 250, 250, 250);
 
 noStroke();
 fill(255, 60);
 ellipse(125, 50, 200, 200);
 ellipse(125, 200, 200, 200);
 ellipse(125, 200, 150, 150);
 ellipse(125, 50, 150, 150);
 ellipse(0, 125, 250, 250);
 ellipse(250, 125, 250, 250);
 ellipse(250, 125, 200, 200);
 ellipse(0, 125, 200, 200);

x= x+ 0.5;
translate(x,0);
  noStroke();
  fill(random(255), random(255), 255);
  ellipse(125, y, random(200), random(50)); 
  
  fill(random(255), random(255), 255);
  ellipse(220, y, random(150), random(100));
  
  fill(random(255), random(255), 255);
  ellipse(30, y, random(150), random(100));
  
y += 1.0; 
if (y > 250){ 
y = 0.0; 
}
if(x>250){
  x=0;
}
}

