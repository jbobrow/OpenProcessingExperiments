
int  t=1/10;
void setup(){
 size(600,600);
}
void draw(){
  line(mouseX,mouseY,t,t);
  ellipse((random(100)+1),height/(t+1),mouseX,mouseY);
  t = t + 1;
}
