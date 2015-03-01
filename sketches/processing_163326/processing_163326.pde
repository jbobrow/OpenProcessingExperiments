
void setup (){
  size(500, 500);
}

void draw () {
 stroke(255);
 strokeWeight(8);
 fill(162,234,255);
 rect(0,0,500,500);
 if((mouseX>0) && (mouseX<500) && (mouseY>0) && (mouseY>0)) {
   fill(mouseX, mouseX, mouseY,80);
   rect(0,0,499,499);
   noStroke();
   fill(255);
   ellipse(mouseX,mouseY,70,70);
 }
}
