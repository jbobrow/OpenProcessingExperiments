
//magdalena Urzon processing 2011
//Lesson One Project




void setup(){
  size(400,400);
  background(10,250,216);
  noStroke();
}


void draw(){
 stroke(247,250,259);
 line(pmouseX,pmouseY,mouseX,mouseY + 10);
 
 stroke(0);
 fill(240,173,227);
 ellipse(100,70,60,60);
  
  stroke(0);
  fill(126,121,125);
  ellipse(200,300,60,60);
  
  stroke(0);
  fill(252);
  ellipse(240,150,120,120);
}


