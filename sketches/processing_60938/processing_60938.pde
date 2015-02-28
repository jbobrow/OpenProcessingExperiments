

void setup (){
size(600,600);
background(180,177,177);
smooth();
}

void draw (){
for (int i = 20; i< width ; i +=195){
for (int j = 20; j< width ; j +=200){
katze(i, j);
}    
}
}

void katze(int x, int y) {
pushMatrix();
translate(x, y);

//Kopf
stroke(0,0,0);
fill(0,0,0);
ellipse(100,62,100,62);

//Ohren
triangle(60,21,78,32,59,42);
triangle(132,18,137,39,117,31);

//Augen
noStroke();
fill(255,255,255);
ellipse(76,45,17,17);
ellipse(122,45,17,17);

//Augen Inneres
noStroke();
fill(0,0,0);
ellipse(76,45,9,9);
ellipse(122,45,9,9);

//Mund
noFill();
stroke(255,255,255);
strokeWeight(3.5);
arc(99,60,70,55,radians(0),radians(180));

//Nase
fill(255,255,255);
noStroke();
ellipse(99,61,17,10);

//Nasenhaare
stroke(255);
strokeWeight(1);
line(69,58,91,58);
line(91,61,74,62);
line(93,61,72,69);
line(102,58,126,57);
line(105,59,128,61);
line(103,61,122,66);

//Schleife
noStroke();
fill(210,33,170);
triangle(83,18,98,29,82,35);
triangle(97,29,113,20,112,35);
fill(255,255,255);
ellipse(97,29,2,3);

//Körper
stroke(0,0,0);
fill(0,0,0);
triangle(97,93,119,132,77,131);
ellipse(86,113,39,43);

//Schwanz
noFill();
strokeWeight(3);
beginShape ();
curveVertex (32, 88);
curveVertex (34, 94);
curveVertex (19, 99);
curveVertex (11, 91);
curveVertex (20, 74);
curveVertex (40, 70);
curveVertex (45, 73);
curveVertex (49, 82);
curveVertex (54, 113);
curveVertex (60, 119);
curveVertex (67, 123);
curveVertex (77, 123);
endShape ();

strokeWeight(5);
beginShape ();
curveVertex (32, 88);
curveVertex (34, 94);
curveVertex (19, 99);
curveVertex (11, 91);
curveVertex (20, 74);
curveVertex (40, 70);
curveVertex (45, 73);
curveVertex (49, 82);
curveVertex (54, 113);
endShape ();

strokeWeight(3);
beginShape ();
curveVertex (32, 88);
endShape();

if (mousePressed == true) {

//Kopf
stroke(0,0,0);
fill(0,0,0);
ellipse(100,62,100,62);

//Augen
noFill();
stroke(255,255,255);
strokeWeight(2);
arc(76,45,17,17,PI,TWO_PI);
arc(122,45,17,17,PI,TWO_PI);

//Mund
fill(255,255,255);
noStroke();
arc(99,60,70,55,radians(0),radians(180));
}

//Nase
fill(255,255,255);
noStroke();
ellipse(99,61,17,10);

//Nasenhaare
stroke(255);
strokeWeight(1);
line(69,58,91,58);
line(91,61,74,62);
line(93,61,72,69);
line(102,58,126,57);
line(105,59,128,61);
line(103,61,122,66);

//Schleife
noStroke();
fill(210,33,170);
triangle(83,18,98,29,82,35);
triangle(97,29,113,20,112,35);
fill(255,255,255);
ellipse(97,29,2,3);
popMatrix();
}


