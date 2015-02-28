
void setup(){
  size (400,400);
  //noStroke();
  background(255);
  smooth();
  line(50,200,150,200);
  line(50,200,50,300);
  frameRate(30);
}
void draw(){
  //background(255);
  for (int x=200; x<400; x+=1) {
    float a=random(400);
    float r=random(255);
    float g=random(255);
    float b=random(255);
    if(a>200) {
      fill(255,g,b);
    ellipse(x,200-(a*.3),20,20);}
    else {
      fill(r,g,255);
    ellipse(x,200+a,20,20); }
}
}
  
