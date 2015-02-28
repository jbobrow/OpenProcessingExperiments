
//import processing.pdf.*;


void setup () {
size (1200, 900);
//strokeWeight (1);
noFill ();
//beginRecord(PDF, "midibujo.pdf");
}
void draw (){

background(0);

for (int i = 0; i < 600; i++) {
float b = 0.1;

float a = b + 1.0;
float c = a + 1.0;


beginShape ();
stroke(80, 77,240,50);//azul

curveVertex(i, 600);
curveVertex(600, 400);
curveVertex(i*3, 9);
curveVertex(300, 600);
curveVertex(600, 600);

endShape ();



beginShape ();
stroke(140, 77,240,50);//violeta

curveVertex(300, 200);
curveVertex(700, 10);
curveVertex(i*3, 900);
curveVertex(300, 150);
curveVertex(i, 600);

endShape ();


beginShape ();
stroke(4, 134,85,50);//verde

curveVertex(300, 470);
curveVertex(700, 500);
curveVertex(i*3, 895);
curveVertex(70, 450);
curveVertex(1300, 600);

endShape ();
//endRecord();
}
}
void mousePressed(){
  saveFrame("curvas.JPG");
}

