
float margen, sp;
void setup(){
  margen=20;
  sp=40;
  size(1000, 1000);
  smooth();
background(mouseX, mouseY);
}
void draw(){
  background(110-mouseX, 100-mouseY, 100-mouseY, 100-mouseX);
 for(float y= margen; y <= height-margen; y += 20*sp){
 for(float x= margen; x <= width-margen; x += sp){
 float d;
   d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)); 
 stroke(mouseX, 143, 188, mouseY);
 fill(mouseY,0,0,mouseX);
 strokeWeight(5);
stroke(27, 170, mouseY, mouseX);
 stroke(252,110, 0, mouseY);
   triangle(mouseX,y , d, d, d, d);
   fill(255, 44, 8, mouseY);
rect(x, y , d, d);
fill(mouseY,mouseX, 7, 100);
 triangle(x/d, y*d*d , d, d, d, d);
fill(mouseY, mouseX, 0, 10);
ellipse(mouseX, y, d, d);
}
 }}
void mousePressed(){
  println("vertex("+mouseX+", "+mouseY+");");
}
void keyPressed(){
  saveFrame("manuelToledo_2009.jpg");
  println("fotograma grabado");
}


