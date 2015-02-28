
import processing.pdf.*;

float frrg = 0;

void setup (){
size(1200,600);
//beginRecord(PDF, "PDF2.pdf");
smooth();


}

void draw (){
noStroke();
background(0);
for(float y=0; y<=height; y=y+150){ //espaciado
for(float x=0; x<=width; x=x+150){

fill(0,random(0,255),random(200,255),100);
ellipse(x,y,frrg,frrg);

frrg = random(300); //tamaños

noLoop();


}}

endRecord();
}
