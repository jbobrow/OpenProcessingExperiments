
//INFO
void setup() {
  size (400, 400);
background (150);

  
//forms

ellipseMode (CENTER);

strokeWeight (1);
ellipse(193,225, 210,210);

triangle(190,90, 297, 305, 93,305);

strokeWeight (3);

ellipse(193,225, 200,200);
triangle (190,100, 290,300, 100, 300);



//EYE
fill (0);
ellipse (193,235, 110,80);

fill(255);
ellipse (193,235, 110, 70);

fill (0,0,0);
ellipse (193,225, 70,50);

fill(255);
ellipse (213,215, 15,15);

ellipse (135,235, 5,5);



//eyelids
noFill();
bezier(233, 195,  210  , 175,  155, 185,  155, 195);
bezier(135,255, 145,275, 175,290, 185,285);



//diffusion beams

line(193,300, 193, 370);
line(173,300, 173, 350);
line(213,300, 213,350);

line(243,205, 305,175);
line(233,185, 285,160);
line(253,225, 325,190);

line(143,205, 85,175);
line(150,185, 105,160);
line(133,225, 65,190);
}

//pupil

void draw() {
  frameRate(400);
  //fill(random(255),random(255),random(255));
  ellipse(193,215, 25,25);
}
