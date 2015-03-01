
void setup() {
  size(600,600);
  background(200);
}
 
void draw() {
  fill(162,113,119);
  noStroke();
  ellipse (300,300,600,600);
  for(int x = 0; x<250; x=x+5){
   
    line(0,x,x,x);
    for(int y = 100; y<800; y=y+5){
      stroke(0);
      line(500,y,y,y);
  }
}
}
