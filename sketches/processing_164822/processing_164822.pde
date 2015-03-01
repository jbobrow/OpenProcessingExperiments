
void setup(){
  size(600, 600);
  background(255, 255, 255);

}

void draw(){
  if (mousePressed){
  noStroke();
  fill(random(150), 0, random(150), 50);
  smooth(100);
  quad(mouseX, mouseY, 450, 450, 400, 500, 500, 500);
  fill(255, 255, 255);
  triangle(400, 390, 290, 510, 510, 510);
  fill(0, 0, 0);
  triangle(400, 400, 300, 500, 500, 500);
 textSize(32);
 fill(250, 250, 250);
text("PinkFloyd", 325, 500); 





  }
  
}
