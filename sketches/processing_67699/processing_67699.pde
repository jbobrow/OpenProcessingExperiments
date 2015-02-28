
/*Realizado por 
Calderon Castro Mariana
Mendoza Garcia Leo Joaquin Rodrigo*/


int x=400, y=200;
int a=0, b=350;

void setup() {
  size(400, 300);
}
void draw() {
    a=(x-120)/2+120;
    b=(y-80)/2;
   
  smooth();
  background(255);
  stroke(0, 0, 255);
  strokeWeight(5);
  //fill(127,0,0);
  noFill();
  ellipse((x-120)/2, (y-80)/2, 50, 50);
  stroke(0, 0, 0);
  ellipse((x-120)/2+60, (y-80)/2, 50, 50);
  stroke(255, 0, 0);
  ellipse(a, b, 50, 50);
  stroke(255, 255, 0);
  ellipse((x-120)/2+30, (y-80)/2+30, 50, 50);
  stroke(0, 0, 255);
  point((x-120)/2+25, (y-80)/2+6);
  stroke(0, 255, 0);
  ellipse((x-120)/2+90, (y-80)/2+30, 50, 50);
}
