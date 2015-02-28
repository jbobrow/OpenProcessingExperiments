
 void setup(){
 
 smooth();
background(0);
size(700,700);
translate(width/2,height/2);


 }
 void draw(){
background(0,10);
translate(width/2,height/2);
strokeWeight(10);
stroke(0,255,0);
line(0,0,0,600);

stroke(255);
fill(255,255,0);
ellipseMode (CENTER);
ellipse(0,0,100,100);

fill(100,50,0);
noStroke();
rectMode(CENTER);
rect (0,300,690,100);


for( int i=0;i<25; i++){
rotate(TWO_PI/25);
strokeWeight(2);
stroke(98,7,131,100);
fill(random(190),random(40),255,80);
ellipseMode(CORNER);
ellipse(50,0,random(70,110),random(20,50));
}
for( int i=0;i<25; i++){
rotate(TWO_PI/25);
strokeWeight(2);
stroke(98,7,131,100);
fill(random(120),random(15),255,70);
ellipseMode(CORNER);
ellipse(50,0,random(50,70),random(10,25));
}
 }
 

