
void setup()
{size(400,600);

}

void draw()
{
noStroke();
background(0);
fill(255);
//3e ligne
//forme 2 en haut à gauche
stroke(255);
strokeCap(ROUND);
strokeWeight(1);
noFill();
for (int i = 40; i <600; i = i + 20) {
arc(40,i,40,40,PI,PI/2+PI);
arc(40,i,40,40,PI/2,PI);
arc(60,i,40,40,PI,PI/2+PI);
arc(40,i,40,40,0,PI/2);}

for (int i = 40; i <600; i = i + 20) {
//forme 20
arc(100,i,40,40,PI,PI/2+PI);
arc(80,i,40,40,0,PI/2);
arc(120,i-20,40,40,PI/2,PI);
arc(120,i+20,40,40,PI,PI/2+PI);}
//forme3
for (int i = 40; i <600; i = i + 20) {
arc(160,i,40,40,PI,PI/2+PI);
arc(140,i,40,40,0,PI/2);
arc(180,i,40,40,PI,PI/2+PI);
arc(180,i,40,40,PI/2,PI);}
//forme4

for (int i = 40; i <600; i = i + 20) {
arc(220,i,40,40,PI,PI/2+PI);
arc(200,i,40,40,0,PI/2);
arc(240,i,40,40,PI,PI/2+PI);
arc(220,i,40,40,0,PI/2);}

//forme5
for (int i = 40; i <600; i = i + 20) {
arc(280,i,40,40,PI,PI/2+PI);
arc(280,i+20,40,40,PI,PI/2+PI);
arc(280,i-20,40,40,0,PI/2);
arc(300,i,40,40,PI/2,PI);}
//forme6
for (int i = 40; i <600; i = i + 20) {
beginShape();
arc(340,i,40,40,PI,PI/2+PI);
arc(340,i+20,40,40,PI,PI/2+PI);
arc(360,i,40,40,PI,PI/2+PI);
arc(360,i,40,40,PI/2,PI);
endShape(CLOSE);}
}


