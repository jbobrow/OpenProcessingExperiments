
color fillColor = color(255,0,100);


void setup(){
  size(800,600);
  smooth(); 
  background(225);

}

void draw(){
  fill(0,255,100);
  ellipse(20,20,20,20);
  
  fill(90,9,232);
  ellipse(20,60,20,20);
  
  fill(fillColor);
  if(mouseX > 40 && mousePressed){
  ellipse(mouseX,mouseY,10,10); 
  }
}

void mouseReleased(){
  if(dist(mouseX,mouseY,20,20) < 10){
     fillColor = color(0,255,100);
  }
  
  if(dist(mouseX,mouseY,20,60) < 10){
   background(225); 
  }
} 


