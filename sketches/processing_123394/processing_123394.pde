
int monsterX; //declareren
int monsterY; // declareren
int teller; //declareren
int richting; //declareren
boolean test; //declareren



void setup() {
size(200,200);
monsterX = 100; //initieren
monsterY = 40; //initieren
teller = 0; //initieren
richting = 3; //initieren
test = false;
}


void draw(){
background(255,255,255);


/*body*/
if(test==true) {
fill(0,200,200);
} else {
  fill(215,0,0);
}
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX, monsterY +80,/*100,120,*/80,118);


/*head*/
if(test==true) {
fill(0,200,200);
} else {
  fill(215,0,0);
}
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX, monsterY,  75,75);

/*face*/
fill(0, 230);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX, monsterY -13,56,33);

/*eye1*/
fill(0,0,200,255);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX -12, monsterY -13,17,13);

/*eye2*/
fill(0,0,200,255);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX +13, monsterY -13, 17,13);

/*voet1*/
fill(0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX -30, monsterY +135,40,25);

/*voet2*/
fill(0);
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX +30, monsterY +135,40,25);

/*hand1*/
if(test==true) {
fill(0,200,200);
} else {
  fill(215,0,0);
}
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX +52, monsterY +42,30,20);

/*hand2*/
if(test==true) {
fill(0,200,200);
} else {
  fill(215,0,0);
}
stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX -52, monsterY +42,30,20);

/*stick*/
fill(0);
stroke(0);
rectMode(CORNERS);
rect(monsterX -77, monsterY+45, monsterX +77, monsterY +42);

/*stickpoint*/
fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX -83, monsterY+45, 30,30);

/*weight2*/
fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX +83, monsterY +45, 30,30);

monsterY = monsterY-richting;

if(monsterY>200 || monsterY<0){
  richting = -richting;
  teller++;
  println(teller);
  println(test);
  
if(teller==10){
  teller=0;
  test = !test;

  
}
  
}

}
