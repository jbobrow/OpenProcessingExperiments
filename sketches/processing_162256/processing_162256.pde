
int x=0;
void setup() {
  size(1000, 800);
}
void draw() {
  monster();
  monsterTeeth();
}
void monster() {
  background(255);
  rectMode(CENTER);
  fill(0);
  rect(mouseX, mouseY, 500, 300);
  fill(255);
  ellipse(mouseX+90, mouseY-50, 50, 50);
  ellipse(mouseX-90, mouseY-50, 50, 50);
}
void monsterTeeth(){
  while(mouseX-250<mouseX+250){
  triangle(mouseX-250,250,mouseX+10,250,mouseX+5,260);
  triangle(mouseX-250,300,mouseX+10,300,mouseX+5,280);
  x+=10;
}
