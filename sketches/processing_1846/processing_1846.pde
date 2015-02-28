
void setup() {

size(500,500);
background(#A58C84);
rectMode(CENTER);
translate(width/2,height/2);


//tallo
stroke(#256A31);
strokeWeight(15);
line(0,-25,0,90);

//tierra
noStroke();
fill(#C6974A);
rect(0,170,width,height/3);

//centro
strokeWeight(15);
stroke(255);
fill(#9D9D34);
ellipse(0,-70,70,70);
translate( 0,-70);
smooth();


//petalos
for (int i = 0; i < 15; i++) {
strokeWeight(5);
stroke(#431505);
fill(#AF5B3C);
rotate(TWO_PI/15);
ellipse(0, -70, 30, 62);
smooth();

/*
strokeWeight(5);
stroke(#431505);
fill(#AF5B3C);
rotate(PI/2.0);
ellipse(0, -70, 62, 15);
*/
}
}

