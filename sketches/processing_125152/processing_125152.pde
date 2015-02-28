
int monsterY=500;
int r=1;

void setup(){

size(500,500);
}

void draw(){
monsterY--;
background(48,139,206);

//lijn
stroke(0);
fill(0);
line(mouseX-90,monsterY+50,mouseX-90,monsterY-80);
line(mouseX+90,monsterY+50,mouseX+90,monsterY-80);

//oren
stroke(255,0,255);
fill(255,0,255);
rectMode(CENTER);
rect(mouseX-50,monsterY-50,85,75);
rect(mouseX+50,monsterY-50,85,75);
rect(mouseX,monsterY-100,75,75);
rect(mouseX+50,monsterY-100,50,40);
rect(mouseX-50,monsterY-100,50,40);

//bolletje
stroke(255,0,255);
fill(255,0,255);
ellipse(mouseX-90,monsterY+50,20,20);
ellipse(mouseX+90,monsterY+50,20,20);

//body
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(mouseX,monsterY,150,150);

//buitenogen
stroke(255);
fill(255);
ellipseMode(CENTER);
ellipse(mouseX-37,monsterY-25,45,70);
ellipse(mouseX+37,monsterY-25,70,45);

//binnenogen
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(mouseX-37,monsterY-25,25,35);
ellipse(mouseX+37,monsterY-25,35,25);
println("breng me naar je moeder"); 
}



