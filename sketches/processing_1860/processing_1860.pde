
void setup(){
size(500,500);
background(63,220,250);
smooth();




translate(width/2,height/2-100);
rectMode(CENTER);

fill(157,134,2);
noStroke();
rect(0,300,500,125);

stroke(73,185,9);
strokeWeight(15);
line(0,0,0,233);

fill(249,250,13);
stroke(255);
strokeWeight(20);
ellipse(0,0,60,60);

int i=0;
for(i=0; i<17;i++){
rotate(radians(360/17));
fill(249,172,250);
stroke(232,4,245);
strokeWeight(5);
ellipse(10,70,25,75);
}

translate(0,+150);
rotate(radians(100));
fill(80,252,13);
stroke(73,185,9);
strokeWeight(5);
ellipseMode(CORNER);
ellipse(5,0,30,75);


}





