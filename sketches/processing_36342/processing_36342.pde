
void setup() {	
  size(200, 200);	
  colorMode(RGB);
}

void draw() {
  background(102, 10, 252);
  if (mouseY<height/2) {
    noStroke();
    fill(255, 247, 0);
    ellipse(mouseX, mouseY, 40, 40);
  }
  else {
    background(0);
    fill(mouseY, 0, 0);
    ellipse(mouseX, mouseY, 40, 40);
  }
  if (mouseY<height/2) {
    fill(255, 255, 0);
    triangle(mouseX, mouseY, 0, 0, 10, 20);
    triangle(mouseX, mouseY,200,0,190,20);
  }
  else {
    triangle(mouseX, mouseY, 200, 200, 190, 180);
    triangle(mouseX, mouseY, 0,200,10,180);
  }
}


//int x=1;

//if(x<100){
//  fill(0,0,255);
// ellipse(width/2, height/2, 50, 50);
//}	


