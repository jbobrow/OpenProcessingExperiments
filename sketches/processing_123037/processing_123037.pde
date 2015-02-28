
int monsterX;      
int monsterY;  
int richting;
int teller;
boolean test;

void setup() {
size (300,300);
monsterX = 100;    
monsterY = 100; 
richting = 6;
teller = 0;
test = true;

}

void draw () {
  
if (monsterY <0 || monsterY >300) {
  richting= -richting;
  teller = teller +1;
}

if (teller == 10) {
  teller = 0;
  test = !test;
}



background (255,255,255);
  
noStroke ();
if (test == true){fill (100,0,100);}
if (test == false){fill (100,0,0);}
ellipseMode (CENTER);
ellipse (mouseX-50,monsterY+75,50,50);  


if (test == true){fill (100,0,100);}
if (test == false){fill (100,0,0);}
ellipseMode (CENTER);
ellipse (mouseX+50,monsterY+75,50,50);  

if (test == true){fill (100,0,100);}
if (test == false){fill (100,0,0);}
ellipseMode (CENTER);
ellipse (mouseX,monsterY,180,150);


stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (mouseX-25,monsterY-25,50,50);


fill (0,0,0);
ellipseMode (CENTER);
ellipse (mouseX-25,monsterY-25,20,20);


stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (mouseX+25,monsterY-25,50,50);


fill (0,0,0);
ellipseMode (CENTER);
ellipse (mouseX+25,monsterY-25,20,20);

monsterY = monsterY + richting;   



}
  













