

float rojo=0;
float alp =0;



void setup () {
size (400,400);
smooth ();
}

void draw () {
background (255);
rojo = (random (0,mouseX));
alp = (random (0,mouseX/2));

strokeWeight (4);
stroke (rojo,0,0,alp);
fill (250,0,100);

heart (mouseX, mouseY/2, 100,100);


}



void heart  (int x, int y, int w, int h) {
beginShape (POLYGON);
vertex (x+8*w/16, y+4*h/16);
vertex (x+8*w/16, y+3*h/16);
vertex (x+4*w/16, y+3*h/16);
vertex (x+4*w/16, y+4*h/16);
vertex (x+3*h/16, y+4*h/16);
vertex (x+3*w/16, y+5*h/16);
vertex (x+2*w/16, y+5*h/16);
vertex (x+2*w/16, y+9*h/16);
vertex (x+3*w/16, y+9*h/16);
vertex (x+3*w/16, y+10*h/16);
vertex (x+4*w/16, y+10*h/16);
vertex (x+4*w/16, y+11*h/16);
vertex (x+5*w/16, y+11*h/16);
vertex (x+5*w/16, y+12*h/16);
vertex (x+6*w/16, y+12*h/16);
vertex (x+6*w/16, y+13*h/16);
vertex (x+7*w/16, y+13*h/16);
vertex (x+7*w/16, y+14*h/16);
vertex (x+8*w/16, y+14*h/16);
vertex (x+8*w/16, y+15*h/16);
vertex (x+10*w/16, y+15*h/16);
vertex (x+10*w/16, y+14*h/16);
vertex (x+11*w/16, y+14*h/16);
vertex (x+11*w/16, y+13*h/16);
vertex (x+12*w/16, y+13*h/16);
vertex (x+12*w/16, y+12*h/16);
vertex (x+13*w/16, y+12*h/16);
vertex (x+13*w/16, y+11*h/16);
vertex (x+14*w/16, y+11*h/16);
vertex (x+14*w/16, y+10*h/16);
vertex (x+15*w/16, y+10*h/16);
vertex (x+15*w/16, y+9*h/16);
vertex (x+16*w/16, y+9*h/16);
vertex (x+16*w/16, y+5*h/16);
vertex (x+15*w/16, y+5*h/16);
vertex (x+15*w/16, y+4*h/16);
vertex (x+14*w/16, y+4*h/16);
vertex (x+14*w/16, y+3*h/16);
vertex (x+10*w/16, y+3*h/16);
vertex (x+10*w/16, y+4*h/16);
vertex (x+8*w/16, y+4*h/16);
endShape (CLOSE);
}

