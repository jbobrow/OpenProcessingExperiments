
int monsterX;
int monsterY;

void setup(){
size(800,800);
monsterX = 350;
monsterY = 400;
}

void draw(){
background(255,255,255);
stroke(0);
fill(0,0,0);
rect(monsterX -20,monsterY +60,40,65);  //linker been
rect(monsterX +70,monsterY +60,40,65);  //rechter been
rect(monsterX -90,monsterY -50,60,30);  //linker arm
rect(monsterX +120,monsterY -50,60,30);  //rechter arm
fill(0,0,255);
ellipseMode(CENTER);
ellipse(monsterX +45,monsterY -20,200,210); //lichaam
ellipse(monsterX +45,monsterY -170,180,180); //hoofd
fill(0,0,0);
ellipse(monsterX +15 ,monsterY -175,32,64); //linker oog
fill(255,255,255);
ellipse(monsterX +15,monsterY -175,8,16); //linker pupil
fill(0,0,0);
ellipse(monsterX +80,monsterY -175,32,64); //rechter oog
fill(255,255,255);
ellipse(monsterX +80,monsterY -175,8,16); //rechter pupil

fill(0,0,0);
ellipse(monsterX +45,monsterY -115,64,32); //mond
fill(0,0,0);
ellipse(monsterX +40,monsterY -155,4,16); //rechterneusgat
ellipse(monsterX +55,monsterY -155,4,16); //linkerneusgat

monsterY += 1;
monsterX = mouseX;
}

