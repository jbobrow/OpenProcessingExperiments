
float inicio1=0.0;
float fin1=PI*2;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;

void setup (){
  size (500, 400);
  fill(255,255,0);
  strokeWeight (3);
  smooth ();
  frameRate(7);

}

void draw (){
 background (0);
// ellipse (mouseX, mouseY, 40, 40);

 arc (mouseX, mouseY, 100, 100, inicio1, fin1);
 temp=inicio1;
 inicio1=inicio2;
 inicio2=temp;
 temp=fin1;
 fin1=fin2;
 fin2=temp;
 
}

