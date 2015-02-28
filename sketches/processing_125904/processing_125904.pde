
void setup() {
  size(200, 200);
}
void draw() {
  background(255);
  ellipse(mouseX, mouseY-50, 80, 60);
  fill(50);
  ellipse(mouseX-29, mouseY-50, 16, 32);   
  ellipse(mouseX+29, mouseY-50, 16, 32);
  ellipse(mouseX, mouseY-30, 10, 10);
  fill(150,0,50); //Kleur lichaam RGB
  ellipse(mouseX, mouseY, 40, 40); //lichaam //X=100 Y=130
  line(mouseX-30, mouseY+10, mouseX-20, mouseY);   //armen links
  line(mouseX+20, mouseY, mouseX+30, mouseY+10); //armen rechts
  line(mouseX-10, mouseY+15, mouseX-20, mouseY+40);   //benen links
  line(mouseX+10, mouseY+15, mouseX+20, mouseY+40); //benen rechts
  line(mouseX-30, mouseY-70, mouseX-70, mouseY-110); //spriet links
  line(mouseX+30, mouseY-70, mouseX+70, mouseY-110);  //spriet rechts
}

