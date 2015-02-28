
//Definició de variables


//General
void setup(){
  size(500,500);
  strokeWeight(5);
}
void draw(){
  background(255);
  cos();
  cap();
  colors();
} 
 
//Funcions cos
void cos(){
stroke(0);
ellipse(mouseX,mouseY,110,110);
rect(mouseX-37,mouseY-100,75,180);
stroke(255);
rect(mouseX-37,mouseY-120,75,110);
stroke(0);
line(mouseX,mouseY+80,mouseX,mouseY+40);
ellipse(mouseX-25,mouseY+80,60,40);
ellipse(mouseX+10,mouseY+80,60,40);
}
 
//Cap
void cap(){
stroke(0);
ellipse(mouseX,mouseY-250,150,150);
ellipse(mouseX,mouseY-100,150,150);
rect(mouseX-75,mouseY-250,150,150);
stroke(255);
ellipse(mouseX,mouseY-250,140,140);
ellipse(mouseX,mouseY-250,140,140);
rect(mouseX-70,mouseY-250,130,145);
stroke(0);
rect(mouseX-50,mouseY-250,90,185);
strokeWeight(10);
ellipse(mouseX-50,mouseY-270,10,10);
ellipse(mouseX+30,mouseY-270,10,10);
strokeWeight(2);
line(mouseX-50,mouseY-55,mouseX-20,mouseY-50);
line(mouseX+30,mouseY-50,mouseX+50,mouseY-60);
strokeWeight(5);
}

//puke
void colors(){
stroke(255,0,0);
fill(255,0,0,200);
rect(mouseX-350,mouseY-245,385,25);
noFill();
stroke(255,180,0);
fill(255,180,0,200);
rect(mouseX-350,mouseY-215,385,25);
noFill();
stroke(255,255,0);
fill(255,255,0,200);
rect(mouseX-350,mouseY-185,385,25);
noFill();
 stroke(50,150,0);
fill(50,150,0,200);
rect(mouseX-350,mouseY-155,385,25);
noFill();
stroke(0,0,255);
fill(0,0,255,200);
rect(mouseX-350,mouseY-125,385,25);
noFill();
stroke(120,0,255);
fill(120,0,255,200);
rect(mouseX-350,mouseY-95,385,25);
noFill();
}




