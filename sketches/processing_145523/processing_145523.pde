
void setup() {
  size(256, 256);
  noStroke();
}

void draw(){
  int tinySpacing = width/60;
  int s = width;
  float w = s/5;
  
  if(mousePressed){
    background(0);
    fill(255);
  }
  else{
    background(255);
    fill(0);
 
  }
  
  translate(tinySpacing*2, 0);
  ellipse(s/4, s/2, s/2, s/2);

  translate(tinySpacing, 0);
  rect(s/2, s/4, w, s/2);

  translate(tinySpacing, 0);
  triangle(
  s/2 + w, s/4, 
  s/2 + w*2, s/4, 
  s/2 + w, s/4 + w);

  rect(s/2 + w, s/4 + w + tinySpacing, s/7, s/7);
}
