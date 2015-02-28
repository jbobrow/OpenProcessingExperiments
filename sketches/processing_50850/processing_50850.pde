
/*---------------------Starting SINGLE DECLARATION*/ void setup() {
//---------Generals-------------//
size(500,150);
background(250,250,250,10);
rectMode (CENTER);
ellipseMode (CENTER);
smooth();

}/*Closing Void-Setup*/

/*---------------------Starting MOUSE PRESSED DECLARATION*/ void mousePressed() {
//---------Generals------------//
smooth();

//---------Content------------//
/*Floor*/ fill(100); stroke(90); ellipse (mouseX,mouseY,100,20);
/*Hole*/ fill(0,0,0); stroke(0); ellipse (mouseX,mouseY+5,80,10);


}/*Closing 'mouse pressed'*/


/*--------------------Starting LOOP DECLARATION*/ void draw() {
//---------Generals------------//
smooth();

//---------Content------------//
if(mousePressed) {
  
}

/*Body*/ fill(205); stroke(200); rect (250,70,20,20);

/*Head*/ fill(230); stroke(220); ellipse (250,40,40,40);
/*Screw*/ fill(190); stroke(180); ellipse (250,30,20,20);

/*Leg-A*/ stroke(220); line (220,50,210,mouseY);
/*Leg-B*/ stroke(220); line (220,50,240,80);
/*Leg-C*/ stroke(220); line (220,90,230,60);
/*Leg-D*/ stroke(220); line (230,60,240,80);
/*Leg-E*/ stroke(220); line (260,80,270,60);
/*Leg-F*/ stroke(220); line (260,80,280,50);
/*Leg-G*/ stroke(220); line (270,60,280,90);
/*Leg-H*/ stroke(220); line (280,50,290,mouseY);

/*Knee1*/ fill(100); stroke(100); ellipse (220,50,4,4);
/*Knee2*/ fill(100); stroke(100); ellipse (230,60,3,3);
/*Knee3*/ fill(100); stroke(100); ellipse (270,60,3,3);
/*Knee4*/ fill(100); stroke(100); ellipse (280,50,4,4);


/*Head-Screw*/ fill(75); stroke(75); rect (250,30,10,5);

/*Beak*/ fill(100); stroke(100); triangle (230,50,270,50,250,70);

}/*Closing 'void draw'*/


/*---------------------Starting Key PRESSED DECLARATION*/ void keyPressed() {
//---------Generals------------//
smooth();
background(255);

//---------Content------------//

}/*Closing 'mouse pressed'*/

