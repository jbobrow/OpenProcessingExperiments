
float margen, sp;
void setup(){
  margen=50;
  sp=7;
  size(550, 550);
  smooth();
  strokeWeight(3);
  fill(#FFE91C);
background(#FFE91C);
}
void draw(){
  background(mouseY, 70);
 for(float y= margen/2; y <= height-margen*4; y += 3*sp){
 for(float x= margen/3; x <= width-margen*4; x += sp*3){
 float d;
 
  
   d= sqrt((mouseX-x)-(mouseX-x)*(mouseY-y)+(mouseY-y)); 
rect(x, y , 800/d, 800/d);
ellipse(x, y, d/5, d/5);
triangle(x, y, d*d, d*5/3, d*d, d*4/d);
fill(mouseX, mouseY, 0, 255);
}
 }}
void keyPressed(){
  saveFrame("rompimiento.jpg");
  println("fotograma grabado");
}


