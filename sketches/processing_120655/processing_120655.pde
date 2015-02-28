
void setup() {
 size(800, 1200);
  noStroke();
 background(0);
}
void draw(){
  smooth();
  for(int y=0;y<=height;y+=100){
    for(int x=0;x<=width;x+=100){
      fill(random(255),random(255),random(255));
      ellipse(x,y,mouseX*0.5,mouseY/4);
    }}}

