
float a, b, c, d, e;

void setup() {
size (300, 300);
smooth();
a=0;
b=width/2;
c=height/2;
d=width;
e=height;
}

void draw() {
background(0);
stroke(255);
line(width/2, 0, width/2, height);
line(0, height/2, width, height/2);

if(overRect(0,0, width/2, height/2)) {
  fill(0, 0, 255);
}

else if(overRect(width/2,0, width, height/2)) {
  fill(255, 0, 0);
}

else if(overRect(0,height/2, width/2, height)) {
  fill(255, 255, 0);
}
//if(mouseX > width/2) {
//  fill(255, 0, 0);
//}
else if (overRect(width/2,height/2, width, height)){
  fill(0, 255, 0);
}
ellipse(mouseX, mouseY, 20, 20);
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

