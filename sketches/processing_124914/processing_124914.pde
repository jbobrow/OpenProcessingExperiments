
int omhoog;
boolean kleur;
int counter;
int richting;

void setup () { 
 omhoog = 500;
size(500,500);
kleur=false;
counter=0; 
richting = -10;
}
void draw () {
background(255,255,255);
stroke(0);
omhoog=omhoog + richting;
if (omhoog == -180 || omhoog == 680) {
 richting = -richting; 
  counter = counter+1;
}
if (counter==10) {
  kleur=true;
  counter=0;
}



ellipseMode(CENTER);
//hoofd
if (kleur == false) {fill (205,0,205);}
if (kleur == true ) {fill (139,69,19);} 
ellipse(mouseX,omhoog,260,350);

//rechteroog
fill (255,0,0);
ellipse(mouseX+50,omhoog-25,100,100);
//linkeroog
ellipse(mouseX-45,omhoog-25,100,100);

//rechter pupil
fill(0,0,0);
ellipse(mouseX+50,omhoog-25,40,40); 
//linker pupil
ellipse(mouseX-45,omhoog-25,40,40);
//unibrown
rect(mouseX-100,omhoog-75,200,20);
//linker neusgat
ellipse(mouseX-20,omhoog+55,20,20);
//rechter neusgat
ellipse(mouseX+20,omhoog+55,20,20);
//mond
fill(176,23,31);
ellipse(mouseX,omhoog+125,170,50);
fill (0,0,0);
line(mouseX-85,omhoog+125,mouseX+85,omhoog+125);
}

