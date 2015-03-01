

void setup() {  //setup function called initially, only once
  size(700, 700);
pg = createGraphics(width, height);
}
void draw() {
ellipse(mouseX,mouseY,,10);
 if(mousePressed) {
    stroke(255);
        arc(mouseX, mouseY, random, random, 0, HALF_PI);

}else{ 
  fill(100,200,0);
   arc(mouseX, mouseY, 10, 10, 0, HALF_PI);
noFill();
arc(50, 55, 60, 60, HALF_PI, PI);
arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);

background(0);

  pg.beginDraw();
  pg.stroke(0, 102, 153);
  pg.line(0, 0, mouseX, mouseY);
  pg.endDraw();
  image(pg, 100, 100);
 
  pg.beginDraw();
  pg.stroke(150, 150, 1);
  pg.line(mouseY, mouseX, mouseX, mouseY);
  pg.endDraw();
  image(pg, 100, 100);
 
}}
