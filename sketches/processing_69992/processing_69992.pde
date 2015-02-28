
//zhaochang He zhaochah@andrew.cmu.edu
//float random variables else if
//copyrights 


//variables
float r=100;
float g =150;
float b=200;
float a =200;

float x = 200;
float y = 200;

//setup
void setup(){
  size(400,400);
  smooth();
frameRate(20);

}


void draw(){
  
//ellipse  
 noStroke();
fill(mouseX,mouseY,b,30);
ellipse(x, y, mouseX,mouseY);

//ellipse random color
//r=random(20,50);
g=random(50,100);
b=random(50,150);
//a=a+1;

//ellipse location
if (mouseX > width/2){
x= x+1;

} else {
x= x-1;
}

if (mouseY>height/2) {
y = y+1;
} else{
  y=y-1;
}

//mousePressed
if (mousePressed) {
background(200);
}

//keyPressed
if (keyPressed) {
 rect(mouseX, mouseY, x, y); 
}

}



