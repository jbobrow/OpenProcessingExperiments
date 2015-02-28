
void setup(){
size(200,250);
background (0);
smooth();
}

void draw(){
  strokeWeight (4);
  stroke (176,23,31);
if ((mouseX < 100) && (mouseY < 50)){
fill (220,20,60);
ellipse (100,50,50,50);
}
else {
  fill (0);
  ellipse (100,50,50,50);
}
stroke (238,201,0);
if ((mouseX >100) && (mouseY > 100)){
  fill (255,215,0);
  ellipse (100,120,50,50);
}
else {
  fill (0);
  ellipse (100,120,50,50);
}
stroke (0,139,0);
if ((mouseX >120) && (mouseY >120)){
  fill (102,205,0);
  ellipse (100,190,50,50);
}
else {
  fill (0);
  ellipse (100,190,50,50);
}
}
