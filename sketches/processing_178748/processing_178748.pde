
float locationX=100;
 
float locationY=100;
 
float vX=5;
 
float vY=3;

void setup() {

size(500,500)


}
void draw() {
 
background(0);

rect(mouseX,mouseY,0)


 
if(locationX > width){
 
vX=-vX;
 
}
 
if(locationX<0){
 vX=-vX;
 
}
 
if(locationY<0 || locationY>height){
    vY=-vY;
}
locationX=locationX+vX;
 
locationY=locationY+vY;
 
 
fill(255,0,255);
 
ellipse(locationX,locationY,50,50);
 
}
