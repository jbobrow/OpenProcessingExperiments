
import processing.pdf.*;

int a=20;
int direccion= 20;


void setup(){
  size(800,800);
  beginRecord (PDF,"lineas.pdf");
  background(0);
}

void draw(){
for(int x =10;x<=width;x=x+20){
  for(int y=5;y<=width;y=y+60){
  fill(234,154,5);
  rect(a,a,200,600,400,300);

    a=a+direccion;


if(a>800|| a<=0){
  direccion=direccion*+5;
}

}
}
endRecord();
}


