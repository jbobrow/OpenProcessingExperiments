
/*squeary animals . owl . by bea
  inspired by cross stitch motifs
*/
void setup() {
size(400,450);
smooth();
}

void draw() {
background(mouseY,10,mouseX);
fill(62,28,2);
strokeWeight(2);

//head
beginShape();
vertex(100, 90);
vertex(300, 90);
vertex(350, 130);
vertex(350, 350);
vertex(300, 400);
vertex(100, 400);
vertex(50,350);
vertex(50,130);
endShape(CLOSE);

//ear left
triangle(50,30,50,130,100,90);

//ear right
triangle(350,30,350,130,300,90);

//chin
fill(203,118,6);
rectMode(CENTER);
rect(200,325, 90,150);
fill(255);

//white eye left
beginShape();
vertex(100,90);
vertex(202,197);
vertex(155,250);
vertex(100,250);
vertex(50,200);
vertex(50,130);
endShape(CLOSE);

//black pupil left
fill(0);
ellipse(120,190,40,40);

//white eye right
fill(255);
beginShape();
vertex(245,250);
vertex(295,250);
vertex(350,205);
vertex(350,130);
vertex(300,90);
vertex(199,197);
endShape(CLOSE);

//black pupil right
fill(0);
ellipse(280,190,40,40);

//beak
fill(255,196,0);
strokeWeight(3);
quad(155,250,200,295,245,250,200,195);

}

