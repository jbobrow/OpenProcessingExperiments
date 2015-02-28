
void setup(){
  size(200,200);
  smooth();
  colorMode(HSB);
}

int col=0;

void draw(){
  background(col,255,255);
  stroke(0);
  fill(175);
  ellipse(50,50,50,50);
  ellipse(150,50,50,50);
  ellipse(50,150,50,50);
  ellipse(150,150,50,50);
}

void mousePressed(){
col+=20;
col%=255;
println(col);
}


