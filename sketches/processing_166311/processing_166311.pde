
void setup()
{
 size(800,800);
 background(0);
 
}
 
void draw()
{
noStroke();
fill(255,247,0);
triangle(width/2, height*9/10,width/2, height*9/10-80,width/2-200, height*9/10);
noStroke();
fill(0,73,165);
triangle(width*7/10,height*7/10,width*9/10,height*5/10,width*9/10,height*13/20);
 
 
textSize(30);
float a= map(mouseY,0,height,70,255);
 fill(random(0, 1/a),random(0, (a+1/a)/2),random (0,a));
text("Interactive", width*2/5, height*5/8);
text("Peacock", width*2/5, height*11/16);
 
 
 
stroke(14,76,155);
  strokeWeight(1);
  beginShape(TRIANGLE_FAN);
  vertex(width*3/20, height*3/10);
  vertex(0,height/20);
 for(int i = 10; i <=width*5/20; i+=10){
 
   fill(random(0, 1/a),random(0, (a+1/a)/2),random (0,a));
   vertex(i,height/20);
 }
  
 noFill();
  beginShape();
  strokeWeight(20);
stroke(0,73,165);
vertex(width*3/20, height*3/10);
bezierVertex(width/5,0,width*7/10,height/20,width*2/5,height*7/20);
bezierVertex(width/20,height*7/10,width*9/20,height*19/20,width*7/10,height*7/10);
 
 
endShape();
noStroke();
fill(255,247,0);
triangle(width*3/20+60, height*3/10,width*3/20-60, height*3/10,width*3/20, height*3/10+200);
fill(0,73,165);
ellipse(width*3/20, height*3/10,width/5,height/5);
fill(0);
ellipse(width*3/20, height*3/10,width/20,height/20);
 
 
 
stroke(14,76,155);
  strokeWeight(3);
  beginShape(TRIANGLE_FAN);
  vertex(width*7/10,height*7/10);
  vertex(width,0);
 for(int i = 60; i <=height; i+=60){
 
   fill(random(0, 1/a),random(0, (a+1/a)/2),random (0,a));
   vertex(width,i);
 }
stroke(14,76,155);
  strokeWeight(3);
  beginShape(TRIANGLE_FAN);
  vertex(width*7/10,height*7/10);
  vertex(width/2,0);
 for(int i = 400; i <=height; i+=40){
 
   fill(random(0, 1/a),random(0, (a+1/a)/2),random (0,a));
   vertex(i,0);
 }
 
 endShape(CLOSE);
 
noStroke();
fill(131,97,27);
rect(0,height*9/10,width,height/10);
//bezierVertex(,,,,,,,,);
 
}
