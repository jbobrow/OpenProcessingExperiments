
int monsterX;
int monsterY;
int teller;
int richting;
boolean test;

int y;  
int spatie;
int stop; 


/*
/*int y = 80
int x = 50
int spacing = 10;
int len = 20;

line(x,y,x,y+len);

x = x + spacing;
line (x,y,x,y+len);*/


void setup(){
  size(200,200);
  monsterX = 60;
  monsterY = 55;
  
 teller = 0;
 richting = 4;
 test = false;
 
  y = 0;
  spatie = 20;
  stop = 500;
}

void draw(){
  background(255);
  
noStroke();
ellipseMode(CENTER);
rectMode(CENTER);

stripes();      // background stripes
move();
monster();
}

void stripes(){
  while(y < stop){
   println("test");
   noStroke();
   fill(240);
   rect(0,y,400,5);
   y = y + spatie;
}

y = 0;
}

void move(){
  monsterX = monsterX-richting;

if(monsterX>200 || monsterX<0){
  richting = -richting;
  teller = teller+1;
  println(teller);
  println(test);
}
  
if(teller==10){
  test = !test;
  teller = 0;

}
}
 
void monster(){
  if(test == true){
  fill(113,50,170);                         //ear1
ellipseMode(CENTER);                        //ear1
ellipse(monsterX,monsterY,50,50);           //ear1
}
if(test == false){
  fill(113,50,0);                           //ear1
ellipseMode(CENTER);                        //ear1
ellipse(monsterX,monsterY,50,50);           //ear1
}

if(test == true){
fill(113,50,170);                           //ear2
ellipseMode(CENTER);                        //ear2
ellipse(monsterX+53,monsterY-5,50,50);      //ear2
}
if(test == false){
fill(113,50,0);                             //ear2
ellipseMode(CENTER);                        //ear2
ellipse(monsterX+53,monsterY-5,50,50);      //ear2
}

fill(255,255,255);                          //inear1
ellipseMode(CENTER);                        //inear1
ellipse(monsterX-2,monsterY+2,20,20);       //inear1


fill(255,255,255);                          //inear2
ellipseMode(CENTER);                        //inear2
ellipse(monsterX+53,monsterY-5,20,20);      //inear2


if(test == true){
fill(113,50,170);                           //head
ellipseMode(CENTER);                        //head
ellipse(monsterX+30,monsterY+30,85,85);     //head
}
if(test == false){
fill(113,50,0);                             //head
ellipseMode(CENTER);                        //head
ellipse(monsterX+30,monsterY+30,85,85);     //head
}

fill(0,0,20);                               //eye1
ellipseMode(CENTER);                        //eye1
ellipse(monsterX+40,monsterY+15,5,5);       //eye1

fill(0,0,20);                               //eye2
ellipseMode(CENTER);                        //eye2
ellipse(monsterX+20,monsterY+15,5,5);       //eye2

fill(0,0,20);                               //nose
ellipseMode(CENTER);                        //nose
ellipse(monsterX+30,monsterY+40,5,5);       //nose

//fill(255,255,255);        //mouth
//rect(monsterX+20,monsterY+50,monsterX-56,monsterY-45);        //mouth  
//rect(monsterX+24,monsterY+50,monsterX-56,monsterY-45);        //mouth
//rect(monsterX+28,monsterY+50,monsterX-56,monsterY-45);        //mouth
//rect(monsterX+32,monsterY+50,monsterX-56,monsterY-45);        //mouth
//rect(monsterX+36,monsterY+50,monsterX-56,monsterY-45);        //mouth
line(monsterX+20,monsterY+60,monsterX+40,monsterY+60);          //mouth


line(monsterX+30,monsterY+40,monsterX-15,monsterY+25);          //nosehairleft1
line(monsterX+30,monsterY+40,monsterX-15,monsterY+35);          //nosehairleft2
line(monsterX+30,monsterY+40,monsterX-15,monsterY+45);          //nosehairleft3

line(monsterX+30,monsterY+40,monsterX+80,monsterY+25);          //nosehairright1
line(monsterX+30,monsterY+40,monsterX+80,monsterY+35);          //nosehairright2
line(monsterX+30,monsterY+40,monsterX+80,monsterY+45);          //nosehairright3
}


