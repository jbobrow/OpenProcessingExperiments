
void setup() {
  size(600,600);
  noCursor();
}


void draw() {

  background(mouseY-20,mouseX-50,70);
  
fill(3);


rect(0,0,600,300);

rect(0,450,6000,150);

rect(0,300,300,150);

rect(150,0,150,150);

rect(450,300,150,150);


  translate(mouseX-50,mouseY-50);
  
//sippo
pushMatrix();
fill(250);
translate(75,83);
rotate(map(mouseX-22,mouseY-22,600,0,25));
line(0,0,17,-10);

ellipse(16,-10,6,6);
//ellipse(84,70,6,6);

popMatrix();

fill(0);

strokeJoin(ROUND);
triangle(30, 85, 40, 60, 86, 85);

//tuno

strokeWeight(5);
line(30,40,40,10);
line(50,40,40,10);

strokeWeight(2);


//ganmen
ellipse(40,50,50,50);
//kutibasi
fill(251,255,59);
ellipse(40,55,10,20);

//me migi
fill(250);
pushMatrix();
translate(62,33);
rotate(map(mouseX,mouseY,600,0,222));
//ellipse(60,38,20,20);
ellipse(2,-5,20,20);

//hitomi
fill(250,3,23);
ellipse(0,0,5,5);
popMatrix();

//me hidari
fill(250);
pushMatrix();
translate(20,38);
rotate(map(mouseX,mouseY,600,0,-22));
//ellipse(20,38,20,20);
ellipse(-3,-4,20,20);

//hitomi
fill(250,3,23);
ellipse(0,0,5,5);
popMatrix();



//kutisen
strokeWeight(2);
fill(250);
line(28,58,52,58);



//asi

line(40,85,40,95);

line(50,85,50,95);

line(60,85,60,95);

line(70,85,70,95);
//asi saki
line(37,95,40,95);

line(47,95,50,95);

line(57,95,60,95);

line(67,95,70,95);



}



