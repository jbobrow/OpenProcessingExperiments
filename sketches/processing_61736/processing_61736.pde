
void setup()
{
size(400,400);
background(0);
}
void draw(){
if (mousePressed==true){

for (int i=-5; i<=5;i=i+5){
 BlackCircle(i);
}
for (int i=-2;i<=2;i=i+2){

RainbowCircle(i);
}
}}
void BlackCircle(int x){
   strokeWeight(1);
  stroke(0);

  noFill();
  ellipse(mouseX+x-20, mouseY-20, pmouseX, pmouseY);
}
void RainbowCircle(int x){
  strokeWeight(1);
  smooth();
  noFill();

  stroke(mouseX, mouseY, mouseY-mouseX);
ellipse(mouseX+x, mouseY, pmouseX/2, pmouseY/2);
}

