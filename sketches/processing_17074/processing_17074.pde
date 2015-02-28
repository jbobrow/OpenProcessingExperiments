
import processing.pdf.*;
float i=0;

void setup(){
size(600,600);
//beginRecord(PDF, "PDF.pdf");
background(200);
smooth();
}

void draw(){


while(i<=20000){
drawX(int(random(-255,255)),int (random(100)), int(random(20)),int(random(-50,width)),int(random(-50,height)),random(10,30));


  i = i+random(0,10);

}
endRecord();
}

void drawX(int tono, int transp, int grosor, int X, int Y, float largo){
stroke(tono,transp);
strokeWeight(grosor);
line(X,Y,X+largo,Y+largo);
line(X+largo,Y,X,Y+largo);
}

