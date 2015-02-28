
float count;
void setup(){
  size(1000, 1000);
  background(170, 12, 12);
  count = 0;
  frameRate(15);
}

void draw(){
  float angle = map(mouseY,0, width, 0,PI+HALF_PI);// found on pg. 209
  translate(500, 400);
  rotate(angle);
  triangle( 220, 220, 500, 300, 355, 200);
  count++;
  strokeWeight(8);
    stroke(77, 240, 211, 30);
    fill(36, 68, 178, 30);
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX, mouseY, 100, 50);
  
  if(count%6 == 0){
    fill(333, 33, 102, 77);
    rect( mouseY, mouseY, 20, 20);
    noFill();
} else {
  fill(244, 265, 111, 77);
triangle(mouseX, 33, mouseY, 122, mouseX + 12, 355);
noFill();}
if(count%4 == 0);{
ellipse(200, 200, mouseY, mouseY);}
}


