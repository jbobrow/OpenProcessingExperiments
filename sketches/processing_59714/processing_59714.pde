
void setup(){
    size(400, 400);
    background(0);
  
    rectMode(CENTER);
}

void draw(){
  fill(0);
  fill(255);
  ellipse(width/2, height/2, mouseX, mouseY);
 if(mousePressed){
  stroke(255);
  strokeWeight(2);
   fill(0);
   rect(width/2, height/2, mouseX, mouseY);
   stroke(0);
   strokeWeight(1);
   
 //  rect(mouseX, mouseY, 20, 20);
   //rect(mouseX - 40, mouseY + 40, 20, 20);
   //rect(mouseX + 40, mouseY + 40, 20, 20);
 }
 
 }


