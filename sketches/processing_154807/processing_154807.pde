
void setup(){
size(250,500);
background(0);
}
void draw(){
beginShape();
vertex(1, 499);
vertex(51, 499);
vertex(51, 474);
vertex(25.5, 474);
vertex(25.5, 449);
vertex(1, 449);
endShape(CLOSE);
fill(237,28,36);

beginShape();
vertex(249,499);
vertex(249,399);
vertex(199,399);
vertex(199,424);
vertex(224,424);
vertex(224,499);
endShape(CLOSE);
fill(76,177,34);

beginShape();
vertex(51,50);
vertex(126,50);
vertex(126,75);
vertex(101,75);
vertex(101,100);
vertex(76,100);
vertex(76,75);
vertex(51,75);
endShape(CLOSE);
fill(0,131,187);
}
