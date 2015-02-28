
size(600,600);
background(255);

//The very left one of the black shapes
fill(0);
smooth();
beginShape();
vertex(400,300);
vertex(540,300);
vertex(540,520);
vertex(180,600);
vertex(60,600);
endShape();

fill(0);
smooth();
quad(140,440,180,420,40,600,20,600);

fill(0);
smooth();
triangle(0,600,340,0,380,0);

strokeWeight(5);
line(0,600,280,0);

fill(0);
smooth();
quad(100,200,140,260,0,580,0,500);

fill(70);
strokeJoin(BEVEL);
stroke(70);
smooth();
beginShape();
vertex(440,120);
vertex(480,120);
vertex(480,160);
vertex(520,160);
vertex(520,200);
vertex(480,200);
vertex(480,240);
vertex(440,240);
vertex(440,200);
vertex(400,200);
vertex(400,160);
vertex(440,160);
vertex(440,120);
endShape();


fill(70);
strokeJoin(ROUND);
stroke(70);
smooth();
beginShape();
vertex(380,20);
vertex(400,20);
vertex(400,40);
vertex(420,40);
vertex(420,60);
vertex(400,60);
vertex(400,80);
vertex(380,80);
vertex(380,60);
vertex(360,60);
vertex(360,40);
vertex(380,40);
vertex(380,20);
endShape();

fill(100);
noStroke();
quad(280,320,300,320,300,340,280,340);

fill(100);
noStroke();
quad(220,300,240,340,200,360,180,320);

fill(150);
noStroke();
triangle(0,0,140,0,0,440);

fill(70);
strokeJoin(ROUND);
stroke(70);
smooth();
beginShape();
vertex(60,80);
vertex(80,80);
vertex(80,100);
vertex(100,100);
vertex(100,120);
vertex(80,120);
vertex(80,140);
vertex(60,140);
vertex(60,120);
vertex(40,120);
vertex(40,100);
vertex(60,100);
vertex(60,80);
endShape();

fill(150);
noStroke();
triangle(600,540,600,600,340,600);

