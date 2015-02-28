
void setup(){
  size(400, 400);
}

void draw(){
if (mousePressed==true){
  background(0);
}
else{
  background(193, 255, 251);
}
}

void mouseDragged(){
  firefly();
}
void mouseMoved(){
  if (mousePressed==false);
  ladybug();
}


void firefly(){
 smooth();
 noStroke();
 fill(216, 216, 216, 35);
 ellipse(mouseX-25, mouseY-15, 50, 30);
 ellipse(mouseX+25, mouseY-15, 50, 30);
 fill(77, 77, 77);
 ellipse(mouseX, mouseY-25, 35, 50);
 fill(0);
 rect(mouseX-17, mouseY-22, 34, 2);
 rect(mouseX-16, mouseY-15, 32, 2);
 rect(mouseX-15, mouseY-44, 27, 2);
 fill(255, 248, 23);
 ellipse(mouseX, mouseY, 30, 30);
 fill(0);
 ellipse(mouseX-7, mouseY-35, 3, 5);
 ellipse(mouseX+7, mouseY-35, 3, 5);
 ellipse(mouseX, mouseY-30, 15, 5);
 
 fill(77, 77, 77);
  ellipse(mouseX, mouseY-31, 15, 4);
 }
 
 void ladybug(){
   smooth();
   noStroke();
   fill(100);
   rect(mouseX-35, mouseY-10,75, 3);
   rect(mouseX-40, mouseY, 80, 3);
   rect(mouseX-35, mouseY+10,75, 3);
   fill(255, 0, 0);
   ellipse(mouseX, mouseY, 50, 50);
  fill(0);
   ellipse(mouseX-7, mouseY-11, 5, 5);
  ellipse(mouseX+7, mouseY+18, 5, 5);
   ellipse(mouseX-7, mouseY+18, 5, 5);
ellipse(mouseX+7, mouseY-11, 5, 5);
ellipse(mouseX-17, mouseY+5, 5, 5);
ellipse(mouseX+17, mouseY+5, 5, 5);
rect(mouseX-1, mouseY-25, 2,50); 
   fill(100);
   ellipse(mouseX, mouseY-25, 40, 20);
   rect(mouseX-10, mouseY-40,3, 15);
   rect(mouseX+7, mouseY-40, 3, 15);
   fill(0);
ellipse(mouseX-7, mouseY-28, 3, 5);
ellipse(mouseX+7, mouseY-28, 3, 5);
ellipse(mouseX, mouseY-22, 15, 5);
fill(100);
ellipse(mouseX, mouseY-24, 15, 5);

 }
 

