
void setup(){
  size(1000,400);
  background(255);
}
void draw(){
   background(255);
  strokeWeight(30);
  stroke(0);
  
  
  strokeWeight(0);
  stroke(11,199,138);
  
  
  noStroke();
  fill(200,100,0,70);
  fill( random(255), 100, 0, 70); 
  
  rect(mouseX, 20, 55, mouseY, 3, 6, 12, 18);
  noStroke();
  fill(0,100,200,80);
 
beginShape(TRIANGLES);
vertex( mouseY+30, 75);
vertex( mouseY+40, mouseX-50);
vertex( mouseY+50, 75);
vertex( mouseY+60, mouseX-50);
vertex( mouseY+70, 75);
vertex( mouseY+80, mouseX-50);
endShape();

   fill(100,100,200,80);
   fill(100,100,200, random(255)); 
    
 ellipseMode(RADIUS); 
 fill(200,100,0,70);
fill(random(255),100,0, 70);  
ellipse(mouseY+90, 25, 50, 50); 

ellipseMode(CENTER);  
fill(200,100,0,70);
fill(46, 207,random(255), random(255));  
ellipse(mouseY+90, mouseY, 50, 50); 
  
  
}


