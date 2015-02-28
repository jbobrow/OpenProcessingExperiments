
void setup () {
  size(640, 480);
background(#953030);
smooth();
}
void draw () {
  strokeWeight(8);
for (int i = 10; i < 610; i += 50) {
  for (int j = 10; j < 420; j += 70) {
    stroke(255);
line(i, j, i + 50, j + 70);
stroke(0);
fill(#F013CB);
quad( 30 + i, 15 + j, 49 + i, 15 + j, 30 + i, 39 + j, 49 + i, 39 + j);
fill(mouseX, mouseY, + mouseX - mouseY);
arc(65 + i, 37 + j, 80 , 80 , radians(90), radians(180));
fill(#F0DA13);
ellipse(10 + i, 10 + j, 20, 20);
strokeWeight(2);
fill(#1913F0);

triangle(mouseX+100, mouseY+190, mouseX+75, mouseY+215 , mouseX+175, mouseY+215);   
}
}
}


