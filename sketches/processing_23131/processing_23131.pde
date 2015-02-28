
void setup (){
  size (1000,900,P3D);
  background (0);
  
}
void draw (){
  
  for ( int c =0 ; c<=width; c=c+50) {
  for ( int d =0; d<height; d=d+50){  
  
smooth ();
pushMatrix();
fill (0,100,c);
strokeWeight(2);
translate(d,c+100,d/2);
rotateY(1+c);
box(50);

popMatrix();}}

}



