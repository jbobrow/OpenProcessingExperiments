
float a = 0.1;

void setup () {
size (1100, 900);

strokeWeight (1);
noFill ();
}
void draw (){

background(0);
float b = a + 0.1;
for (int i = 0; i < 800; i++) {
rotate (b+a);

beginShape ();
stroke(80, 77,240,50);

curveVertex(i, 600);
curveVertex(600, 400);
curveVertex(i*3, 100);
curveVertex(300, 600);
curveVertex(600, 600);

endShape ();

beginShape ();
stroke(140, 77,240,50);

curveVertex(300, 200);
curveVertex(700, 10);
curveVertex(i*3, 900);
curveVertex(300, 150);
curveVertex(i, 600);

endShape ();


beginShape ();
stroke(240, 187,40,50);

curveVertex(300, 200);
curveVertex(700, 810);
curveVertex(i-3, 500);
curveVertex(300, 850);
curveVertex(i, 600);

endShape ();

}
}

void mousePressed(){
  saveFrame("sutil.JPG");
}

