
void setup(){
  size(500,500);
background(0);
stroke(0, 255, 255);
strokeWeight(1);
smooth();
}
float dis = 500/21;

void draw(){
  background(0);
for(float i=0; i<=21; i++){
line(dis*i, 0, mouseX, mouseY);}
for(float j=0; j<=21; j++){
line(dis*j, 500, mouseX, mouseY);;}
}
