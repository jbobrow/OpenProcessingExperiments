
void setup() {
size (500,490);
smooth();
noStroke();
background(#D8D8D8);
noStroke();



textSize(62);
text("MON", 35, 75); 

textSize(28);
text("Feito por todos", 205, 55); 

textSize(12);
text("venha construí-lo com a gente", 205, 75); 



fill(#E3EA80);
rect(62, 270, 6,220);
noFill();
stroke(230,245,72);



for (int i=175; i<180; i++){
arc(190, i, 100, 80, 0, PI, OPEN);
}
for (int i=150; i<155; i++){
arc(190, i, 75, 55, 0, PI, OPEN);
}

noStroke();

fill(#E3EA80);
rect(185, 160, 6,420);

fill(#E3EA80);
ellipse(169, 155, 13, 13);

fill(#E3EA80);
ellipse(211, 155, 13, 13);

fill(#E3EA80);
ellipse(165, 193, 15, 15);

fill(#E3EA80);
ellipse(215, 193, 15, 15);




fill(#E3EA80);
rect(62, 270, 6,220);
noFill();
stroke(230,245,72);


for (int i=115; i<120; i++){
arc(445, i, 100, 80, 0, PI, OPEN);
}
for (int i=90; i<95; i++){
arc(445, i, 75, 55, 0, PI, OPEN);
}

fill(230,245,72);
rect(442, 102, 6,420);

fill(230,245,72);
ellipse(425, 95, 13, 13);

fill(230,245,72);
ellipse(465, 95, 13, 13);

fill(230,245,72);
ellipse(420, 130, 15, 15);

fill(230,245,72);
ellipse(470, 130, 15, 15);



noFill();



for (int i=285; i<290; i++){
arc(65, i, 100, 80, 0, PI, OPEN);
}

for (int i=260; i<265; i++){
arc(65, i, 75, 55, 0, PI, OPEN);
}
fill(#E3EA80);
ellipse(45, 265, 13, 13);

fill(#E3EA80);
ellipse(85, 265, 13, 13);

fill(#E3EA80);
ellipse(40, 302, 15, 15);

fill(#E3EA80);
ellipse(90, 302, 15, 15);

noFill();
for (int i=250; i<350; i++){
arc(300, i, 250,250,QUARTER_PI, HALF_PI+QUARTER_PI);
}

noFill();
for (int i=415; i<420; i++){
arc(300, i, 250,250,PI+QUARTER_PI, PI+QUARTER_PI+HALF_PI);
}

stroke(255);


for (float x=350;  x>20;  x*=0.9) {

    line (x,382,x,450);

}
}
void draw() {
  for (int i=30;i<425 ;i++) {
    line (mouseX-15,382,mouseX-15,450);
  }
 
fill(255);
textSize(10);
text("Semana Cultural de Curitiba", 170, 485); 
}




