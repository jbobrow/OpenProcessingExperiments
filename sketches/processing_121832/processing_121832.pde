
void setup () { 
size(500,500);
}
void draw () {
background(255,255,255);
stroke(0);

ellipseMode(CENTER);
//hoofd
fill(205,0,205);
ellipse(mouseX,mouseY,260,350);
fill(255,0,0);
//rechteroog
ellipse(mouseX+50,mouseY-25,100,100);
//linkeroog
ellipse(mouseX-45,mouseY-25,100,100);
fill(0,0,0);
//rechter pupil
ellipse(mouseX+50,mouseY-25,40,40); 
//linker pupil
ellipse(mouseX-45,mouseY-25,40,40);
//unibrown
rect(mouseX-100,mouseY-75,200,20);
//linker neusgat
ellipse(mouseX-20,mouseY+55,20,20);
//rechter neusgat
ellipse(mouseX+20,mouseY+55,20,20);
//mond
fill(176,23,31);
ellipse(mouseX,mouseY+125,170,50);
fill (0,0,0);
line(mouseX-85,mouseY+125,mouseX+85,mouseY+125);


} 
