
boolean kleur;
 int x;
 int y;
 int spatie = 300;
 int stop = 1000;
 
void setup () {
size(1000,1000);

}
void draw () {
background(255,255,255);


 for (int i=0; i<stop; i=i+spatie) { 
DrawMonster (i,50);
 
 } 
}





void DrawMonster (int monsterX, int monsterY) { 
 
    
//hoofd
if (kleur == false) {fill (205,0,205);}
if (kleur == true ) {fill (139,69,19);}
ellipse(monsterX,monsterY,260,350);
 
//rechteroog
fill (255,0,0);
ellipse(monsterX+50,monsterY-25,100,100);
//linkeroog
ellipse(monsterX-45,monsterY-25,100,100);
 
//rechter pupil
fill(0,0,0);
ellipse(monsterX+50,monsterY-25,40,40);
//linker pupil
ellipse(monsterX-45,monsterY-25,40,40);
//unibrown
rect(monsterX-100,monsterY-75,200,20);
//linker neusgat
ellipse(monsterX-20,monsterY+55,20,20);
//rechter neusgat
ellipse(monsterX+20,monsterY+55,20,20);
//mond
fill(176,23,31);
ellipse(monsterX,monsterY+125,170,50);
fill (0,0,0);
line(monsterX-85,monsterY+125,monsterX+85,monsterY+125);


}





