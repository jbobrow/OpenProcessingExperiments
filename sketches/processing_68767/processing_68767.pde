
void setup() {
  size(600,400);
 
 
}

void draw() { 
  background(map(mouseX,0,600,33,142),map(mouseX, 0, 600, 48,193),map(mouseX, 0, 400,80,255));
  println("The MouseX is: " + mouseX + " And MouseY is: " + mouseY);
smooth();
noStroke();
//left
fill(map(mouseX, 0, 600, 200, 255),100);
ellipse(180,310,50,30);
ellipse(170,290,50,40);
ellipse(160,270,50,30);
ellipse(150,250,50,30);
ellipse(160,230,50,30);
ellipse(165,210,50,40);
ellipse(170,200,50,50);
ellipse(165,210,50,40);
ellipse(200,180,90,80);
//right
ellipse(380,310,50,30);
ellipse(390,290,50,40);
ellipse(400,270,50,30);
ellipse(410,250,50,30);
ellipse(400,230,50,30);
ellipse(405,210,50,40);
ellipse(390,200,50,50);
ellipse(405,210,50,40);
ellipse(370,180,90,80);
//top
fill(map(mouseX, 0, 600, 230, 255),100);
ellipse(285,160,80,80);
ellipse(240,170,90,80);
ellipse(325,170,90,80);
//bottom
fill(map(mouseX, 0, 600, 180, 255),80);
ellipse(100,380,150,150);
ellipse(130,360,130,120);
ellipse(150,320,100,80);
ellipse(450,380,150,150);
ellipse(380,410,250,200);
ellipse(420,360,130,120);
ellipse(400,320,100,80);
ellipse(200,400,250,200);
ellipse(250,400,250,200);
ellipse(300,400,250,200);
 
fill(map(mouseX, 0, 600, 190, 255),100);
ellipse(300,340,70,70);
ellipse(265,335,80,70);
ellipse(335,335,80,70);
ellipse(230,320,90,70);
ellipse(370,320,90,70);
ellipse(200,315,100,70);
ellipse(385,315,100,70);
 


//face
fill(255,247,229);
ellipse(250,250,130,120);
ellipse(310,250,130,120);
ellipse(270,275,145,100);
 
beginShape();
vertex(235,320);
vertex(376,238);
vertex(385,292);
endShape(CLOSE);
 
 
ellipse(320,300,130,70);
 
//face color
noStroke();
 
fill(255,250,240);
beginShape();
vertex(280,260);
vertex(360,255);
vertex(355,300);
 
endShape(CLOSE);
 
ellipse(320,253,120,20);
 
//mouth
fill(255,155,185);
ellipse(355,313,45,30);
fill(255,247,229);
ellipse(355,map(mouseY,0,400,308,298),45,30);
 
fill(230,142,150,190);
ellipse(353,300,30,10);
 
stroke(255,125,194);
strokeWeight(3);
line(355,305,340,300);
line(355,305,365,300);
stroke(255,125,194,100);
line(355,305,358,323);
 


//eyes
noStroke();
fill(27,83,79,230);
ellipse(255,255,32,32);
ellipse(370,245,30,30);
fill(0);
ellipse(255,255,26,26);
ellipse(370,245,24,24);
 
fill(255,247,229);
ellipse(255,map(mouseX,0,200,250,236),32,32);

//ears
fill(255);
beginShape();
vertex(150,180);
vertex(map(mouseX,0,600,45,35),map(mouseY,0,400,210,230));
vertex(140,240);
endShape(CLOSE);
 
beginShape();
vertex(415,180);
vertex(map(mouseX,0,600,450,455),map(mouseY,0,400,240,230));
vertex(425,230);
endShape(CLOSE);

//ears-pale part 
stroke(255,243,216);
strokeWeight(2);
 
fill(255,243,216);
beginShape();
vertex(142,220);
vertex(map(mouseX,0,600,45,35),map(mouseY,0,400,210,230));
vertex(140,240);
endShape(CLOSE);
 
beginShape();
vertex(425,229);
vertex(map(mouseX,0,600,450,455),map(mouseY,0,400,240,230));
vertex(424,243);
endShape(CLOSE);


//tail
fill(255);
noStroke();
beginShape();
vertex(518,344);
vertex(map(mouseX,0, 600, 545, 555),map(mouseY, 0, 400, 300, 320));
vertex(510,333);
endShape(CLOSE);
 
 
fill(255,243,216);
beginShape();
vertex(519,344);
vertex(map(mouseX,0, 600, 545, 555),map(mouseY, 0, 400, 300, 320));
vertex(515,340);
endShape(CLOSE);

//sun and moon
fill(255,248,185);
ellipse(500,100,80,80);

fill(map(mouseX,0,600,33,142),map(mouseX, 0, 600, 48,193),map(mouseX, 0, 400,80,255));
ellipse(map(mouseX, 0, 600, 520, 700),100, 80, 80);

}
