
void setup()
{
  size(500,500);
  background(255);
  
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
//polygone à 6 côtés
beginShape();
//point dans le sens horaire en patant de celui le plus haut
vertex(50, 10);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 30);
vertex(15, 70);
endShape(CLOSE);

//centre du polygone
point(50,50);

//2
translate(80,0);
beginShape();
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(50, 10);
vertex(15, 30);
endShape(CLOSE); 

//3
translate(80,0);
beginShape();
vertex(85, 30);
vertex(50, 10);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//4
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//5
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 30);
vertex(50, 90);
vertex(85, 70);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//6
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 30);
vertex(85, 70);
vertex(15, 70);
vertex(50, 90);
vertex(15, 30);
endShape(CLOSE);

//7
translate(-400,100);
beginShape();
vertex(15, 70);
vertex(50, 10);
vertex(50, 90);
vertex(85, 30);
vertex(85, 70);
vertex(15, 30);
endShape(CLOSE);

//8
translate(80,0);
beginShape();
vertex(15, 30);
vertex(50, 10);
vertex(15, 70);
vertex(85, 30);
vertex(50, 90);
vertex(85, 70);
endShape(CLOSE);

//9
translate(80,0);
beginShape();
vertex(15, 30);
vertex(50, 10);
vertex(15, 70);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
endShape(CLOSE);

//10
translate(80,0);
beginShape();
vertex(50, 10);
vertex(15, 30);
vertex(15, 70);
vertex(85, 30);
vertex(50, 90);
vertex(85, 70);
endShape(CLOSE);

//11
translate(80,0);
beginShape();
vertex(85, 30);
vertex(85, 70);
vertex(50, 10);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//12
translate(80,0);
beginShape();
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(50, 10);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//13
translate(-400,100);
beginShape();
vertex(50, 10);
vertex(85, 70);
vertex(85, 30);
vertex(15, 70);
vertex(50, 90);
vertex(15, 30);
endShape(CLOSE);

//14
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 70);
vertex(85, 30);
vertex(50, 90);
vertex(15, 30);
vertex(15, 70);
endShape(CLOSE);

//15
translate(80,0);
beginShape();

vertex(85, 30);
vertex(50, 10);
vertex(85, 70);
vertex(15, 70);
vertex(50, 90);
vertex(15, 30);
endShape(CLOSE);

//16
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

//17
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 70);
vertex(85, 30);
vertex(15, 30);
vertex(50, 90);
vertex(15, 70);

endShape(CLOSE);

//18
translate(80,0);
beginShape();
vertex(50, 90);
vertex(50, 10);
vertex(85, 70);
vertex(15, 70);
vertex(85, 30);
vertex(15, 30);
endShape(CLOSE);

//19
translate(-400,100);
beginShape();
vertex(15, 70);
vertex(85, 30);
vertex(50, 90);
vertex(15, 30);
vertex(50, 10);
vertex(85, 70);
endShape(CLOSE);

//20
translate(80,0);
beginShape();
vertex(15, 70);
vertex(85, 30);
vertex(50, 90);
vertex(15, 30);
vertex(85, 70);
vertex(50, 10);
endShape(CLOSE);

//21
translate(80,0);
beginShape();
vertex(50, 10);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
vertex(85, 70);
vertex(85, 30);
endShape(CLOSE);

//22
translate(80,0);
beginShape();
vertex(85, 70);
vertex(15, 30);
vertex(85, 30);
vertex(50, 90);
vertex(50, 10);
vertex(15, 70);
endShape(CLOSE);

//23
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

//24
translate(80,0);
beginShape();
vertex(50, 10);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);

}  
  


