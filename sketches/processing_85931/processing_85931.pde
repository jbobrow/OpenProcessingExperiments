
void setup()
{size(400,600);

}

void draw()
{
noStroke();
background(0);








for (int i = 45; i <550; i = i + 50) {

fill(50);
beginShape();
arc(310, i, 50, 50,0,PI);
arc(285,i, 50, 50,-PI/2,PI/3000);
arc(310,i, 50, 50,-PI/2,PI/3000);
endShape(CLOSE);
}

for (int i = 45; i <550; i = i + 50) {
fill(100);
beginShape();
arc(250, i, 40, 40,0,PI);
arc(230,i, 40, 40,-PI/2,0);
arc(250,i, 40, 40,-PI/2,0);
endShape(CLOSE);
}

for (int i = 45; i <550; i = i + 50) {
fill(150);
beginShape();
arc(190, i, 30, 30,0,PI);
arc(175,i, 30, 30,-PI/2,0);
arc(190,i, 30, 30,-PI/2,0);
endShape(CLOSE);
}

for (int i = 45; i <550; i = i + 50) {
fill(200);
beginShape();
arc(130, i, 20, 20,0,PI);
arc(120,i, 20, 20,-PI/2,0);
arc(130,i, 20, 20,-PI/2,0);
endShape(CLOSE);
}

for (int i = 45; i <550; i = i + 50) {
fill(255);
beginShape();
arc(70, i, 10, 10,0,PI);
arc(65,i, 10, 10,-PI/2,PI/3000);
arc(70,i, 10, 10,-PI/2,PI/3000);
endShape(CLOSE);
}

}



