
PImage landscape;

//float speed = 2.5; //random
//int diameter = 100; //random
float bodyx; //random
float bodyy; //random




void setup() { 
size(1024, 768); 
landscape= loadImage("bikini_bottom.jpg");


smooth(); 
strokeWeight(2); 

//  bodyx = width/2; //random
  

}


void draw() {
  background (landscape);
  
  myDrawRobot(100);
myDrawRobot(280);
myDrawRobot(460);
myDrawRobot(640);

}


void myDrawRobot(int bodyx){



bodyx += random(-5, 5);
 bodyy += random(-10, 10);
 bodyy=constrain(bodyy, 300, 400);
 


//body top
fill(62, 243, 88);
rect(bodyx, bodyy, 150, 140);

//shorts
strokeWeight(2);
fill(97, 25, 45);
rect(bodyx, bodyy+140, 150, 60);

//belt
line(bodyx, bodyy+140, bodyx+150, bodyy+140);
line(bodyx, bodyy+160, bodyx+150, bodyy+160);

//legs
fill(97, 25, 45);
rect(bodyx+25, bodyy+200, 40, 25);
rect(bodyx+85, bodyy+200, 40, 25);
fill(255);
rect(bodyx+35, bodyy+225, 15, 25);
rect(bodyx+100, bodyy+225, 15, 25);

//shoes
fill(0);
rect(bodyx+35, bodyy+250, 15, 20);
ellipse(bodyx+33, bodyy+263, 30, 15);
rect(bodyx+100, bodyy+250, 15, 20);
ellipse(bodyx+117, bodyy+263, 30, 15);


//mouth
fill(184, 12, 60);
arc(bodyx+75, bodyy, 100, 70, radians(0), radians(180)); 

//teeth
fill(255);
rect(bodyx+35, bodyy, 30, 50);
rect(bodyx+85, bodyy, 30, 50);

//sponge blobs
fill( 243, 62, 241);
ellipse( bodyx+25, bodyy+75, 10, 30);
ellipse( bodyx+50, bodyy+90, 10, 13);
ellipse (bodyx+35, bodyy+105, 15, 12);

//Left eye

line(bodyx, bodyy-100, bodyx+25, bodyy); //eyes stick
fill(255); //eyeball white
ellipse(bodyx, bodyy-100, 100, 100);
fill(8, 30, 247); //blue pupil
ellipse(bodyx+15, bodyy-105, 40, 40);
 if (mousePressed == true) { 
  fill(100, mouseY, mouseX); 
  } 
ellipse(bodyx+15, bodyy-105, 40, 40);
fill(0); //Eye black
ellipse (bodyx+11, bodyy-107, 10, 10);

//right eye


line(bodyx+150, bodyy-150, bodyx+125, bodyy); //eye stick
fill(255);
ellipse (bodyx+150, bodyy-150, 40, 40); //eyeball white
fill(8, 30, 247); 
ellipse(bodyx+155, bodyy-155, 20, 20); //blue pupil
if (mousePressed == true) { 
  fill(250, mouseX, mouseY); 
  } 
ellipse(bodyx+155, bodyy-155, 20, 20);
fill (0);
ellipse(bodyx+157, bodyy-158, 8, 8); //eye black



}





