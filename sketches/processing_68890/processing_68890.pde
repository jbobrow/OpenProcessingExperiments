
size(720,500);

int desplazamiento = 480; 


int xpos = 250;
int ypos = 250;

int bordeIzq = 3;

color c = color (255,0,0);

fill(c);

strokeWeight (bordeIzq);

ellipse(128,152, 50,50);


beginShape();
vertex(35,110);
vertex(89,239);
vertex(77,410);
vertex(133,295);
vertex(191,410);
vertex(178,231);
vertex(222,90);
vertex(128,198);
endShape (CLOSE);

ellipse(371,133,50,50);

beginShape();
vertex(380,175);
vertex(347,164);
vertex(271,281);
vertex(344,255);
vertex(322,431);
vertex(390,325);
vertex(448,415);
vertex(424,250);
vertex(480,273);
vertex(406,161);
endShape(CLOSE);

ellipse(128+desplazamiento,152, 50,50);

beginShape();
vertex(35+desplazamiento,110);
vertex(89+desplazamiento,239);
vertex(77+desplazamiento,410);
vertex(133+desplazamiento,295);
vertex(191+desplazamiento,410);
vertex(178+desplazamiento,231);
vertex(222+desplazamiento,90);
vertex(128+desplazamiento,198);
endShape (CLOSE);
