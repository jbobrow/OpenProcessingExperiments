
void draw() {
background(random(255));
size(152,254);
strokeWeight(5);
stroke(255,0,0);
line(width/3,0,width/3,254);
line(mouseX,mouseY,mouseX,mouseY);
stroke(255,0,255);
line(0,(width/3)*2,152,(width/3)*2);
stroke(255,0,0);
line(0,(width/3)*3,152,(width/3)*3);
stroke(255,0,0);
line((width/3)*2,0,(width/3)*2,254);
}
