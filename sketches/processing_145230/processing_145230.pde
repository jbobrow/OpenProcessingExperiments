
float x, y;
float v = random(2,8);
float vy = random(2,8);


void setup(){
//noCursor();
size(500,500);
x = random(width);
y = random(height);
}

void draw(){
background(0);

cap();
pantalons();
boca();
ulls();

x = x+v;
y = y + vy;
Limits();
}



void pantalons(){
//PANTALONS
pushMatrix();
fill(0,106,250);
stroke(3,0,0);
strokeWeight(1);
ellipse(x,y+100,151,150); 
popMatrix();

//COS
fill(232,250,0);
stroke(3,0,0);
rect(x-76,y-5,151,105); 

//BUTXACA PANTALONS + TIRANTS + BOTONS
pushMatrix();
strokeWeight(1.1);
fill(0,106,250);
stroke(3,0,0);
rect(x-37.5,y+60,75,75); 
fill(x,y,x);
stroke(3,0,0);
rect(x-25,y+75,50,35); 
fill(0,106,250);
stroke(3,0,0);
rect(x-76,y+60,50,10); 
fill(0,106,250);
stroke(3,0,0);
rect(x+25,y+60,50,10); 
fill(3,0,0);
noStroke();
ellipse(x-32.5,y+65,5,5); 
fill(3,0,0);
noStroke();
ellipse(x+32.5,y+65,5,5); 
fill(0,106,250);
noStroke();
rect(x-40,y+110.75,80,30); 
fill(0,106,250);
noStroke();
rect(x-40,y+101,10,10); 
fill(0,106,250);
noStroke();
rect(x+35,y+101,10,10); 
popMatrix();
}
  
  
  
void cap(){  
//CAP 
fill(232,250,0);
noStroke();
ellipse(x,y,150,150);
}



void boca(){
//BOCA
fill(3,0,0);
noStroke();
ellipse(x-2,y+5,90,90); 
fill(232,250,0);
noStroke();
rect(x-50,y-50,100,75);

//ESTIGMA
fill(0);
noStroke();
triangle(x-1.25,y-39,x+5.5,y-50,x-7.5,y-50);

//DENTS
fill(255,255,255);
stroke(3,0,0);
rect(x+3.5,y+25,10,10); 
fill(255,255,255);
stroke(3,0,0);
rect(x-17,y+25,10,10); 
fill(255,255,255);
stroke(3,0,0);
rect(x-7,y+39,10,10); 
}



void ulls(){
//ULLERES + ULLS
fill(3,0,0);
noStroke();
rect(x-75,y-15,150,10); 
fill(3,0,0);
noStroke();
ellipse(x-26.5,y-10,57,57); 
fill(3,0,0);
noStroke();
ellipse(x+23.5,y-10,57,57); 
fill(255,255,255);
noStroke();
ellipse(x-26.5,y-10,43.5,43.5); 
fill(255,255,255);
noStroke();
ellipse(x+23.5,y-10,43.5,43.5); 
fill(111,68,0);
noStroke();
ellipse(x-26.5,y-10,25,25); 
fill(111,68,0);
noStroke();
ellipse(x+23.5,y-10,25,25); 
fill(3,0,0);
noStroke();
ellipse(x-26.5,y-10,13,13); 
fill(3,0,0);
noStroke();
ellipse(x+23.5,y-10,13,13); 
fill(255,255,255);
noStroke();
ellipse(x-29.25,y-12.25,5,5); 
fill(255,255,255);
noStroke();
ellipse(x+20.75,y-12.25,5,5); 
fill(255,255,255,200);
noStroke();
ellipse(x-29.25,y+2.75,10,10); 
fill(255,255,255,200);
noStroke();
ellipse(x+26.5,y+2.75,10,10); 
}

void Limits(){
if (x+150/2 > width || x-150/2 < 0) {
v = -v;
}
if (y+345/2 > height || y-155/2 < 0) {
vy = -vy;
}
}

void mousePressed(){
v = random(-5,5);
vy = random(-5,5);
x = mouseX;
y = mouseY;
}

