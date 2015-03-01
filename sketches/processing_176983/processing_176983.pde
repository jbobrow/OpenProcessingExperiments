
int xLocation=100;

int j;
void setup(){
size(640, 640, P3D); 
background(0);
lights();
frameRate(10);
for(j=1; j<1; j+=0.2);{
strokeWeight(j);}

}

void draw(){

noFill();
stroke(xLocation/3,xLocation/5,xLocation/6);
pushMatrix();
//translate(width*0.5, height*0.5, 300);
translate(xLocation,height/2,100);

sphere(xLocation);

noFill();
stroke(10,25,60,20);
sphere(200);

noFill();
stroke(10,85,30,20);
sphere(240);
stroke(150,25,90,40);
sphere(550);

//stroke(65,95,100,30);
//sphere(155);
popMatrix();


if(xLocation<=width*2){
  xLocation+=2;}
else {xLocation=xLocation-(2*width);}


}


