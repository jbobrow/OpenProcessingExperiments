
int counter;

void setup(){
size(400,400);
background(255);
smooth();

}

void draw()
{
  stroke(70);
  //lewy górny
fill(170);
triangle(150,200,mouseX,mouseY,175,163);

//środkowy górny
fill(180);
triangle(175,163,mouseX,mouseY,225,163);

//prawy górny
fill(190);
triangle(250,200,mouseX,mouseY,225,163);

//lewy dolny
fill(160);
triangle(150,200,mouseX,mouseY,175,237);

//środkowy dolny
fill(150);
triangle(175,237,mouseX,mouseY,225,237);

//prawy dolny
fill(140);
triangle(250,200,mouseX,pmouseY,225,237);

}
void mousePressed() {
  stroke(255);
 fill(255);
rect(0,0,400,400);

}
