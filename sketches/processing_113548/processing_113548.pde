
//control point 4times mousepressed
//by Xinhan Yen ,archi730@hotmail.com
void setup() {
  size(300, 300);
  background(1);
}
void draw() {
  background(140, 39, 105);
  //prototype of two PT one curve
  strokeWeight(1);
  fill(255);
  ellipse(150, 150, 215, 215);
  //prototype of two PT one curve
  strokeWeight();
  int x=mouseX;
  int y=mouseY;
  line(width/2, 215, x, y);line(width/2, 215, width/2, 290);//6 Uhr
  line(85, height/2, x, y);line(85, height/2, 10, height/2);//9 Uhr
  line(width/2, 85, x, y);line(width/2, 85, width/2, 10);//12 Uhr
  line(215, width/2, x, y);line(215, width/2, 290, height/2);//3 Uhr
  //mid contral
  if (mousePressed) {
    fill(255);
  }
  else {
    fill(1);
  }
  ellipse(mouseX, mouseY, 30, 30);
  if (mousePressed) {
    fill(1);
  }
  else {
    fill(255);
  }  
  strokeWeight(1);
  ellipse(150, 215, 20, 20);
  ellipse(215, 150, 20, 20);
  ellipse(85, 150, 20, 20);
  ellipse(150, 85, 20, 20);
  if (mousePressed) {
    fill(1);
  }
  else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 15, 15);
  if (mousePressed) {
    fill(255);
  }
  else {
    fill(1);
  }
  strokeWeight(1);
  ellipse(150, 290, 20, 20);
  ellipse(290, 150, 20, 20);
  ellipse(10, 150, 20, 20);
  ellipse(150, 10, 20, 20);
}



