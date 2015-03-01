
int ellipseX = 100;
int ellipseY = 100;
float litur = 0;
float litur2 = 0;

void setup(){
size(400,400);
}


void draw(){

background(litur);

litur = random(155, 255);

fill(litur2);

litur2 = random(0, 100);

ellipse(ellipseX,ellipseY, 20, 20);



if(ellipseX == 100 && ellipseY > 100){
  ellipseY = ellipseY-2;
}
if(ellipseX == 200 && ellipseY < 200){
  ellipseY = ellipseY+2;
}
if(ellipseY == 100 && ellipseX < 200){
  ellipseX = ellipseX+2;
}
if(ellipseY == 200 && ellipseX > 100){
  ellipseX = ellipseX-2;
}
}
