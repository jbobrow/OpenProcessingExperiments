
int monsterX;     
int monsterY; 
int richting;
int teller;
boolean test;
int y;
int spatie;
int stop;
 
 
 
void setup() {
size (500,500);
monsterX = 100;   
monsterY = 100;
richting = 6;
teller = 0;
test = true;
y = 0;
spatie = 22;
stop = 600;
 
}
 
void draw () {
   
  background (255);
   
  while(y < stop){
    println("test");
   noStroke();
   fill(43,57,87);
   rect(0,y,500,10);
   y = y + spatie;
}
y=0;
 
   
if (monsterY <-120 || monsterY >580) {
  richting= -richting;
  teller = teller +1;
}
 
if (teller == 10) {
  teller = 0;
  test = !test;
}
 
 
 
 
   
noStroke ();
if (test == true){fill (100,0,100);}
if (test == false){fill (100,0,0);}
ellipseMode (CENTER);
ellipse (monsterX+50,monsterY+75,50,50); 
 
 
if (test == true){fill (100,0,100);}
if (test == false){fill (100,0,0);}
ellipseMode (CENTER);
ellipse (monsterX+150,monsterY+75,50,50); 
 
if (test == true){fill (100,0,100);}
if (test == false){fill (100,0,0);}
ellipseMode (CENTER);
ellipse (monsterX+100,monsterY,180,150);

if (test == true) {fill (100,0,100);}
if (test == false) {fill (100,0,0);}
ellipseMode(CENTER);
ellipse (monsterX+2,monsterY,45,30);

if (test == true) {fill (100,0,100);}
if (test == false) {fill (100,0,0);}
ellipseMode(CENTER);
ellipse (monsterX+200,monsterY,45,30);


if (test == true) {fill (100,0,100);}
if (test == false) {fill (100,0,0);}
ellipseMode(CENTER);
ellipse (monsterX+100,monsterY-86,30,30);

if (test == true) {fill (100,0,100);}
if (test == false) {fill (100,0,0);}
ellipseMode(CENTER);
ellipse (monsterX+90,monsterY-109,35,30);

if (test == true) {fill (100,0,100);}
if (test == false) {fill (100,0,0);}
ellipseMode(CENTER);
ellipse (monsterX+80,monsterY-132,20,30);

stroke (0,0,0);
fill (250,250,250);
if (test == true) {ellipseMode (CENTER);
                   ellipse (monsterX+75,monsterY-25,50,50);}
if (test == false) {ellipseMode (CENTER);
                    ellipse (monsterX+50,monsterY-25,100,100);}

fill (0,0,0); 
if (test == true) {ellipseMode (CENTER);
                   ellipse (monsterX+75,monsterY-25,20,20);}
if (test == false) {ellipseMode (CENTER);
                    ellipse (monsterX+50,monsterY-25,30,30);}
                   
 
stroke (0,0,0);
fill (250,250,250);
if (test == true) {ellipseMode (CENTER);
                   ellipse (monsterX+125,monsterY-25,50,50);}
if (test == false) {ellipseMode (CENTER);
                    ellipse (monsterX+150,monsterY-25,100,100);}

fill (0,0,0); 
if (test == true) {ellipseMode (CENTER);
                   ellipse (monsterX+125,monsterY-25,20,20);}
if (test == false) {ellipseMode (CENTER);
                    ellipse (monsterX+150,monsterY-25,30,30);} 


 

 
monsterY = monsterY + richting;  
 
 
 
}

