
float margen, sp;
void setup(){
  margen=20;
  sp=40;
  size(500, 500);
  smooth();
background(255);
}
void draw(){
  background(255);
 for(float y= margen; y <= height-margen; y += sp){
 for(float x= margen; x <= width-margen; x += sp){
 float d;
   d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
 stroke(42, 143, 188, 100);
 fill(0);
   triangle(x, y , d, d, d, d);
   stroke(193, 237, 19);
   ellipse(x, y, 400/d, 400/d);   
   rect(x, y , d, d);
}
 }}
void mousePressed(){
  println("vertex("+mouseX+", "+mouseY+");");
}
void keyPressed(){
  saveFrame("AntoniaBiotti.jpg");
  println("fotograma grabado");
}

