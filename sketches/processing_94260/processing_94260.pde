

 
 
/* @pjs font="orbitron-bold"; */
 



//sky
int legA = 256 ;
int legB = 300 ;
int legC = 250 ;
int leg1 = 316 ;
int leg2 = 360 ;
int leg3 = 310 ;
int torso = 256;
int bp1 = 236 ;
int bp2 = 226;
int t1 = 315;
int t2 = 328 ;
int h1 = -306 ;
int gun = 270 ;
int joint1 = 253 ;
int joint2 = 311 ;
int shot1 = 366 ;
int shot2 = 396 ;
int shot3 = 436 ;
int x1 = 10 ;

 PImage ichi;
PFont new1;

void setup() {
size(800, 600);
ichi = loadImage("chi2.jpg");
new1 = createFont("orbitron-bold", 48);


textFont(new1) ; 




}
void draw() {
image(ichi, 0, 0, 800, 600) ;
noStroke();

//text

 text("CEASE AND DESIST", x1, 100) ; 
x1 = x1 + 2 ; 
if (x1 > 1024) {
x1 = -100 ;
}


//legs
fill(#9C7F0B);
triangle(legA, 350, legB, 400, legC, 400);
legA = legA + 1 ; 
if (legA > 1024) {
legA = -100 ;
}
legB = legB + 1 ; 
if (legB > 1024) {
legB = -100 ;
}
legC = legC + 1 ; 
if (legC > 1024) {
legC = -100 ;
}
fill(#9C7F0B);
triangle(leg1, 350, leg2, 400, leg3, 400);
leg1 = leg1 + 1 ; 
if (leg1 > 1024) {
leg1 = -100 ;
}
leg2 = leg2 + 1 ; 
if (leg2 > 1024) {
leg2 = -100 ;
}
leg3 = leg3 + 1 ; 
if (leg3 > 1024) {
leg3 = -100 ;
}

//torso
fill(#9C7F0B);
rect(torso, 256, 60, 100);
torso = torso + 1 ; 
if (torso > 1024) {
torso = -100 ;
}

//backpack
fill(#2E2E2C);
rect(bp1, 256, 20, 80);
bp1 = bp1 + 1 ; 
if (bp1 > 1024) {
bp1 = -100 ;
}
fill(#2E2E2C);
rect(bp2, 266, 20, 60);
bp2 = bp2 + 1 ; 
if (bp2 > 1024) {
bp2 = -100 ;
}
 
//helmet
fill(#253452);
pushMatrix() ;
rotate(radians(90)) ;
arc(296, h1, 80, 60, PI, TWO_PI);
popMatrix() ;
println(h1) ;
h1 = h1 - 1 ; 
if (h1 < -1024) {
h1 = 100 ;
}
 
fill(#798EB8);
triangle(t1, 270, t2, 285, t1, 285);
t1 = t1 + 1 ; 
if (t1 > 1024) {
t1 = -100 ;
}
t2 = t2 + 1 ; 
if (t2 > 1024) {
t2 = -100 ;
}

//joints
fill(#2E2E2C);
rect(joint1, 349, 10, 10);
joint1 = joint1 + 1 ; 
if (joint1 > 1024) {
joint1 = -100 ;
}
 
fill(#2E2E2C);
rect(joint2, 349, 10, 10);
joint2 = joint2 + 1 ; 
if (joint2 > 1024) {
joint2 = -100 ;
}

//gun
fill(#5A5B5E);
rect(gun, 326, 100, 10);
 
fill(#5A5B5E);
rect(gun, 315, 20, 20);
gun = gun + 1 ; 
if (gun > 1024) {
gun = -100 ;
}

//shots
fill(#2E2E2C);
rect(shot1, 326, 5, 5);
shot1 = shot1 + 3 ; 

fill(#2E2E2C);
rect(shot2, 326, 5, 5);
shot2 = shot2 + 3 ; 

fill(#2E2E2C);
rect(shot3, 326, 5, 5);
shot3 = shot3 + 3 ; 

//shoes
fill(#2E2E2C);
rect(legC, 400, 50, 10);

fill(#2E2E2C);
rect(leg3, 400, 50, 10);






}




