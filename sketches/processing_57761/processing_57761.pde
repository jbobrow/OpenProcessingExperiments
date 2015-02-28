
//Chere De Koh
//*Chapter 7 : Motion
//i.e vibrating robot

float x= 80;
float y = 53;
float bodyHeight = 53;
float neckHeight =50;
float radius = 45; //head height/readius
float angle = 0.0;

void setup() {
  size(460, 480);
  smooth();
  ellipseMode(RADIUS);
  background(204);
}

void draw() {
  //vibrations! change position by small random amt
  x += random(-4,4);
  y += random (-2,2);


 // Change height of neck 
 neckHeight = 10 + sin(angle) * 30; 
 angle += 0.05;

// Adjust the height of the head 
float ny = y - bodyHeight - neckHeight - radius;

//Neck
stroke(102); 
line(x+2, y-bodyHeight, x+2, ny); 
line(x+12, y-bodyHeight, x+12, ny); 
line(x+22, y-bodyHeight, x+22, ny);
 
 
//Head
fill(#000000);
smooth();
ellipse(350,180,40,40);
quad(310,180,390,180,394,235,308,265);
 
//base
fill(#000000);
ellipse(360,410,80,20);
//HELPwanna tilt this 5.81
 
//torso
fill(#000000);
triangle(320,310,360,410,388,280);
 
//facial features!!
 
//eyes
fill(#FFFFFF);
ellipse(310,182,12,12);
 
fill(#FFFFFF);
ellipse(360,176,12,12);
 
//nose
fill(#FFFFFF);
triangle(335,198,335,218,300,218);
 
//mouth smile
fill(#FFFFFF);
triangle(315,230,315,255,354,222);

//bowtie
fill(#FFD700);
quad(340,280,340,310,370,285,370,310);
 
//eyebrow
noFill();
stroke(#FFFFFF);
strokeWeight(4);
strokeJoin(ROUND);
arc(360, 165, 14,14, 3.4, 5.8);
 
//buttons
fill(#FFFFFF);
noStroke();
ellipse(340, 320, 5, 5);


 
 
//Head
fill(#000000);
smooth();
ellipse(350,180,40,40);
quad(310,180,390,180,394,235,308,265);
 
//base
fill(#000000);
ellipse(360,410,80,20);
//HELPwanna tilt this 5.81
 
//torso
fill(#000000);
triangle(320,310,360,410,388,280);
 
//facial features!!
 
//eyes
fill(#FFFFFF);
ellipse(310,182,12,12);
 
fill(#FFFFFF);
ellipse(360,176,12,12);
 
//nose
fill(#FFFFFF);
triangle(335,198,335,218,300,218);
 
//mouth smile
fill(#FFFFFF);
triangle(315,230,315,255,354,222);
 
 
 
 
//bowtie
fill(#FFD700);
quad(340,280,340,310,370,285,370,310);
 
//eyebrow
noFill();
stroke(#FFFFFF);
strokeWeight(4);
strokeJoin(ROUND);
arc(360, 165, 14,14, 3.4, 5.8);
 
//buttons
fill(#FFFFFF);
noStroke();
ellipse(340, 320, 5, 5);
}


