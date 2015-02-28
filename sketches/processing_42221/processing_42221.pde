
int ia =2;
int i = 10;
float c= random (225);

void setup(){
  size(400,400);
  smooth();
  background(0);
  colorMode(HSB, 400,400,400);

}


void draw (){
  stroke(0);
  ellipse (200, 200, 10, 10);
  strokeWeight(3);

if ((mousePressed)&& (i<=width || i>=10) ){ 
   fill(i,mouseY,400);
   i= i+ia;
  }
  

if ((mousePressed)&& (i>width || i==10)){ 
   ia = ia *-1;
 }
 
  ellipse (200, 200, i, i);
}

  

 
 

