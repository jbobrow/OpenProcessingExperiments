
void setup(){
  size(450,450);
  smooth();
   
}
 
void draw(){
  stroke(0, random(100));
  float speed = dist(pmouseX,pmouseY, mouseX,mouseY);
  fill(random(0,55), random(0,25), random(0,55),10);
  
  if(mousePressed) {
  noStroke();
  background(0);
  fill(255);
  triangle (mouseX,mouseY, 250, 450,350,250);


  }
  else {
     
  noStroke();
  fill(0);
  background(255);
  stroke(255);
  float f;
  f = random(250);
  stroke(0);
  fill(255,20);
  triangle(250,450,350,f,f,f);
  }
   
}
