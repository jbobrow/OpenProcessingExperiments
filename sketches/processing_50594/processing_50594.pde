
float inicio1=0.0;
float fin1 = TWO_PI;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;

void setup (){
  size (400,400);
  smooth ();
  strokeWeight(2);
  noStroke();
  frameRate(4);
  fill(255,255,0);
  ellipseMode(CORNER);


}

void draw(){
  background(35,65,27);
  fill (55,255,55);
  arc (mouseX,mouseY,100,100,inicio1,fin1);
  fill (0,0,0);
 
  
  temp=inicio1;
  inicio1=inicio2;
  inicio2=temp;
  
  temp=fin1;
  fin1=fin2;
  fin2=temp;
  
}

