
color highlight = color(255, 104, 100);
void draw() {
if ( 20<mouseX && mouseX<(20+50)
&& 20<mouseX && mouseY<(20+30) ) {
stroke(0);
fill(highlight);
strokeWeight(2);
}else{
  stroke(255, 0, 0);
  fill(255, 14, 104);
  strokeWeight(2);
}
rect(20, 20, 50, 30);
}


