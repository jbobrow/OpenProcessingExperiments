
void setup(){
  size(600,600);
  background(0);
}

int x=2;

void draw() {
  background(28,163,250);
  fill(225,227,157);
  rectMode(CORNER);
  rect(-10,height*2/3,width+20,height*1/3);
fill(150,75,0);
stroke(5);
quad(width*2/3+width/15,height*2/3,width*2/3,height*2/3,mouseX+100,mouseY,mouseX+120,mouseY);
fill(0,150,0);
strokeWeight(0);
triangle(mouseX,mouseY,mouseX+100,mouseY,mouseX+110,mouseY-15);
triangle(mouseX+25,mouseY-75,mouseX+110,mouseY-40,mouseX+110,mouseY-15);
triangle(mouseX+75,mouseY-125,mouseX+140,mouseY-40,mouseX+110,mouseY-40);
triangle(mouseX+125,mouseY-135,mouseX+140,mouseY-40,mouseX+110,mouseY-40);
triangle(mouseX+175,mouseY-125,mouseX+140,mouseY-40,mouseX+160,mouseY-20);
triangle(mouseX+275,mouseY,mouseX+140,mouseY,mouseX+160,mouseY-20);
triangle(mouseX+140,mouseY-40,mouseX+140,mouseY,mouseX+160,mouseY-20);
quad(mouseX+100,mouseY,mouseX+140,mouseY,mouseX+140,mouseY-40,mouseX+110,mouseY-40);
fill(80,40,5);
ellipse(mouseX+100,mouseY,15,15);
ellipse(mouseX+130,mouseY,20,20);
ellipse(mouseX+120,mouseY-20,18,18);
fill(255,250,0);
ellipse(0,0,200,200);





}



