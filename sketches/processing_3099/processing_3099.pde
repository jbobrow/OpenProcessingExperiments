
 
 
 
 float margen, sp;
void setup(){
  margen=20;
  sp=40;
  size(1000, 1000);
  smooth();
background(0);
}
void draw(){
  background(0);
 for(float y= margen; y <= height-margen; y += 20*sp){
 for(float x= margen; x <= width-margen; x += sp){
 float d;
   d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
 stroke(42, 143, 188, 100);
 fill(0);
 strokeWeight(5);
stroke(27, 170, 193, 100);
 stroke(252,110, 0, 100);
   triangle(x, y , d, d, d, d);
   fill(183, 22, 44, 10);
rect(x, y , d, d);
fill(255, 3, 7, 10);
 triangle(x/d, y*d*d , d, d, d, d);
fill(0, 0, 0, 10);
ellipse(x, y, d, d);
}
 }}
void mousePressed(){
  println("vertex("+mouseX+", "+mouseY+");");
}
void keyPressed(){
  saveFrame("manuelToledo_2009.jpg");
  println("fotograma grabado");
}
 
 
 
 

