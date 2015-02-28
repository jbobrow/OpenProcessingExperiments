
void setup() {
size(1000,1000);
smooth();
}
void draw() {
background(4723);
strokeWeight( 10) ;
stroke(133);
strokeWeight(10.);
strokeCap(SQUARE);
line(200, 200, 400, 200);//leftcross t
line(200, 190, 400, 200);//left cross t
line(200, 210, 400, 200);//left cross t
line(600, 200, 400, 200);//right cross t
line(800, 810, 385, 800);// bottom stroke L
line(800, 800, 385, 800);// bottom stroke L
line(800, 790, 385, 800);// bottom stroke L
line(450, 400, 400, 800);//vert stroke L
line(450, 400, 410, 800);//vert stroke L
line(450, 400, 390, 800);//vert stroke L
line(450, 400, 420, 800);//vert stroke L
line(400, 200, 400, 600);//vert stroke t
line(400, 200, 390, 600);//vert stroke t
line(400, 200, 410, 600);//vert stroke t
stroke(133);

line(600, 210, 400, 200);
line(600, 190, 400, 200);
beginShape();
vertex(400, 800);
endShape();

println("x = " + mouseX + " y = " + mouseY);


}
