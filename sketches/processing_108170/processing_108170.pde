
void setup(){
  size(800,800);
  background(224,224,224);
  
}

void draw(){
  fill(0,0,0);
  triangle(0,600,400,600,200,230);
  triangle(400,600,800,600,600,230);
  strokeWeight(.2);
  line(0,400,800,400);
  line(0,330,800,330);
  fill(227,203,18);
  noStroke();
  triangle(215,255,200,230,185,255);
  triangle(585,255,600,230,615,255);

  
}
