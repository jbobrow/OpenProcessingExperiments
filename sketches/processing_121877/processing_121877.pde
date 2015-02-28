
int monsterX; //declareren
int monsterY; // declareren

void setup() {
size(200,200);
monsterX = 100; //initieren
monsterY = 40; //initieren
}


void draw(){
background(255,255,255);


/*body*/
fill(215,0,0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(mouseX, monsterY +80,/*100,120,*/80,118);


/*head*/
fill(215,0,0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(mouseX, monsterY,  75,75);

/*face*/
fill(0, 230);
stroke(0);
ellipseMode(CENTER);
ellipse(mouseX, monsterY -13,56,33);

/*eye1*/
fill(0,0,200,255);
stroke(255,100);
ellipseMode(CENTER);
ellipse(mouseX -12, monsterY -13,17,13);

/*eye2*/
fill(0,0,200,255);
stroke(255,100);
ellipseMode(CENTER);
ellipse(mouseX +13, monsterY -13, 17,13);

/*voet1*/
fill(0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(mouseX -30, monsterY +135,40,25);

/*voet2*/
fill(0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(mouseX +30, monsterY +135,40,25);

/*hand1*/
fill(215,0,0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(mouseX +52, monsterY +42,30,20);

/*hand2*/
fill(215,0,0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(mouseX -52, monsterY +42,30,20);

/*stick*/
fill(0);
stroke(0);
rectMode(CORNERS);
rect(mouseX -77, monsterY+45, mouseX +77, monsterY +42);

/*stickpoint*/
fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(mouseX -83, monsterY+45, 30,30);

/*weight2*/
fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(mouseX +83, monsterY +45, 30,30);

monsterY --;

}
