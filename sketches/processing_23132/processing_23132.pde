
void setup (){
  size (1000,900,P3D);
  background (0);
  
}
void draw (){
  
  for ( int c =0 ; c<=width; c=c+50) {
  for ( int d =0; d<height; d=d+100){  
  
smooth ();
pushMatrix();
fill (d,100,c);
strokeWeight(2);
translate(d,c,d/2);
rotateY(0);
box(50);
popMatrix();

pushMatrix();
fill (d,120,c);
strokeWeight(1.5);
translate(d,c,d/3);
rotateY(0);
box(48);
popMatrix();

pushMatrix();
fill (d,170,c);
strokeWeight(1);
translate(d,c,d/4);
rotateY(0);
box(45);
popMatrix();

pushMatrix();
fill (d,200,c);
strokeWeight(0.5);
translate(d,c,d/5);
rotateY(0);
box(42);
popMatrix();

pushMatrix();
fill (d,d,c);
strokeWeight(2);
translate(d+100,c+00,d-1000);
rotateY(0);
box(40);
popMatrix();}}

}



