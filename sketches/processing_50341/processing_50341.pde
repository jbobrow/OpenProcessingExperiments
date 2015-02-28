
int posicionX;


void setup(){
size(1200,450);
smooth();
noStroke();
posicionX=100;

}

void draw(){
background(119,196,224);
fill (30,77,111);
noStroke();
rect(0,150,1200,450);

noFill();
stroke(0);
fill (84,84,84);
rect(posicionX+140,40,20,100);
fill (78,34,9);
rect(posicionX+130,110,90,50);
strokeWeight(5);
fill (174,115,0);
quad(posicionX+50,200,posicionX+200,200,posicionX+250,130,posicionX,130);
fill (238,226,203);
triangle(posicionX+20,65,posicionX+100,110,posicionX+100,35);
fill (116,76,0);
rect(posicionX+100,30,10,100);
//ellipse(1200-posicionX,150,100,100);
posicionX=posicionX+1; //posicionX y se suma 1 


posicionX=posicionX+1;

}

