
int monsterX; //declareren
int monsterY; // declareren
int teller; //declareren
int richting; //declareren
boolean test; //declareren

void setup(){
size(500,500);
monsterX = 400; //initieren
monsterY = 250; //initieren
teller = 0; //initieren
richting = 7; //initieren
test = false;
}




void draw(){
background(255,255,255);

/*body*/
if(test==true){
  fill(218,20,50);
}else{fill(218,56,110);}
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX,monsterY,250,250);


/*eyes*/
fill(255,255,255);
ellipse(monsterX-50,monsterY-80,100,100);
ellipse(monsterX+50,monsterY-80,100,100);
fill(0);
ellipse(monsterX-50,monsterY-80,50,50);
ellipse(monsterX+50,monsterY-80,50,50);
fill(255,255,255);
ellipse(monsterX-60,monsterY-60,10,10);
fill(255,255,255);
ellipse(monsterX+40,monsterY-60,10,10);

/*hands*/
fill(225,80,130);
ellipse(monsterX-35,monsterY+80,80,80);
fill(225,80,130);
ellipse(monsterX+35,monsterY+80,80,80);

monsterX = monsterX - richting;

if(monsterX>500 || monsterX<0){
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


