
float t= 0;
void setup(){
  size(600,600);
}
void draw(){
  fill(random(255),random(255),random(255));
  float px = 20*sin(t);
  float py = 20*cos(t);
 ellipse(mouseX+px,mouseY+py,10,10);
fill(random(255));
 ellipse(mouseX+py,mouseY+px,10,10);
t= t+0.5;
}

