
void setup() {
  size(400,400);
  

  
  background(255);
  
}

void draw() {
  
 if(mousePressed){
 fill(255);
strokeWeight(3);
  ellipse(0, height/2, mouseX, mouseX);
  
 }else{
   background(0);
  fill(255);
  strokeWeight(3);
  rect(0,0, mouseX, mouseX);
 //  rect(mouseX,mouseY, 50,50);
//background(255);

 }
}

