
void setup(){
size(400,400);
background(0);
}

int x = 0;
void draw(){
strokeWeight (x/100);
colorMode(HSB,width);
stroke(mouseX,x,x);
line(width-mouseX,height-mouseY,mouseX,mouseY);
x++;

}

void mouseDragged() {
fill(mouseY,x,x);
ellipse(mouseX,mouseY,25,25);
ellipse(width-mouseX,width-mouseY,25,25);


if (x>800) {
  x =0;
}
}



