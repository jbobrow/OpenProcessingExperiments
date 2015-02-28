
int Y;

int X;

void setup() {

size(500,500);
background(255);
X = height/2;
}


void draw(){
for (int i = 1; i< 4; i++){
  tekenen((i*120),X);
}

}




 
 void tekenen (int monsterX, int monsterY) {
  
/*body*/
fill(100,0,200);
noStroke();
ellipseMode(CENTER);
ellipse(monsterX, monsterY +80,/*100,120,*/80,118);


/*head*/
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

stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX +52, monsterY +42,30,20);

/*hand2*/

stroke(0,0,0,180);
ellipseMode(CENTER);
ellipse(monsterX -52, monsterY +42,30,20);

 }
 






