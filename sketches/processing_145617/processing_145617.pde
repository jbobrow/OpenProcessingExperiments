
void setup(){
  size(500, 500);
}

void draw(){
  background(200);
  
  //hoofd
  stroke(0);
  fill(0,168,0);
  ellipse(mouseX, mouseY, 100, 100);
  
  //ogen
  stroke(0);
  fill(255);
  ellipse(mouseX+30, mouseY-10, 35, 35);
  ellipse(mouseX-31, mouseY-10, 35, 35);
  
  //mond
  fill(0);
  rect(mouseX-20, mouseY+30, 38, 76);
  
  //tong
  fill(250,0,0);
  ellipse(mouseX-1, mouseY+96, 30, 20);
  
  //tongspleet
  line(mouseX-4, mouseY+96, mouseX+14, mouseY+83);
  
  //tanden
  fill(255);
  rect(mouseX-20, mouseY+30, 38, 10);
  
  //wallen
  stroke(0);
  line(mouseX-41,mouseY+4,mouseX-41,mouseY+19);      
  line(mouseX-37,mouseY+7,mouseX-37,mouseY+22);
  line(mouseX-33,mouseY+8,mouseX-33,mouseY+16);
  
}
