

float margen, sp;
void setup(){
  margen=40;
  sp=15;
  size(500, 500);
  smooth();

}
void draw(){
  background(0);
  fill(mouseX, mouseY, 0, 250);
 for(float y= margen; y <= height-margen; y += sp){
 for(float x= margen; x <= width-margen; x += sp){
 float d;
 
 
   d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
   noStroke();

   ellipse(x, y , 200/d, 250/d);
   smooth();
   ellipse(x, 40, 30, 30);
   ellipse(40, y, 30, 30);
   ellipse(y, y, 30, 30);
   ellipse(y/2, y, 30, 30);
   ellipse(y, y/2, 30, 30); 
   
   ellipse(60/d, 50/d, x, y );
}
 }}

void mousePressed(){
  println("vertex("+mouseX+", "+mouseY+");");
}
void keyPressed(){
  saveFrame();
  println("fotograma grabado");
}

