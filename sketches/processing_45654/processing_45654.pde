
color c1;

void setup(){
size(640,360);
smooth();
c1 = color(251,49,47);

}
void draw(){
background(100,164,203);


beginShape();
noStroke();
fill(c1);
vertex(11,0);
vertex(21,32);
vertex(161,0);
endShape(CLOSE);

beginShape();
fill(c1);
vertex(21,32);
vertex(82,279);
vertex(0,300);
vertex(0,39);
endShape(CLOSE);

stroke(240,216,218);
strokeWeight(35);
strokeCap(SQUARE);
line(-3,301,642,153);

stroke(0);
strokeWeight(32);
strokeCap(SQUARE);
line(226,175,643,79);

stroke(c1);
strokeWeight(16);
strokeCap(SQUARE);
line(-2,327,641,180);



}


