
int monsterX; //declareren
int monsterY; // declareren



void setup(){
size(500,500);
monsterX = 400; //initieren
monsterY = 250; //initieren

}


void draw(){
background(255,255,255);

/*body*/
stroke(0);
fill(218,56,110);
ellipseMode(CENTER);
ellipse(mouseX,monsterY,250,250);

/*eyes*/
fill(255,255,255);
ellipse(mouseX-50,monsterY-80,100,100);
ellipse(mouseX+50,monsterY-80,100,100);
fill(0);
ellipse(mouseX-50,monsterY-80,50,50);
ellipse(mouseX+50,monsterY-80,50,50);
fill(255,255,255);
ellipse(mouseX-60,monsterY-60,10,10);
fill(255,255,255);
ellipse(mouseX+40,monsterY-60,10,10);

/*hands*/
fill(225,80,130);
ellipse(mouseX-35,monsterY+80,80,80);
fill(225,80,130);
ellipse(mouseX+35,monsterY+80,80,80);

monsterY --;

}
