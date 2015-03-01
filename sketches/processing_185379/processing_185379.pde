
//float mx=mouseX
//float my=mouseY
void setup(){
size(1300,1000);
smooth();
strokeWeight(30);
}
void draw(){
background(0,100,255);
//fill(random(255),random(255),random(255));
//if (mousePressed=true) {
//noStroke();
//ellipse(mouseX,mouseY,random(50),random(50));
//}
//background(0,50,70);
stroke(0,255,0);
fill(0,90,150);
ellipse(mouseX,mouseY,400,200);
ellipse(mouseX,mouseY-100,300,100);
//ellispe(mouseX,mouseY-200,200,50);
fill(255);
textSize(150);
text("12",mouseX-90,mouseY+70);
stroke(255);
strokeWeight(20);
//line(300,600,700,600);
stroke(0,90,150);
//line(625,500,670,350);
stroke(0,255,0);
strokeJoin(ROUND);
fill(0,255,0);
//rect(620,200,160,160);
stroke(0,90,150);
//rect(630,340,140,9);
stroke(255);
fill(255);
//rect(650,230,20,20);
noStroke;
ellipse(mouseX+130,mouseY-150,65,65);
stroke(0,100,255);
fill(60);
ellipse(mouseX+130,mouseY-150,20,20);
stroke(255);
line(mouseX-100,mouseY-100,mouseX-160,mouseY-250);
stroke(0,255,0);
fill(0,255,0);
rect(mouseX-160,mouseY-250,60,60);
if (mousePressed){
stroke(0,90,150);
} else {
stroke(255,0,0);}
if (mousePressed){
fill(0,90,150);
} else {
fill(0,255,0);}
ellipse(mouseX-160,mouseY-230,45,45);
}
