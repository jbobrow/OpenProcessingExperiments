


float x = mouseX;
float y = mouseY;
float m = 0;
float n = 0;
float scalex = 0;

void setup() {
  size(900, 600);
  stroke(6);
  smooth();
  fill(0);
}

void draw() {
ellipse(x,y,40*scalex,40*scalex); //head
line(x,y+(20*scalex),x,y+(80*scalex)); //back
line(x-(30*scalex),y+(45*scalex),x,y+(30*scalex)); //arm his right
line(x+(30*scalex),y+(45*scalex),x,y+(30*scalex)); //arm his left
line(x,y+(80*scalex),x+(20*scalex),y+(150*scalex)); //leg his left
line(x,y+(80*scalex),x-(20*scalex),y+(150*scalex)); //leg his right
}

void mousePressed() {
    x = mouseX;
    y = mouseY;
    redraw();
}

void mouseReleased() {
    scalex = (mouseX - x - m)/150;

    noLoop();
}





