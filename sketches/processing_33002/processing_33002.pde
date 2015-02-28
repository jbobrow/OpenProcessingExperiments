
float a = 0.1;

void setup () {
size (900, 450);

strokeWeight (1);
noFill ();
smooth();
}
void draw (){

background(0);
//translate(width/2,height/2); //CENTRAR


float b = a + 0.1;
for (int i = 0; i < height; i++) {
rotate (b+a);


beginShape ();
stroke(64,161,255,40);
curveVertex(-mouseX*2, -200);
curveVertex(0, 0);
curveVertex(i-1, mouseY);
curveVertex(width, height);
curveVertex(1100, 700);

endShape ();


/*
beginShape ();
stroke(64,161,255,40);
curveVertex(mouseX-100, mouseX-100);
curveVertex(width/2,height/2);
curveVertex(mouseX, mouseY);
curveVertex(width/2,height/2);
curveVertex(mouseX+100, mouseX+100);

endShape ();
*/
}
}

void mousePressed(){
  saveFrame("img ##.bmp");
}
