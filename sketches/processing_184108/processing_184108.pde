
float mx=0;
float my;

void setup (){
size(720,480);
smooth();
strokeWeight(2);
//background(204);
ellipseMode(RADIUS);
}
 
void draw(){
background(204);
stroke(255,0,0);
line(266,257,266,162);
line(276,257,276,162);
line(286,257,286,162);
 
 
stroke(0,0,255);
line(276,155,6,6);  //blue antenne
ellipse(276,155,2,2);
stroke(0,255,0);
line(4,4,306,56);
ellipse(306,56,4,4);
stroke(0,0,255);
line(276,155,342,170);
ellipse(342,170,2,2);
 
 
noStroke();
fill(255,0,0);
ellipse(264,377,33,33);
fill(0);
rect(219,257,90,120);
fill(0,255,180);
rect(219,274,90,6);
 
 //head
fill(0,0,333,100);
ellipse(mouseX,mouseY,45,45);
fill(255);
ellipse(mouseX,mouseY,14,14);
fill(0,0,255,50);  //head fill
ellipse(mouseX,mouseY,10,10);
fill(0);
ellipse(mouseX,mouseY,3,3);
fill(0);
ellipse(mouseX,mouseY,5,5);
ellipse(mouseX,mouseY,4,4);
ellipse(mouseX,mouseY,3,3);
}
