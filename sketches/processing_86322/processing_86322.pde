
void setup()
{
  size(900,900);
  smooth();
rectMode(CENTER);
}

void draw()
{
strokeJoin(MITER);

background(255);
stroke(100,23,131);
noFill();
strokeWeight(15);

translate(width/2, height/2);
for (int i=10;i<360;i+=1){
rotate(radians(30));
rect(90,40,195,195);
noLoop();
}
for (int i=10;i<360;i+=100){
rotate(radians(90));
triangle(110,370,210,200,-30,295);

}
}
