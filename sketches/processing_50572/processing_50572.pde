
int posicionX;
 
 
void setup(){
size(500,500);
smooth();
noStroke();
posicionX=100;
 
}
 
void draw(){
background(159,253,255);
fill (63,155,255);
noStroke();
rect(0,262,500,500);

 
noFill();
stroke(0);
noStroke();
fill (0,33,127);
quad(posicionX+50,280,posicionX+200,280,posicionX+250,200,posicionX,200);
fill (255,0,63);
triangle(posicionX+7,190,posicionX+100,190,posicionX+100,35);
fill (255,0,63);
triangle(posicionX+100,190,posicionX+250,190,posicionX+100,35);
fill (0,0,0);
rect(posicionX+100,30,10,171);
//ellipse(1200-posicionX,150,100,100);
posicionX=posicionX+1; //posicionX y se suma 1
 
 
posicionX=posicionX+1;
 
}


