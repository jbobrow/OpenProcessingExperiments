
int desplazo = 200;
size(400, 400);

fill(0, 200, 0);
quad(0,350, 400, 350, 400, 400, 0, 400);

fill(0);
beginShape();
vertex(220, 270);
vertex(250, 230);
vertex(280, 270);
vertex(250, 290);
endShape(CLOSE);

beginShape();
vertex(220, 320);
vertex(250, 290);
vertex(280, 320);
vertex(250, 350);
endShape(CLOSE);

ellipse (100, 100, 100, 100);
fill(255, 255, 0);
