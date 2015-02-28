

void setup(){
  size(400,400);
  background(255);
  smooth();
}

void draw(){
noFill();
stroke(mouseY,20,mouseX);
strokeWeight(30);


bezier(300,400,280,280,200,200,140,180);
bezier(140,180, 80,160, 80,260, 140,240); 
bezier(140,240, 260,180, 300,80, 300,0); 

 
  
}




