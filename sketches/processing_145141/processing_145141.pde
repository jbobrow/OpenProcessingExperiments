
float x;
float y;
float vx=3 ;
float vy=3 ;

void setup() {
size(500, 500);
x= width/2;
y= height/2;
}

void draw() {
background(23, 114, 255); 
cararalph();
ulls();
boca();
orelles();
nas();
coll();
cabells();
pencil();
}
//pencil
void pencil(){
fill(252,212,5);
strokeWeight(2);
rect(mouseX -5 ,mouseY -25,10,50);
line(mouseX ,mouseY-25,mouseX,mouseY+25);
fill(0);
triangle(mouseX -5, mouseY -25, mouseX +5,mouseY -25,mouseX , mouseY-40);
}
//CARA RALPH
void cararalph(){
stroke(1);
strokeWeight(2);
fill(244, 245, 2);

ellipse(x, y, 175, 150);
}

//ULLS
void ulls(){
strokeWeight(2);
fill(255, 255, 255);
ellipse(x -40, y -25, 40, 40);
fill(x +150, y -200, x -255);
ellipse(x -40,y -25, x/30, x/30);
fill(255, 255, 255);
ellipse(x +25, y -25, 40, 40);
fill(x +150, y -200, x -255);
ellipse(x +25, y -25, x/30, x/30);
}

//BOCA
void boca(){
noFill();
arc(x -10, y +30, 110, 20, 0, PI);
arc(x +25, y +45, 50, 50, 5.5, 5.9 );
}

//ORELLES
void orelles(){
fill(244, 245, 2);
bezier(x +70,y -10,x +105,y -30,x +105,y +30,x +70,y +20);
line(x +70,y -10,x +67,y -5);
arc(x +85,y +15,25,25,3.6,4.5);
arc(x +70,y +15,25,25,5,5.8);
}

//NAS
void nas(){
noFill();
arc(x -20,y +5, 25, 25, 1.3, 5.5 );
}

//COLL
void coll(){
noStroke();
fill(23, 114, 255);
rect(x -200,y +41,146,146);
stroke(3);
fill(244, 245, 2);
bezier(x -87,y +10,x -120,y +30,x -80,y +40,x -60,y +40);
bezier(x -60,y +35,x -59,y +45,x -57,y +50,x -50,y +50);
line(x -50,y +50,x -55,y +59);
noStroke();
}

//CABELLS
void cabells() {
stroke(3);
noFill();
arc(x +20,y +71, 300, 300, 3.8, 4.2);
arc(x +40,y +30, 250, 250, 3.5, 4);
arc(x +70,y +44, 300, 300, 3.8, 4);
arc(x +120,y, 300, 300, 3.4, 3.65);
line(x -5,y -75,x -15,y -40);
line(x ,y -75,x +4,y -40);
arc(x +15,y,100,150,5.2,6);
line(x +10,y -75,x +20,y -47);
arc(x -10,y -15,100,150,5.4,5.9);
arc(x -75,y -20,300,150,5.7,6.2);
arc(x +8,y +30,200,200,5.2,5.8);

 if (mousePressed) {
    x = mouseX;
    y = mouseY; 
 }

x = x+vx;
  y = y+vy;
  if (x+175/2 > width||x-175/2 <0) {
    vx=-vx;
  }
  if (y+150/2 > height||y-150/2 <0) {
    vy=-vy;
  }  
    
//TEXTOS
fill(0);
textSize(32);
text("MY NAME IS", 150, 250);
textSize(50);
text("RALPH", 170,350);


 println(x);
}
 



