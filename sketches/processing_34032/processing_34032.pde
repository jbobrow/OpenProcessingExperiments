

PImage brick, photo2;
int painter = 15;
PGraphics pg;


void setup(){
size(700,391);
brick = loadImage("brick_wall.jpg");
background(brick);
frameRate(300);
photo2 =loadImage("photo2.jpg");
pg = createGraphics(199, 300, P3D, "photo2.jpg");
}

//void draw() {
//  size(199,300);
//  pg.beginDraw();
//  pg.background(photo2);
//  pg.noStroke();
//  pg.rect(40, 40, mouseX, mouseY);
//  pg.endDraw();
//  image(pg, 0, 0); 
//}

void draw(){
  noSmooth();
  strokeWeight(painter);
  if(key == 'i'){
  size(199,300);
  background(photo2);
    }



}
  
  void mousePressed(){
    int paint = photo2.get(mouseX, mouseY);
    stroke(paint);
    line(pmouseX,pmouseY,mouseX,mouseY);   
  }
  



