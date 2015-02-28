
void setup(){
  noCursor();
size(600,400);
}



void draw(){
background(0);

cap();
pantalons();
boca();
ulls();
}



void pantalons(){
//PANTALONS
pushMatrix();
fill(0,106,250);
stroke(3,0,0);
strokeWeight(1);
ellipse(mouseX,mouseY+100,151,150); 
popMatrix();

//COS
fill(232,250,0);
stroke(3,0,0);
rect(mouseX-76,mouseY-5,151,105); 

//BUTXACA PANTALONS + TIRANTS + BOTONS
pushMatrix();
strokeWeight(1.1);
fill(0,106,250);
stroke(3,0,0);
rect(mouseX-37.5,mouseY+60,75,75); 
fill(mouseX,mouseY,mouseX);
stroke(3,0,0);
rect(mouseX-25,mouseY+75,50,35); 
fill(0,106,250);
stroke(3,0,0);
rect(mouseX-76,mouseY+60,50,10); 
fill(0,106,250);
stroke(3,0,0);
rect(mouseX+25,mouseY+60,50,10); 
fill(3,0,0);
noStroke();
ellipse(mouseX-32.5,mouseY+65,5,5); 
fill(3,0,0);
noStroke();
ellipse(mouseX+32.5,mouseY+65,5,5); 
fill(0,106,250);
noStroke();
rect(mouseX-40,mouseY+110.75,80,30); 
fill(0,106,250);
noStroke();
rect(mouseX-40,mouseY+101,10,10); 
fill(0,106,250);
noStroke();
rect(mouseX+35,mouseY+101,10,10); 
popMatrix();
}
  
  
  
void cap(){  
//CAP 
fill(232,250,0);
noStroke();
ellipse(mouseX,mouseY,150,150);
}



void boca(){
//BOCA
fill(3,0,0);
noStroke();
ellipse(mouseX-2,mouseY+5,90,90); 
fill(232,250,0);
noStroke();
rect(mouseX-50,mouseY-50,100,75);

//ESTIGMA
fill(0);
noStroke();
triangle(mouseX-1.25,mouseY-39,mouseX+5.5,mouseY-50,mouseX-7.5,mouseY-50);

//DENTS
fill(255,255,255);
stroke(3,0,0);
rect(mouseX+3.5,mouseY+25,10,10); 
fill(255,255,255);
stroke(3,0,0);
rect(mouseX-17,mouseY+25,10,10); 
fill(255,255,255);
stroke(3,0,0);
rect(mouseX-7,mouseY+39,10,10); 
}



void ulls(){
//ULLERES + ULLS
fill(3,0,0);
noStroke();
rect(mouseX-75,mouseY-15,150,10); 
fill(3,0,0);
noStroke();
ellipse(mouseX-26.5,mouseY-10,57,57); 
fill(3,0,0);
noStroke();
ellipse(mouseX+23.5,mouseY-10,57,57); 
fill(255,255,255);
noStroke();
ellipse(mouseX-26.5,mouseY-10,43.5,43.5); 
fill(255,255,255);
noStroke();
ellipse(mouseX+23.5,mouseY-10,43.5,43.5); 
fill(111,68,0);
noStroke();
ellipse(mouseX-26.5,mouseY-10,25,25); 
fill(111,68,0);
noStroke();
ellipse(mouseX+23.5,mouseY-10,25,25); 
fill(3,0,0);
noStroke();
ellipse(mouseX-26.5,mouseY-10,13,13); 
fill(3,0,0);
noStroke();
ellipse(mouseX+23.5,mouseY-10,13,13); 
fill(255,255,255);
noStroke();
ellipse(mouseX-29.25,mouseY-12.25,5,5); 
fill(255,255,255);
noStroke();
ellipse(mouseX+20.75,mouseY-12.25,5,5); 
fill(255,255,255,200);
noStroke();
ellipse(mouseX-29.25,mouseY+2.75,10,10); 
fill(255,255,255,200);
noStroke();
ellipse(mouseX+26.5,mouseY+2.75,10,10); 
}





