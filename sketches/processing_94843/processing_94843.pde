
PVector playerpos = new PVector(300,250);
void setup() {
  size(500,500);
  smooth();
}  
void draw() {
  rectMode(CENTER);
  translate(playerpos.x, playerpos.y);
  rotate(atan2(mouseY-playerpos.y, mouseX-playerpos.x));
  background(0,255,255);
  head(0,0,color(255));
  beak(0,0,color(0));
  eyes(0,0,color(0));
  pupils(0,0,color(255));
}

void head (int x, int y, color c) {
  fill(c);
  rect(x+80, y+100, 10, 120); 
  rect(x+90, y+100, 10, 130);
  rect(x+100, y+90, 10, 140);
  rect(x+110, y+90, 10, 140);
  rect(x+120, y+80, 10, 150);
  rect(x+130, y+80, 10, 150);
  rect(x+140, y+70, 10, 160);
  rect(x+150, y+70, 10, 160);  
  rect(x+160, y+80, 10, 150);
  rect(x+170, y+80, 10, 150);
  rect(x+180, y+90, 10, 140);
  rect(x+190, y+90, 10, 140);
  rect(x+200, y+100, 10, 130);
  rect(x+210, y+100, 10, 120);

}
void beak (int x, int y, color c) {
  fill(c);
  rect(x+50, y+140, 50, 10);
  rect(x+30, y+150, 60, 10);
  rect(x+20, y+160, 70, 10);
  rect(x+265, y+160, 70, 10);
  rect(x+255, y+150, 60, 10);
  rect(x+240, y+140, 50, 10);
}  
void eyes (int x, int y, color c){
  fill(c);
  rect(x+100, y+115, 40, 40);
  rect(x+160, y+115, 40, 40);
}
void pupils (int x, int y, color c){
  fill(c);
  rect(x+110,y+125, 15, 15);
  rect(x+170,y+125, 15, 15);
}


