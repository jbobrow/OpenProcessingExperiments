
void setup(){
  size(500, 400);  //Mecha o mouse para fazer,
  background(255); //uma arvore colorida  :)
  noStroke();
}
void draw(){
  background(255); 
  fill(0);
  rect(215, 230, 20, mouseY);
  fill(255, 0, 0);
  ellipse(200, 230, mouseX, mouseY);
  fill(0, 255, 0);
  ellipse(250, 230, mouseX, mouseY);
  fill(0, 0, 255);
  ellipse(225, 180, mouseX, mouseY);
}  
