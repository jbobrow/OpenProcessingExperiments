

float x,y;
float angle = 4;
float r = 450;
float diff = 1;

void setup(){
  size(600,600);
  background(#311364);
}
void draw(){
x = r*cos(angle);
y = r*sin(angle);


stroke(#B892FA);
angle = angle +0.8;
r = r -1;

if (r==0 || r==400){
  diff = diff*-1;
}
fill(#CFFA47,90);
translate(width/2, height/2);
rotate(r);


ellipse(0, 0, x,y);
println(x);
if (r==0 || r==400)


fill(#C8B7E5,90);
translate(width/2, height/2);
rotate(r);
ellipse(0, 0, x,y);
println(x);
if (r==0 || r==100){
  diff = diff*-1;
}
}



void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}



