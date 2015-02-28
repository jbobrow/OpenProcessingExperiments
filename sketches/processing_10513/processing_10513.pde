
void setup(){
  size(200,200);
  rectMode(CENTER);
  smooth();
  int x=0,y=0;
for ( int a =width; a> 0; a = a-5) {
  rect(width/2,height/2, a, a);
  ellipse(width/2,height/2,a,a);
}
}


