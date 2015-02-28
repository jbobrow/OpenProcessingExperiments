
float myX;
float myY;

void setup () {
  size (1000,600);
  myX=400;
  myY=300;
}

void draw () {
  background(255,255,255);
  noStroke();
  myX=mouseX/1.02;
  myY=mouseY;   
   
   //shell//
fill(0,100,0);//color of bottom rectangle
rectMode(CENTER);  // Set rectMode to CENTER
rect(myX-180, myY-72, 190, 10);//bottom rectangle of shell
fill (50,205,50);//color of shell
arc(myX-180, myY-75, 190, 190, -PI, 0);  // arc of shell
 
//spots on shell//
fill(0,100,0);
shapeMode(CENTER);
quad(myX-220, myY-120, myX-205, myY-105, myX-220, myY-90, myX-235, myY-105);//in order from closest x coordinate
quad(myX-200, myY-150, myX-185, myY-135, myX-200, myY-120, myX-215, myY-135);
quad(myX-180, myY-120, myX-165, myY-105, myX-180, myY-90, myX-195, myY-105);
quad(myX-160, myY-150, myX-145, myY-135, myX-160, myY-120, myX-175, myY-135);
quad(myX-140, myY-120, myX-125, myY-105, myX-140, myY-90, myX-155, myY-105);
 
 
 
//head//
fill(0,100,0);
ellipse(myX-66,myY-100,76,76);//head
stroke(0);
arc(myX-48, myY-100, 20, 18, -PI, 0);//eye
fill(255);
 
 
//legs//
noStroke();
fill(0,100,0);
ellipse(myX-240, myY-60, 28, 22);//back foot
ellipse(myX-200, myY-60, 28, 22);//second from last foot
ellipse(myX-160, myY-60, 28, 22);//second foot
ellipse(myX-120, myY-60, 28, 22);//front foot =)
 
//tail//
fill(0,100,0);
triangle(myX-295, myY-77, myX-277, myY-92, myX-277, myY-70);

}


