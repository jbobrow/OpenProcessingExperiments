
 float margen, sp;
void setup(){
  margen=10;
  sp=40;
  size(900, 900);
  smooth();
 background(255);
}
void draw(){
  background(42, 198, 166, 100);
 for(float y= margen; y <= height-margen; y += sp)
 {
 for(float x= margen; x <= width; x += sp){
 float d;
 d= sqrt((mouseX-x)*100+(mouseY-y)*(mouseY-y)); 
 strokeWeight(3);
 stroke (209,255,252,80);
 fill(32, 167, 157, 100);
ellipse(y, 150 ,200, d);
ellipse(y,400, 300, d);
ellipse(y,600, 200, d);
}
 }}
void mousePressed(){
  println("vertex("+mouseX+", "+mouseY+");");
}
void keyPressed(){
  saveFrame("franciscaconcha.jpg");
  println("fotograma grabado");
}


