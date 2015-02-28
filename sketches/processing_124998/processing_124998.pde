
int monsterX; //declareren
int monsterY; // declareren
int teller; //declareren
int richting; //declareren
boolean test; //declareren
int y;  //declareren
int spatie; //declareren
int stop; //declareren
int x;

void setup() {

size(200,200);
monsterX = 100; //initieren
monsterY = 40; //initieren
teller = 0; //initieren
richting = 1; //initieren
test = false;
y= 0;
spatie = 15;
stop = 500;
x = 0;
}


void draw(){

background(255);
noStroke();

 
while(y < stop){
   noStroke();
   fill(10,125,0);
   rect(0,y,400,10);
   y = y + spatie;
}

y=0;

while(x < stop){
   noStroke();
   fill(10,125,0);
   rect(x,0,10,400);
   x = x + spatie;
}

x=0;
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

/*eyeballs*/
fill(0, 230);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX+13, monsterY -13,33,33);
fill(0, 230);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX -13, monsterY -13,33,33);

/*eye1*/
fill(255);
noStroke();
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX -14, monsterY -11,17,17);

/*eye2*/
fill(255);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX +13, monsterY -11, 17,17);

fill(0);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX +12, monsterY +2 -11,11,11);

fill(0);
stroke(255,100);
ellipseMode(CENTER);
ellipse(monsterX -11, monsterY +2 -11, 11,11);





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
/*fill(0);
stroke(0);
rectMode(CORNERS);
rect(monsterX -77, monsterY+45, monsterX +77, monsterY +42);

/*stickpoint*/
/*fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX -83, monsterY+45, 30,30);

/*weight2*/
/*fill(0);
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX +83, monsterY +45, 30,30);*/

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


