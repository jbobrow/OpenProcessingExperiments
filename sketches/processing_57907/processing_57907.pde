
void setup(){
smooth();
size(400, 400);
}

void draw(){
background(255);

//boxes
fill(255, 0, 0, 110);
rect(20, 360, 30, 30);
rect(100, 360, 30, 30);
rect(100, 280, 30, 30);
rect(50, 230, 30, 30);
rect(80, 180, 30, 30);
rect(30, 10, 30, 30);
rect(150, 110, 30, 30);
rect(150, 60, 30, 30);
rect(210, 60, 30, 30);
//rect(200, 200, 30, 30);
if(mousePressed){
rect(mouseX-25, mouseY-25, 50, 50);
}
else {
rect(200, 200, 30, 30);
}

//circles
fill(0, 0, 255, 100);
ellipse(370, 30, 30, 30);
ellipse(300, 80, 30, 30);
ellipse(370, 140, 30, 30);
ellipse(370, 190, 30, 30);
ellipse(300, 260, 30, 30);
ellipse(300, 370, 30, 30);
ellipse(240, 370, 30, 30);
ellipse(265, 310, 30, 30);
//ellipse(215, 215, 30, 30);
if(mousePressed){
ellipse(mouseX, mouseY, 50, 50);
}
else {
ellipse(215, 215, 30, 30);
}

//lines (boxes)
line(35, 415, 35, 375);
line(35, 375, 115, 375);
line(115, 375, 115, 295);
line(115, 295, 65, 245);
line(65, 245, 95, 195);
line(95, 195, 45, 25);
line(45, 25, 165, 125);
line(165, 125, 165, 75);
line(165, 75, 225, 75);
//line(225, 75, 215, 215);
if(mousePressed){
line(225, 75, mouseX, mouseY);
}
else {
line(225, 75, 215, 215);
}

//lines (circles)
line(400, 30, 370, 30);
line(370, 30, 300, 80);
line(300, 80, 370, 140);
line(370, 140, 370, 190);
line(370, 190, 300, 260);
line(300, 260, 300, 370);
line(300, 370, 240, 370);
line(240, 370, 265, 310);
//line(265, 310, 215, 215);
if(mousePressed){
line(265, 310,mouseX, mouseY);
}
else {
line(265, 310, 215, 215);
}

}



