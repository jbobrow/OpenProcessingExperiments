
void setup() {
size(500,500);
smooth();
frameRate(30);
}
void draw() {
background(209);
rectMode(CENTER);
ellipseMode(CENTER);

//BODY mousex=85, mouseY=135
fill(255);
ellipse(mouseX,mouseY,100,100);
fill(209);
noStroke();

//COVERUP
rect(mouseX-35,mouseY-85,150,100);
stroke(0);
fill(255);

//EYES
ellipse(mouseX-35,mouseY-65,60,60);
ellipse(mouseX+20,mouseY-60,50,50);

//EYEBOWS
fill(mouseX,0,mouseY);
ellipse(mouseX-22,mouseY-50,20,20);
ellipse(mouseX+35,mouseY-50,15,15);

//EYELASHES LEFT
line (mouseX-35,mouseY-95,pmouseX-50,pmouseY-105);
line(mouseX-50,mouseY-90,pmouseX-70,pmouseY-110);
line(mouseX-60,mouseY-77,pmouseX-75,pmouseY-90);

//EYELASHES RIGHT
line(mouseX+40,mouseY-74,pmouseX+55,pmouseY-90);
line(mouseX+35,mouseY-80,pmouseX+40,pmouseY-100);
line(mouseX+45,mouseY-65,pmouseX+65,pmouseY-70);

//WING
fill(87);
triangle(mouseX-10,mouseY-35,mouseX+50,mouseY-35,pmouseX+50,pmouseY+60);

//BARK
fill(0);
triangle(mouseX-35,mouseY-35,mouseX+15,mouseY-35,mouseX-10,mouseY-10);

//LEGS
triangle(mouseX-22,mouseY+45,mouseX-12,mouseY+60,mouseX-32,mouseY+60);
triangle(mouseX+20,mouseY+45,mouseX+30,mouseY+60,mouseX+10,mouseY+60);
}

void keyPressed(){
 println("How you are doing?");
}
  

                
                                
