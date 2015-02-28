
void setup(){
  
size(300,300);
background(0);
smooth();

}
   
void draw(){
  float x = random(0,50);
  frameRate(5);
//star
  fill(255,255,255,random(100));
  noStroke();
  ellipse(random(300),random(300),x,x);
//bg
  fill(random(0,50),random(0,30),random(0,100),10);
  rect(0,0,300,300);
//mouse 
  fill(mouseX+50,random(80,100),random(20,100),random(100,255));
  stroke(random(255));
  ellipse(mouseX,mouseY,10,10);
  
  stroke(255);
  line(pmouseX,pmouseY,mouseX,mouseY);
 
}


