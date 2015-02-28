
void setup()
{
  size(500,500);
  background(255);
  smooth();
}

void draw()
{
  fill(#14C432);
  
  /*
modèle de base
//polygone à 6 côtés
beginShape();
//point dans le sens horaire en patant de celui le plus haut
vertex(50, 10);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//centre du polygone
point(50,50);
*/

//1
beginShape();
//point dans le sens horaire en patant de celui le plus haut
vertex(50, 10);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//centre du polygone
point(50,50);
  
//2
translate(80,0);

strokeWeight(6);

point(50, 10);
point(85, 30);
point(85, 70);
point(50, 90);
point(15, 70);
point(15, 30);

point(50,50);

//3
translate(80,0);

strokeWeight(1);

beginShape();
vertex(85, 30);
vertex(50, 10);

strokeWeight(6);
point(85, 70);
strokeWeight(1);

vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

point(50,50);

//4
translate(80,0);

beginShape();
vertex(50, 10);
vertex(15, 70);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(50,50);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(30);
point(50,50);
strokeWeight(1);

//5
translate(80,0);

beginShape();
vertex(50, 10);
vertex(50,50);
vertex(15, 70);
vertex(85, 70);
vertex(50, 90);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(30);
point(50,50);
strokeWeight(1);

//6
translate(80,0);

beginShape();
vertex(15, 70);
vertex(50, 10);
vertex(85, 30);
vertex(50,50);
vertex(50, 90);
vertex(85, 70);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(30);
point(50,50);
strokeWeight(1);

//7
translate(-400,100);

strokeWeight(30);
point(50,50);
strokeWeight(1);

beginShape();
vertex(15, 70);
vertex(50, 10);
vertex(85, 30);
vertex(50,50);
vertex(50, 90);
vertex(85, 70);
vertex(15, 30);
endShape(CLOSE);

//8
translate(80,0);

strokeWeight(30);
point(50,50);
strokeWeight(1);

beginShape();
vertex(50, 10);
vertex(50,50);
vertex(15, 70);
vertex(85, 70);
vertex(50, 90);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

//9
translate(80,0);

strokeWeight(30);
point(50,50);
strokeWeight(1);

beginShape();
vertex(50, 10);
vertex(15, 70);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(50,50);
vertex(15, 30);
endShape(CLOSE);

//10
translate(80,0);

strokeWeight(30);
point(50,50);
strokeWeight(1);

noFill();
ellipse(50,50,60,60);

fill(#14C432);

beginShape();
vertex(50, 10);
vertex(15, 70);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(50,50);
vertex(15, 30);
endShape(CLOSE);

//11
translate(80,0);

strokeWeight(30);
point(50,50);
strokeWeight(1);

beginShape();
vertex(50, 10);
vertex(50,50);
vertex(15, 70);
vertex(85, 70);
vertex(50, 90);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

//12
translate(80,0);

noFill();
ellipse(50,50,80,80);

fill(#14C432);

beginShape();
vertex(50, 10);
vertex(50,50);
vertex(15, 70);
vertex(85, 70);
vertex(50, 90);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(15);
point(50,30);
strokeWeight(1);

//13
translate(-400,100);

strokeWeight(5);
noFill();
ellipse(50,50,40,40);
strokeWeight(1);

fill(#14C432);

beginShape();
vertex(50, 10);
vertex(15, 70);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(50,50);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(15);
point(50,50);
strokeWeight(1);

noFill();
strokeWeight(2);
ellipse(50,50,60,60);
strokeWeight(1);

fill(#14C432);

//14
translate(80,0);

noFill();
strokeWeight(4);
ellipse(50,30,40,40);
strokeWeight(1);

fill(#14C432);

beginShape();
vertex(50, 10);
vertex(50,50);
vertex(15, 70);
vertex(85, 70);
vertex(50, 90);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(15);
point(50,50);
strokeWeight(1);

noFill();
strokeWeight(2);
ellipse(62,70,50,50);
strokeWeight(1);
fill(#14C432);

//15
translate(80,0);

strokeWeight(5);
noFill();
ellipse(50,50,40,40);
strokeWeight(1);

fill(#14C432);

beginShape();
vertex(15, 70);
vertex(50, 10);
vertex(85, 30);
vertex(50,50);
vertex(50, 90);
vertex(85, 70);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(30);
point(50,50);
strokeWeight(1);

//16
translate(80,0);

noFill();
ellipse(50,50,80,80);

fill(#14C432);

beginShape();
vertex(50, 10);
vertex(15, 70);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(50,50);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(15);
point(30,40);
strokeWeight(1);

//17
translate(80,0);

noFill();
ellipse(50,50,80,80);

fill(#14C432);

beginShape();
vertex(15, 70);
vertex(50, 10);
vertex(85, 30);
vertex(50,50);
vertex(50, 90);
vertex(85, 70);
vertex(15, 30);
endShape(CLOSE);

strokeWeight(15);
point(50,50);
strokeWeight(1);

noLoop();
}


