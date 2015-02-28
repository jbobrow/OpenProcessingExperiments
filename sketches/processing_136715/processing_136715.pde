
//Shape 2 - Vertices
//Exercise #2
/*2. Use different parameters for beginShape() to change the 
 way a series of vertices are drawn. */

float y= 1;
float x =1;
float z = 1;

void setup() {
size (400, 400);
}

void draw () {

  fill (x ,y ,z,0);

z++;
x = x *1.04;
y = y+=2;

strokeWeight(1);
beginShape(QUAD_STRIP);

vertex(95, 200);
//vertex(95, 180);
vertex(175, 100);
//vertex(150, 100);
vertex(70, 180);
//vertex(70, 100);
vertex(50, 100);

vertex(50, 200);
//vertex(50, 300);
vertex(70, 300);
//vertex(70, 200);
vertex(150, 300);
//vertex(175, 300);
vertex(95, 200);
endShape();

beginShape(QUAD_STRIP);

vertex(115, 200); 
vertex(200, 300);//
vertex(225, 300);//

vertex(310, 200);//
vertex(310, 180);//

vertex(225, 100);
vertex(200, 100);

vertex(115, 180);
vertex(115, 200);
endShape();

beginShape(QUAD_STRIP);

vertex(140, 200);
vertex(140, 180);

vertex(200, 125);
vertex(225, 125);
vertex(285, 175);
vertex(285, 200);
vertex(225, 275);
vertex(200, 275);
vertex(140, 200);

endShape();
}


