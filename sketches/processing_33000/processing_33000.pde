
//import processing.pdf.*;

void setup () {
size (900, 450);

//beginRecord(PDF, "PDF.pdf");

noFill ();
stroke(0,50);
smooth();
}



void draw (){
 
background(255);

translate(width/2,0);
//for (int i = 0; i < mouseX+mouseY; i++) { //los hace crecer
for (int i = 0; i < mouseY*2; i++) { //los hace crecer

rotate (mouseX); // probar con 11, 22, 111,  114 ,999, 444, 488

rectMode(CENTER);
rect(0,height/2,1000,i);
 

//println(mouseX);
}}
void mousePressed(){
saveFrame("img ##.bmp");
//endRecord();
}               
