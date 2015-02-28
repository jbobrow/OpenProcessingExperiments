
int monsterX; //declareren
int monsterY; // declareren
int teller; //declareren
int richting; //declareren
boolean test; //declareren
int x; //declareren
int spatie;
int stop;
int y;

void setup(){
size(500,500);
monsterX = 400; //initieren
monsterY = 250; //initieren
teller = 0; //initieren
richting = 7; //initieren
test = false;
x = 0;
spatie = 15;
stop = 500;
y = 0;
}




void draw(){
background(255,255,255);
noStroke();
monster();
streepje();
richting();
}
void streepje(){
while (x < stop) {
  noStroke();
  fill(50,0,180);
  rect(0,x,500,10);
  x = x + spatie;
}

x=0;
}

void monster(){
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
}


void richting(){

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


