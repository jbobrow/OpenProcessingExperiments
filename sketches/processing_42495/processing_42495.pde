
void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(0);
  
  stroke(255);
  strokeWeight (3);
  
  //mosquito
  //legs
  fill(255);
  line( mouseX, mouseY, mouseX + 30, mouseY + 30);
  line( mouseX, mouseY, mouseX + 30, mouseY - 30);
  
  line( mouseX, mouseY, mouseX, mouseY + 35);
  line( mouseX, mouseY, mouseX, mouseY - 35);
  
  line( mouseX, mouseY, mouseX-35, mouseY + 35);
  line( mouseX, mouseY, mouseX-35, mouseY - 35);
  
    //eyes
  ellipse( mouseX+20, mouseY-5, 10, 10);
  ellipse( mouseX+20, mouseY+5, 10, 10);
  
  //body
  ellipse( mouseX, mouseY, 50, 10);
  fill(255,120);
  ellipse( mouseX-10, mouseY+8, 50, 10);
  ellipse( mouseX-10, mouseY-8, 50, 10);
 
  

  
  //web
  strokeWeight (1);
  for (int y=0; y<height; y=y+80) {
    for (int x=0; x<width; x=x+80) {
  line( x, y, mouseX+20, mouseY+20);
  line( x, y, mouseX - 20, mouseY-20);
  line( x, y, mouseX + 20, mouseY - 20);
 


    }
  }

}


