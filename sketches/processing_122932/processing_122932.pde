
int monsterX;
int monsterY;

void setup() {
size(500,500);
monsterX = 145;
monsterY = 240;
}

void draw() {
background(255,255,255);  
  
stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(monsterX+190,monsterY+100,90,40);

stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(monsterX+131,monsterY+120,90,60);

stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(monsterX+90,monsterY+90,100,70);

stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(monsterX+60,monsterY+60,100,70);

//hoofd
stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(monsterX+55,monsterY+10,120,90);

//neus
stroke(0);
fill(233,113,247);
ellipseMode(CENTER);
ellipse(monsterX+10,monsterY+10,50,30);

//oog rechts
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(monsterX+60,monsterY-15,15,15);

//pupil rechts
stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(monsterX+57,monsterY-15,5,5);

//oog links
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(monsterX+10,monsterY-15,15,15);

//pupil links
stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(monsterX+7,monsterY-15,5,5);

//diehoek
stroke(0);
fill(234,251,238);
triangle(monsterX+23,monsterY-27, monsterX+51, monsterY-72, monsterX+79, monsterY-27);

monsterY = monsterY - 1;
monsterX = mouseX;
}

