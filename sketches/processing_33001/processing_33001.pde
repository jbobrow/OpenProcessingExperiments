
//import processing.pdf.*;

//float a = 0.3

void setup () {
size (960, 960);
//beginRecord(PDF, "PDF.pdf");
strokeWeight (1);
noFill ();
smooth();
//frameRate(5);
}
void draw (){


  
background(0);

translate(width/2,height/2); //CENTRAR
//float b = a + 0.3;
for (int i = 0; i < width/5; i++) {

rotate (0.9);

stroke(64,161,255,40); //celeste
ellipse(i/10,i/100,mouseX*2,mouseY*2);
rectMode(CENTER);
//rect(i/10,i/100,mouseX*2,mouseY*2);
stroke(255,64,64,40); //rojo
ellipse(i/3,i/100,mouseX,mouseY);

}
//endRecord();
}

void mousePressed(){
saveFrame("img ##.bmp");

}

