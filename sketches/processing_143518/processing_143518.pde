
void setup(){
size(400,400);
}

void draw(){
background(85,255,251);
stroke(0,0,0);
cara();
orelles();
ull1();
ull2();
nas();
boca();
cos();

}

// Cara
void cara(){
fill(240,219,177);
ellipse(mouseX,mouseY,300,200);
}

// Orelles
void orelles(){
ellipse(mouseX-158,mouseY,20,30);
line(mouseX-160,mouseY,mouseX-155,mouseY-5);
line(mouseX-160,mouseY,mouseX-158,mouseY+8);
ellipse(mouseX+158,mouseY,20,30);
line(mouseX+160,mouseY,mouseX+155,mouseY-5);
line(mouseX+160,mouseY,mouseX+158,mouseY+8);
}

// Ull 1
void ull1(){
fill(255,255,255);
ellipse(mouseX-80,mouseY-20,50,50);
fill(240,219,177);
arc(mouseX-80,mouseY-15,50,40,0,PI);
line(mouseX-104,mouseY-15,mouseX-56,mouseY-15);
fill(0,0,0);
ellipse(mouseX-80,mouseY-20,mouseX/40,mouseX/40);
line(mouseX-90,mouseY-60,mouseX-60,mouseY-50);
}

// Ull 2
void ull2(){
fill(255,255,255);
ellipse(mouseX+80,mouseY-20,50,50);
fill(240,219,177);
arc(mouseX+80,mouseY-15,50,40,0,PI);
line(mouseX+56,mouseY-15,mouseX+104,mouseY-15);
fill(0,0,0);
ellipse(mouseX+80,mouseY-20,mouseX/40,mouseX/40);
line(mouseX+60,mouseY-50,mouseX+90,mouseY-60);
}

// Nas
void nas(){
line(mouseX,mouseY+10,mouseX+10,mouseY+20);
line(mouseX+10,mouseY+20,mouseX,mouseY+30);
}

// Boca
void boca(){
line(mouseX-20,mouseY+60,mouseX+30,mouseY+60);
line(mouseX-20,mouseY+60,mouseX-25,mouseY+57);
line(mouseX+30,mouseY+60,mouseX+25,mouseY+50);
line(mouseX+25,mouseY+60,mouseX+15,mouseY+70);
}


// Cos
void cos(){
fill(250,255,18);
rect(mouseX-100,mouseY+100,200,300,30);
fill(255,0,0);
noStroke();
rect(mouseX-60,mouseY+100,30,300);
noStroke();
rect(mouseX+40,mouseY+100,30,300);
noStroke();
rect(mouseX-30,mouseY+150,70,300);
fill(250,255,18);
ellipse(mouseX-45,mouseY+165,15,15);
ellipse(mouseX+55,mouseY+165,15,15);
}








