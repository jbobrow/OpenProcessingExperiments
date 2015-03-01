
void setup (){
size(400,400);
stroke(95,3,142);
strokeWeight(5);}
void draw () {
background(133,162,216);
fill(189);
beginShape();
vertex(mouseX+10,mouseY-30);
vertex(mouseX+50,mouseY-50);
vertex(mouseX+30,mouseY);
endShape(CLOSE);
fill(108);
ellipse(mouseX,mouseY+80,90,120);
ellipse(mouseX,mouseY,70,70);
stroke(250,18,49);
fill(0);
ellipse(mouseX,mouseY,10,10);
strokeWeight(8);
line(mouseX+30,mouseY+60,mouseX+60,mouseY+50);
line(mouseX+30,mouseY+80,mouseX+60,mouseY+80);
line(mouseX+30,mouseY+100,mouseX+60,mouseY+110);
//stroke(13,209,161);
//fill(13,209,161);
//arc(145,260,70,45,2.36,5.5);
}

