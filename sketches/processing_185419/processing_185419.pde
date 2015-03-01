
float px= 1;
void setup(){
  size(600,600);
 background(200,150,150);
}
void draw() {
  px= px+ 1;
  ellipse(px, 300, px, px);
  fill (30,180,100);
  
  if (mousePressed){
   ellipse(0, 300, px, px);}
   fill(10,100,100);
}
