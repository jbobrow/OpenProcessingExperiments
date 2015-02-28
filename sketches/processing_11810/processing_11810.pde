
//Assignment #1
//Name: Mengyu Liu
//E-mail: mliu01@brynmawr.edu
//Date: Sept.9, 2010
//Manchester United Club(a british football club in Manchester, Britain)
// or can be seen as a smiling face
void setup(){
  size(600,500);
  smooth();
  background(0);
}

void draw(){
noFill();
stroke(255,255,0);
strokeWeight(60);
arc(300, 200, 360, 360, PI/4, 3*PI/4);
arc(300,250,360,360,5*PI/4,7*PI/4);
stroke(255,0,0);
strokeWeight(50);
arc(300,200,360,360,PI/4,3*PI/4);
arc(300,250,360,360,5*PI/4,7*PI/4);

fill(255,0,0);
strokeWeight(2);
stroke(2);
stroke(255,255,0);
rect(230,140,140,60);
fill(255,255,0);
rect(230,180,140,10);
fill(255,255,0);
rect(230,200,140,100);
triangle(230,300,300,350,370,300);
stroke(0);
beginShape();
vertex(250,170);
vertex(340,170);
vertex(340,180);
vertex(260,180);
vertex(250,170);
endShape(CLOSE);
triangle(250,170,260,170,270,150);
rect(270,150,20,15);
rect(290,150,20,15);
rect(310,150,20,15);
strokeWeight(3);
stroke(255,255,0);
line(280,145,280,170);
line(300,145,300,170);
line(320,145,320,170);
fill(255,0,0);
triangle(280,200,270,220,290,220);
triangle(300,200,290,220,310,220);
quad(260,220,320,220,300,240,280,240);

fill(255,0,0);
beginShape();
vertex(280,240);
vertex(270,250);
vertex(270,270);
vertex(240,240);
vertex(240,250);
vertex(270,280);
vertex(280,280);
vertex(280,310);
vertex(300,310);
vertex(300,300);
vertex(290,300);
vertex(290,280);
vertex(300,280);
vertex(320,300);
vertex(340,290);
vertex(330,280);
vertex(320,290);
vertex(310,280);
vertex(310,260);
vertex(330,245);
vertex(330,280);
vertex(340,280);
vertex(340,220);
vertex(350,220);
vertex(350,205);
vertex(340,215);
vertex(330,215);
vertex(330,205);
vertex(320,205);
vertex(320,220);
vertex(330,220);
vertex(330,230);
vertex(310,250);
vertex(300,240);
vertex(280,240);
endShape(CLOSE);
fill(255,255,0);
stroke(255,0,0);
strokeWeight(2);
triangle(280,240,300,240,290,250);
triangle(280,230,280,220,290,230);
triangle(290,230,300,230,300,220);
fill(255,0,0); // red
stroke(255,255,0);
strokeWeight(3);

//beginShape();
//curveVertex(100,400); //top arc
//curveVertex(160,130); // 
//curveVertex(420,130);
//curveVertex(500,400);
//endShape(CLOSE);
ellipseMode(CENTER);
ellipse(180,220,60,60);
ellipse(420,220,60,60);
//beginShape();
//curveVertex(100,0);
//curveVertex(200,370);
//curveVertex(400,370);
//curveVertex(500,0);
//endShape(CLOSE);






}



