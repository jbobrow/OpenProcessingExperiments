
class Rain {
float r = random(500);
float y = 0; 


void fall() {
 fill(0,15);
 rect(0,0,600,600);
 y = y + 1;
 
fill(5,80,108);
ellipse(r, y, 10, 30);


}}

Rain r1;
Rain r2;
Rain r3;
Rain r4;
Rain r5;
Rain r6;
Rain r7;
Rain r8;


void setup() {
 size(600,600);
 background(255);
 smooth();
 noStroke();
 r1 = new Rain();
 r2 = new Rain();
 r3 = new Rain();
 r4 = new Rain();
 r5 = new Rain();
 r6 = new Rain();
 r7 = new Rain();
 r8 = new Rain();
}

void draw(){
 r1.fall();
 r2.fall();
 r3.fall();
 r4.fall();
 r5.fall();
 r6.fall();
 r7.fall();
 r8.fall();
 
 
}


  



