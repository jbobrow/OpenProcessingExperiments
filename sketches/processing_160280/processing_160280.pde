
//Assignment 1: Paper Cranes in the Air
//As an artist used to make traditional art, I attempted to make a piece that would resemble origami with paper cranes as most common object in this piece. I am quite pleased with the result of this piece although this is my first time creating something in programming or any code for that matter.


void setup() {
 size(500, 500);
}

void draw() {
background(#01535D);
//first set squares
stroke(#0F0F0F);
stroke(5);
fill(#FAFCFC);
rect(100, 100, 100, 100);
stroke(#0F0F0F);
stroke(5);
fill(#FF0597);
rect(125, 125, 100, 100);
//second set of squares
stroke(#0F0F0F);
fill(#FF0597);
rect(300, 300, 100, 100);
stroke(#0F0F0F);
fill(#FFFFFF);
rect(325, 325, 100, 100);
//triangles part one
stroke(#000203);
fill(#00C5FF);
triangle(50, 95, 78, 40, 30, 20);
stroke(#000203);
fill(#00C5FF);
triangle(60, 95, 78, 40, 30, 20);
stroke(#000203);
fill(#00C5FF);
triangle(70, 95, 78, 40, 30, 20);
stroke(#000203);
fill(#00C5FF);
triangle(80, 95, 78, 40, 30, 20);
stroke(#000203);
fill(#00C5FF);
triangle(90, 95, 78, 40, 30, 20);
stroke(#000203);
fill(#00C5FF);
strokeWeight(1);
quad(250, 331, 186, 120, 169, 163, 130, 176);
stroke(#000203);
strokeWeight(1);
fill(#00C5FF);
quad(450, 331, 186, 120, 169, 163, 130, 176);
stroke(#000203);
strokeWeight(1);
fill(#FFC60A);;
quad(350, 331, 186, 120, 169, 163, 130, 176);
//circles
stroke(#050500);
fill(#F5EB2F);
ellipse(260, 351, 30, 35);
stroke(#050500);
fill(#F5EB2F);
ellipse(227, 356, 30, 35);
stroke(#050500);
fill(#F5EB2F);
ellipse(198, 349, 30, 35);
stroke(#D8D2D7);
line(133, 225, 190, 334);
line(133, 225, 233, 350);
line(133, 225, 259, 350);
line(133, 225, 37, 499);
line(133, 225, 158, 499);
line(133, 225, 104, 499);
stroke(#FF0597);
strokeWeight(1);
line(133, 225, 40, 499);
line(133, 225, 100, 499);
line(133, 225, 165, 499);
stroke(#FAC000);
line(133, 225, 196, 334);
line(133, 225, 235, 340);
line(133, 225, 260, 340);
stroke(#000203);
fill(#FFFFFF);
triangle(357, 175, 235, 125, 240, 100);
fill(#02DAF5);
triangle(457, 175, 235, 125, 240, 100);
fill(#FFFFFF);
triangle(557, 175, 235, 125, 240, 100);
fill(#02DAF5);
triangle(657, 175, 235, 125, 240, 100);


}

