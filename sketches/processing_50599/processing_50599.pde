
int posicionX;

void setup(){
size(500,500);
posicionX=100;

}

void draw(){
  
background(225);
fill (0,100,250);
noStroke();
rect(0,262,500,500);


noFill();
stroke(0);
noStroke();
fill(200,150,5);
quad(posicionX+50,280,posicionX+200,280,posicionX+250,200,posicionX,200);
fill (165,225,225);
triangle(posicionX+7,190,posicionX+100,190,posicionX+100,35);
fill (100,50,63);
rect(posicionX+150,100,30,100);
fill(250,150,0);
rect(posicionX+100,30,10,171);
fill (40,50,63);
rect(posicionX+125,100,10,100);
posicionX=posicionX+1; 
posicionX=posicionX+1;


//posicionX y se suma 1








}

