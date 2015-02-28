
void setup (){
  size (500, 500);
}

void draw(){
background(0);
stroke(97, 35, 100, 80);
//top
for (int x = 0; x<width; x ++){
  line(mouseX, mouseY, x, 0);
}
for (int x = 0; x<width;  x ++){
  line(mouseX+100, mouseY, x, 0);
}
for (int x = 0; x<width; x ++){
  line(mouseX+200, mouseY, x, 0);
}
for (int x = 0; x<width; x ++){
  line(mouseX-100, mouseY, x, 0);
}
//bottom
for (int x = 0; x<width; x ++){
  line(mouseX, mouseY-50, x, 500);
}
for (int x = 0; x<width;  x ++){
  line(mouseX+100, mouseY-50, x, 500);
}
for (int x = 0; x<width; x ++){
  line(mouseX+200, mouseY-50, x, 500);
}
for (int x = 0; x<width; x ++){
  line(mouseX-100, mouseY-50, x, 500);
}
}
