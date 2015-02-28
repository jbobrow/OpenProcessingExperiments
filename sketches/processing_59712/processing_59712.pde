
void setup(){
    size(400, 400);
    smooth();
    background(160, 29, 101);
  
    rectMode(CENTER);
}

void draw(){
  noStroke();
  fill(53, 188, 133);
  ellipse(width/2, height/2, mouseX, mouseY);
 if(mousePressed){

   fill(29,154,160);
  ellipse(width/2, height/2, mouseX, mouseY);
   stroke(0);
   strokeWeight(1);
   
 //  rect(mouseX, mouseY, 20, 20);
   //rect(mouseX - 40, mouseY + 40, 20, 20);
   //rect(mouseX + 40, mouseY + 40, 20, 20);
 }
 
 }


