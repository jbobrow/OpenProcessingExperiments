
void setup() {
  size(500, 500);
  background(255);
}
void draw() {
  fill(255,70,13);
  int ellipse1 = round( map(mouseX,10,height,height, 0) );
 rect(ellipse1,250,10,10);
 int ellipse2 = round( map(mouseX,10,height,height, 0) );
  rect(ellipse2,150,45,45);
 int ellipse3 = round( map(mouseX,10,height,height, 0) );
  rect(ellipse3,50,45,45);
 int ellipse4 = round( map(mouseX,10,height,height, 0) );
  rect(ellipse4,300,45,45);
 int ellipse5 = round( map(mouseX,10,height,height, 0) );
  rect(ellipse5,400,45,45);
  translate(mouseX, mouseY);
   fill(231, 31, 122);
  
  beginShape();
    rect(10, 50);
    rect(14, 20);
    rect(47, 15);
    rect(23, 7);
    rect(29, 40);
    rect(0, 25);
    rect(30, 40);
    rect(33, 7);
    rect(-47, -15);
    rect(-14, -20);
    endShape(CLOSE);
    rect(56, 46, 55, 55);
    rect(0, -78, 55, 55);
    rect(-55, 46, -55, -55);
    }
    


