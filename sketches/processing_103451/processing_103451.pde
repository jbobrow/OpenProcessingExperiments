
void setup(){
  background(0);
size(600, 800);
}
void draw(){
  fill(0);
  ellipse(130, 60, 80, 80);
  fill(0);
ellipse(500, 60, 80, 80);
if(keyPressed== true){
if(key== 'v')
{
  fill(255, 163, 45);
  noStroke();
  ellipse(130, 60, 80, 80);
}
if (key == 'a')
{
fill(255, 89, 124);
noStroke();
ellipse(500, 60, 80, 80);
}
}
}
