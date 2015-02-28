
void setup()
{size(500,500);

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
for (int i = 40; i <550; i = i + 20)
for (int j =20; j<250; j=j+20) {
arc(j-20,i-20,40,40,PI,PI/2+PI);
arc(j-20,i-20,40,40,PI/2,PI);
arc(j,i-20,40,40,PI,PI/2+PI);
arc(j-20,i-20,40,40,0,PI/2);}

for (int i = 40; i <550; i = i + 20)
for (int j=250; j<500; j=j+20){
rotate(PI/2);
arc(j,i-20,40,40,PI,PI/2+PI);
arc(j,i,40,40,PI,PI/2+PI);
arc(j,i-40,40,40,0,PI/2);
arc(j+20,i-20,40,40,PI/2,PI);}
}


