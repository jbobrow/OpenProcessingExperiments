
// happy coding ~
size(200,200);

background(135,0,55);

fill(255,255,25);
strokeWeight(2);
beginShape();
vertex(60,40);
vertex(50,140);
vertex(70,145);
vertex(100,145);
vertex(80,145);
vertex(80,150);
vertex(90,150);
vertex(98,165);
vertex(130,165);
vertex(130,135);

vertex(150,40);
vertex(130,60);
vertex(120,40);
vertex(110,60);
vertex(100,40);
vertex(90,60);
vertex(80,40);
vertex(70,60);
endShape(CLOSE);

//nose
line(70,115,90,115);
line(70,117,70,125);
line(70,125,85,125);

//eyes
fill(255);
ellipse(65,100,38,36);
ellipse(100,100,38,36);

fill(1);
ellipse(65,100,5,5);
ellipse(100,100,5,5);
