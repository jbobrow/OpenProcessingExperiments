
void setup(){
  size(300,300);  
}


void draw(){
background(192);
for (int i = 0; i < 330; i = i+30) {
  fill(mouseX, 255-i, mouseY);
  rect(i, 0, mouseX-150,mouseY-150);
  rect(i, 30, mouseX-150,mouseY-150);
  rect(i, 60, mouseX-150,mouseY-150);
  rect(i, 90, mouseX-150,mouseY-150);
  rect(i, 120, mouseX-150,mouseY-150);
  rect(i, 150, mouseX-150,mouseY-150);
  rect(i, 180, mouseX-150,mouseY-150);
  rect(i, 210, mouseX-150,mouseY-150);
  rect(i, 240, mouseX-150,mouseY-150);
  rect(i, 270, mouseX-150,mouseY-150);
  rect(i, 300, mouseX-150,mouseY-150);
}

}



