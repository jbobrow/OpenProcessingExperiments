
void setup () {

size (450, 450);
background (255);
smooth();

}

void draw () {
noStroke();


if (mousePressed) {
rectMode(CENTER);

for (int x = 10; x<width+50; x +=10) {

for (int y = 10; y<height+50; y+=20) {
  
fill (random(0,90), 0, random(0,255), 80);

rect (x, y, random(50,100),random(50,70));

fill (random(0,90), random(0,100), random(0,255), 40);
ellipse (x, y, 50, 50);
}
}

}

}                
