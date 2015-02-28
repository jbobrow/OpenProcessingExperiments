


void setup() { size(500, 500); fill(0, 102); smooth(); noStroke();
}

void draw() { 
  background(80,80,180);
  ellipse(mouseX, mouseY, 9, 9);


point (240, 60);
point (120, 30);
point (120, 90);
point (360, 30);
point (360, 90);
line (20, 50, 420, 110);
fill(0, 0, 255);
quad (158, 55, 199, 14, 392, 66, 351, 120);

triangle (347, 54, 392, 35, 392, 66);
fill( 180, 140,0,60);
triangle (158, 55, 290, 91, 290, 212);
fill(255, 11, 150,100);

rect (180, 190, 220, 40);
fill(32,67,20,160);
ellipse (278, 500, 260, 250);

fill(255, 0, 0);
strokeWeight(40);
arc(190, 300, 80, 80, radians(-45), radians (225));
strokeWeight(5);
beginShape(); 
vertex(180, 82); 
vertex(207, 36); vertex(214, 63); 
vertex(407, 11); vertex(412, 30); 
vertex(219, 82); vertex(226, 109); 
endShape(CLOSE);


strokeWeight(1); for (int i = 20; i < 400; i += 20) {
line(i, 0, i + i/2, 580); line(i + i/2, 80, i*1.2, 520);
}


}


