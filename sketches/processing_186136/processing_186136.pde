
int halfwidth = 250;
int halfheight = 250;
int eye = 20;
void setup() {
  size(500, 500);
  smooth();
}


void draw() { //bear
  background(255, 251, 214);
  stroke(0,0,0);
  fill(100,100,0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  //top right
  //draw a bear face
  if (mouseX > width/2){
    if(mouseY < height/2){
  noStroke();
  fill(179, 111, 30);
  ellipse(halfwidth +119, halfheight -121, 150, 120);
  noStroke();
  fill(71, 43, 40);
  ellipse(halfwidth +85, halfheight -123, 18, 18);
  ellipse(halfwidth +155, halfheight -123, 18, 18);
  noStroke();
  fill(255, 255, 255);
  ellipse(halfwidth +118, halfheight -94, 35, 25);
  
  beginShape();// bear's left ear
  fill(179, 111, 30);
  curveVertex(halfwidth + 54, halfheight - 138);
  curveVertex(halfwidth + 54, halfheight - 138);
  curveVertex(halfwidth + 61, halfheight - 147);
  curveVertex(halfwidth + 69, halfheight - 157);
  curveVertex(halfwidth + 80, halfheight - 166);
  curveVertex(halfwidth + 88, halfheight - 172);
  curveVertex(halfwidth + 80, halfheight - 179);
  curveVertex(halfwidth + 72, halfheight - 183);
  curveVertex(halfwidth + 64, halfheight - 186);
  curveVertex(halfwidth + 51, halfheight - 185);
  curveVertex(halfwidth + 47, halfheight - 183);
  curveVertex(halfwidth + 42, halfheight - 178);
  curveVertex(halfwidth + 39, halfheight - 153);
  curveVertex(halfwidth + 42, halfheight - 146);
  curveVertex(halfwidth + 47, halfheight - 141);
  curveVertex(halfwidth + 50, halfheight - 139);
  curveVertex(halfwidth + 50, halfheight - 139);
  
  endShape();
  
  beginShape();//bear's right ear
  fill(179, 111, 30);
  curveVertex(halfwidth + 156, halfheight - 170);
  curveVertex(halfwidth + 156, halfheight - 170);
  curveVertex(halfwidth + 158, halfheight - 172);
  curveVertex(halfwidth + 161, halfheight - 183);
  curveVertex(halfwidth + 167, halfheight - 188);
  curveVertex(halfwidth + 174, halfheight - 189);
  curveVertex(halfwidth + 179, halfheight - 190);
  curveVertex(halfwidth + 185, halfheight - 190);
  curveVertex(halfwidth + 191, halfheight - 190);
  curveVertex(halfwidth + 196, halfheight - 187);
  curveVertex(halfwidth + 200, halfheight - 184);
  curveVertex(halfwidth + 206, halfheight - 174);
  curveVertex(halfwidth + 208, halfheight - 158);
  curveVertex(halfwidth + 208, halfheight - 158);
  curveVertex(halfwidth + 205, halfheight - 148);
  curveVertex(halfwidth + 205, halfheight - 148);
  curveVertex(halfwidth + 200, halfheight - 142);
  curveVertex(halfwidth + 197, halfheight - 139);
  curveVertex(halfwidth + 195, halfheight - 139);
  curveVertex(halfwidth + 189, halfheight - 136);
  curveVertex(halfwidth + 189, halfheight - 136);
  
  endShape();
  
  
   }
  }
  
  //lower left
  //text
  if (mouseX < width/2){
    if(mouseY > height/2){
  noStroke();
  fill(179, 111, 30);
  textSize(100);
  text("BEAR", 0, halfheight + 150);
  
   }
  }
  
  //top left
  //mouse moving
  if (mouseX < width/2){
    if(mouseY < height/2){
  noStroke();
  fill(179, 111, 30);
  ellipse(mouseX, mouseY, 80, 80);
  fill(255, 251, 214);
  rect(mouseX, mouseY, 50, 50);
  
  println(mouseX + " <-x and y-> " + mouseY);
  
   }
  }
  
  //lower right
  //square
  if (mouseX > width/2){
    if(mouseY > height/2){
 fill(179, 111, 30);
 rect(0, 0, mouseX, mouseY);
   }
  }
  
}
