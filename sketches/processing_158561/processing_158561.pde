
void setup() {
  size(500, 500);
  fill (150,150,10);
  stroke(150,150,10);
  background(30,30,5);

}
 
float px=0;
void draw (){ 
px++;  
  ellipse(width/2, height/2,px,30);
ellipse(width/2, height/2,30,px);
ellipse(width/4, height/4,30,px);
ellipse(width/4, height/4,px,30);
ellipse(width/1.35, height/1.35,30,px);
ellipse(width/1.35, height/1.35,px,30);

}

