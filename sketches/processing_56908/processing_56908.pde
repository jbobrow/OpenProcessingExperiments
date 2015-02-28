
PGraphics pg;
PGraphics pgAux;
float Rad;
  
void setup(){
  size (800,450);
  pg = createGraphics (width, height, P2D);
  pgAux = createGraphics (width, height, P2D);
  background(0);
}


void draw() {
  pg.beginDraw();
  pg.background(0);
  pg.image(pgAux, 0,0, width, height);
  pg.stroke(255,5);
  pg.fill(random(5)+250*noise(mouseX/100),random(5)+250*noise(mouseY/100),random(5)+250*noise(pmouseX/100),150);
  //if (mouseX!=pmouseX || mouseY!=pmouseY) {
    //pg.triangle(width/2, height/2, mouseX, mouseY, pmouseX, pmouseY);
    //pg.line(width/2, height/2, mouseX, mouseY);
    Rad = random(15)+width*noise(mouseX)/10;
    pg.ellipse(mouseX, mouseY, Rad, Rad);
  //}
  pg.endDraw();
  
  image (pg, 0, 0);
  
  pgAux.beginDraw();
  pgAux.background(0);
  pgAux.image (pg,5, 5, width-10, height-10);
  pgAux.endDraw();


}
