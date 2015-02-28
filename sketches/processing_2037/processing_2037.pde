
void setup(){
 size(500,500); 
 background(0);
}



void draw(){
  
  stroke(random(255),random(255),random(255));
  strokeWeight(6);
  line(mouseX,mouseY,mouseX,mouseY);
}
void mousePressed(){
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,random(30),random(30));


//saveFrame("screen.png");  
}



