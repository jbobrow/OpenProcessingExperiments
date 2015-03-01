
float x=1;
void setup(){
  size(500,500);
  colorMode(HSB);
}
void draw(){
  background(0);
  translate(250,250);
  rotate(PI);
  for (float t=1; t<250; t++){
    fill(t,240,240);
  rotate(137.5*PI/180);
//  ellipse(t,0,2*sqrt(t),2*sqrt(t));
  if(t-250+x > 0){
  ellipse(t-250+x,0,2*sqrt(abs(t-250+x)),2*sqrt(abs(t-250+x)));
  }
  }
  x+=.1;
  if(mousePressed){
    x=mouseX;
  }
}
