
 void setup(){
 
 smooth();
background(0);
size(700,700);
translate(width/2,height/2);

strokeWeight(10);
stroke(0,255,0);
line(0,0,0,600);

stroke(255);
fill(255,255,0);
ellipse(0,0,100,100);

fill(255,125,0);
noStroke();
rectMode(CENTER);
rect (0,300,690,100);




for( int i=0;i<25; i++){
rotate(TWO_PI/25);
strokeWeight(2);
stroke(98,7,131);
fill(190,15,255);
ellipse(100,0,100,25);
}

 }
 

