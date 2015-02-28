
void setup() {
  size(200,200);
  stroke(0);
  noLoop();
}
void draw(){
  background(0);
  for(int x=0; x<200;x=x+15)
  for(int y=0; y<200;y=y+15)
 { fill(x,y,100);
 
  beginShape (TRIANGLES);
vertex (12+x, 14+y);
vertex (14+x, 4+y);
vertex (16+x, 14+y);
vertex (18+x, 4+y);
vertex (20+x, 14+y);
vertex (22+x, 4+y);
endShape (CLOSE);
}
}
