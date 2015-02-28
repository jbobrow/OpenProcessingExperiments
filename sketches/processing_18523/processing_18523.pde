
void setup(){
size(400,250);
}
void draw(){
background(mouseY,212,255);

fill(254,255,3);
ellipse(160,mouseY+80,40,40);

fill(120);
beginShape();
vertex(20,250);
vertex(40,200);
vertex(50,160);
vertex(70,100);
vertex(80,90);
vertex(90,100);
vertex(120,120);
vertex(154,190);
vertex(200,250);

endShape();



fill(200,mouseY);
beginShape();
vertex(50,160);
vertex(70,100);
vertex(80,90);
vertex(90,100);
vertex(120,120);
endShape();

fill(70,57,12);
beginShape();
vertex(400,120);
vertex(330,100);
vertex(300,90);
vertex(310,70);
vertex(305,68);
vertex(290,90);
vertex(260,90);
vertex(262,98);
vertex(290,100);
vertex(400,130);
endShape();

fill(120);
beginShape();
vertex(0,250);
vertex(100,220);
vertex(120,223);
vertex(160,230);
vertex(200,240);
vertex(300,220);
vertex(360,240);
vertex(400,230);
vertex(400,250);
endShape();

fill(255,0,0);
ellipse(280+mouseY,80,20,10);
ellipse(270+mouseY,75,10,7);

quad(280+mouseY,80,294+mouseY,65,300+mouseY,63,286+mouseY,86);


fill(254,255,3);
triangle(265+mouseY,72,265+mouseY,78,260+mouseY,75);




}


