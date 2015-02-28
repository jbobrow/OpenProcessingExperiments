
size(500,500);
background(#7D9EC0);
int x;
x=25;
smooth();
noStroke();
if (x>12) {
  fill(#7171C6);
  ellipse(340,200,90,90);
  fill(#71C671,90);
  ellipse(250,250,200,200);
  strokeWeight(7);
  stroke(#388E8E,90);
  line(0,370,500,75);
  stroke(#71C671,90);
  line(0,400,500,75);
  stroke(#8E8E38,50);
  strokeWeight(20);
  line(250,0,250,500);
}
else {
  line(20,20,90,400);
};

