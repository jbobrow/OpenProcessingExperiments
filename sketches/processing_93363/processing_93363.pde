
int col = 255;
int ky = 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(col, col, col);
  
  //body
  strokeWeight(1);
  fill(mouseX, ky, mouseY);
  ellipse(mouseX, mouseY, 200, 180);

  //eyes
  fill( col, col, col);
  ellipse(mouseX-25, mouseY-11, 47, 60);
  ellipse(mouseX+25, mouseY-11, 47, 60);

  fill(ky,ky,ky);
  ellipse(mouseX-24, mouseY+4, 30, 30);
  ellipse(mouseX+24, mouseY+4, 30, 30);

  //beak
  fill(#F08D29);
  noStroke();
  triangle(mouseX-25, mouseY+20, mouseX-2, mouseY+40, mouseX+20, mouseY+20);

  //line thingies.
  stroke(ky,ky,ky);
  strokeWeight(3);
  line(mouseX-101, mouseY+0, mouseX-150, mouseY+0);
  line(mouseX-101, mouseY+0, mouseX-150, mouseY+20);
  line(mouseX-101, mouseY+0, mouseX-150, mouseY-20);
  line(mouseX+100, mouseY+0, mouseX+150, mouseY+0);
  line(mouseX+100, mouseY+0, mouseX+150, mouseY-20);
  line(mouseX+100, mouseY+0, mouseX+150, mouseY+20);

}

void mousePressed(){
  if(mousePressed);
  fill(col,col,col);
  ellipse(mouseX-24, mouseY+4, 30, 30);
  ellipse(mouseX+24, mouseY+4, 30, 30);
  
  fill(ky,ky,ky);
  ellipse(mouseX-24, mouseY+4, 30, 10);
  ellipse(mouseX+24, mouseY+4, 30, 10);
}



