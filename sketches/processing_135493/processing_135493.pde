
void setup(){
  size(500, 500);
}
void draw(){
int x =50;
  background(35, 206, 202);
noStroke();
fill(255, 99, 26, mouseY-50);
ellipse(x, 200, 50, 50);
fill(255, 99, 26, mouseY-80);
ellipse(x+40, 200, 50, 50);
fill(255, 99, 26, mouseY-110);
ellipse(x+80, 200, 50, 50);
fill(255, 99, 26, mouseY-140);
ellipse(x+120, 200, 50, 50);
fill(255, 99, 26, mouseY-170);
ellipse(x+160, 200, 50, 50);
fill(255, 99, 26, mouseY-200);
ellipse(x+200, 200, 50, 50);
fill(255, 99, 26, mouseY-170);
ellipse(x+240, 200, 50, 50);
fill(255, 99, 26, mouseY-140);
ellipse(x+280, 200, 50, 50);
fill(255, 99, 26, mouseY-110);
ellipse(x+320, 200, 50, 50);
fill(255, 99, 26, mouseY-80);
ellipse(x+360, 200, 50, 50);
fill(255, 99, 26, mouseY-50);
ellipse(x+400, 200, 50, 50);

noStroke();
fill(6, 126, 188, mouseX - 50);
rect(x, 100, 40, 200);

fill(6, 126, 188, mouseX - 170);
rect(210, 100, 40, 200);
fill(6, 126, 188, mouseX - 170);
rect(250, 100, 40, 200);

fill(6, 126, 188, mouseX - 50);
rect(410, 100, 40, 200);

}


