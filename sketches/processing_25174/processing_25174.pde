
float ear1;
float ear2;
float ear3;
float ear4;


void setup (){

size(500,500);
background(0);
smooth();
frameRate (30);
}

void draw () {

//face
fill(255,200,200);
stroke(255);
ellipseMode (CENTER);
ellipse(mouseX,mouseY,120,120);


//left ear - changes color
ear1 = random (255);
ear2 = random (255);
ear3 = random (255);
ear4 = random (255);
fill(ear1, ear2,ear3,ear4);
stroke(255);
ellipseMode (CENTER);
ellipse(mouseX-50,mouseY-61,39,39);


//right ear - changes color
fill(ear1,ear2,ear3,ear4);
stroke(255);
ellipseMode(CENTER);
ellipse(mouseX+50,mouseY-61,39,39);


//let eye
stroke(255);
line(mouseX-10,mouseY-30, mouseX-10, mouseY-10);


//right eye
stroke(255);
line(mouseX+10,mouseY-30,mouseX+10,mouseY-10);



//mouth
stroke(255);
rect(mouseX-40,mouseY+10,80,20);


}


