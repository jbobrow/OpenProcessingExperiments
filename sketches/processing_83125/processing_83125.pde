
void setup () {;

//smooth();
size(200,200);
background(#83C2FF);

}

void draw () {
  
background(#83C2FF);  
stroke(#000000);
  
fill(#FFB700);
bezier(mouseX-80,mouseY+50,mouseX-90,mouseY-110,mouseX+60,mouseY-110,mouseX+50,mouseY+50);  


line(mouseX-80,mouseY+50,mouseX +50,mouseY+50);

fill(#FFAE8E);
bezier(mouseX-50,mouseY-20,mouseX-60,mouseY+60,mouseX+30,mouseY+60,mouseX+20,mouseY-20);

beginShape();
vertex(mouseX-50,mouseY-20);
bezierVertex(mouseX-30,mouseY-15,mouseX-10,mouseY-20,mouseX,mouseY-40);
bezierVertex(mouseX,mouseY-30,mouseX+15,mouseY-20,mouseX+20,mouseY-20);
endShape();

fill(#FFFFFF);
triangle(mouseX-40,mouseY,mouseX-30,mouseY-10,mouseX-20,mouseY);
triangle(mouseX-10,mouseY,mouseX,mouseY-10,mouseX+10,mouseY);

fill(#09AF02);
triangle(mouseX-35,mouseY,mouseX-30,mouseY-5,mouseX-25,mouseY);
triangle(mouseX-5,mouseY,mouseX,mouseY-5,mouseX+5,mouseY);

fill(#FFFFFF);
rect(mouseX-30,mouseY+20, 30, 10);

line(mouseX-20,mouseY+20,mouseX - 20,mouseY+30);
line(mouseX -10,mouseY+20,mouseX-10,mouseY+30);

fill(#FF0009);
triangle(mouseX-40,mouseY-40,mouseX-40,mouseY-50,mouseX-30,mouseY-50);
triangle(mouseX,mouseY-50,mouseX+10,mouseY-50,mouseX+10,mouseY-40);



}


