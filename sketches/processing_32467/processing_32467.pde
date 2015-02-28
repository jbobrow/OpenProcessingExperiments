
size(400, 600);
background(255);
smooth();

//star
line(300,100,350,100);
line(325,75,325,125);
line(300,75,350,125);
line(350,75,300, 125);

//blue crescnet moon
fill(96,100,171);
beginShape();
curveVertex(380,300);
curveVertex(380,300);
curveVertex(300,350);
curveVertex(280,390);
curveVertex(270,430);
curveVertex(290,500);
//curveVertex(300,520);
//curveVertex(312,550);
curveVertex(500,700);
curveVertex(390,550);
//curveVertex(380,500);
//curveVertex(370,450);
curveVertex(360,440);


curveVertex(380,300);

endShape(CLOSE);

//big ellipse
fill(193,49,27);
ellipse(80,450,160,150);

//small ellipse top left
fill(193,49,27);
ellipse(80,75,60,50);

//star next to it
line(100,125,140,125);
line(100,110,140,140);
line(140,110,100,140);
line(120,110,120, 140);

//triangle cross thingy
beginShape(TRIANGLES);
vertex(200,500);
vertex(150,525);
vertex(250,525);
endShape(CLOSE);

strokeWeight(2);
line(200,375,200,500);

line(180,400, 220, 400);

fill(0);
ellipse(200,375, 30, 30);

//random placement of ellipses

for(int i=0; i<=6; i++){
  float x = random(400);
  float y = random(600);
  ellipse (x,y, 25,25);
  
}

//horizontal linked ellipses

ellipse (220, 75, 16, 16);
ellipse (260, 80, 12, 12);
line(220,75,260,80);

//vertical linked ellipses

ellipse (380, 150, 20, 20);
ellipse (380, 200, 30, 30);
line(385,150,385,200);

//long curvy vertical line

noFill();
beginShape();
curveVertex(80,0);
curveVertex(80,0);
curveVertex(80,75);
curveVertex(40, 150);
curveVertex(0, 225);
curveVertex(35,305);
curveVertex(60,375);
curveVertex(70, 450);
curveVertex(87,520);
curveVertex(120,600);
curveVertex(120,600);
endShape();

fill(0);
beginShape();
curveVertex(80,0);

curveVertex(40, 150);
curveVertex(0, 225);
curveVertex(35,305);

curveVertex(120,600);
endShape(CLOSE);

//finishing the curve cause the rest of the spiral was translated
noFill();
strokeWeight(1);
beginShape();
curveVertex(40, 150);
curveVertex(0, 225);
curveVertex(35,270);
curveVertex(80,275);
curveVertex(85,285);
curveVertex(95,290);
curveVertex(95,290);
endShape();

//ellipse at center of spiral
fill(0);
ellipse(160,225, 30, 30);



//Spiral code edited from a forum post http://processing.org/discourse/yabb2/YaBB.pl?num=1223582667
noFill();
smooth();
translate(160,225);
strokeWeight(1);
beginShape();
for(int i=0;i<75;i++)
{
 curveVertex((i*2)*cos(i/5.0), (i)*sin(i/5.0));
}

endShape();






