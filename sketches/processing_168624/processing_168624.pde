
void setup(){
size(800,600);
background(0,150,150);
}
void draw(){
  println(mouseX+":"+pmouseY);
fill(232,150,68);
ellipse(400,300,350,450);
fill(255,255,255);

ellipse(335,225,75,50);
ellipse(473,225,75,50);
fill(0,80,220);
ellipse(346,216,20,20);
ellipse(486,216,20,20);

fill(255,255,255);

ellipse(408,391,85,50);



beginShape();

vertex (310,186);
vertex (232,240);
vertex(227, 194);
vertex(238, 111);
vertex(270, 56);
vertex(346, 74);
vertex (382,9);
vertex (438,54);
vertex (467,31);
vertex (496,52);
vertex (553,96);
vertex (577,66);
vertex (551,184);

fill(255,255,0);

endShape(CLOSE);
line(417,305,386,272);
line(417,305,405,320);
line(405,320,388,317);


}



