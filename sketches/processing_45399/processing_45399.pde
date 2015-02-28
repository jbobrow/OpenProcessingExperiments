

 
void setup () {

size (500, 700);
strokeWeight (1);
}

void draw (){ 
background(0);
 float a = 0.1;
 float b = a + 0.1;
for (int i = 0; i < 500; i++) {
rotate (a=b);

beginShape ();
noFill ();
stroke(255, 3,180,50);
 
curveVertex(2*2, 500);
curveVertex(0*0, 0*0);
curveVertex(0*3, 300);
curveVertex(i, 0*i);
curveVertex(3*3, 0*0);
curveVertex(500*i, 0*i);
 
endShape ();
 
 beginShape ();
noFill ();
stroke(255, 3,49,50);
 
curveVertex(i*2, 0*i);
curveVertex(0*3, 0*0);
curveVertex(0*0, 0*i);
curveVertex(i, 0*i);
curveVertex(0*i, 500);
curveVertex(500, 0*i);
curveVertex(500, i);
 
endShape ();
   
}
}

