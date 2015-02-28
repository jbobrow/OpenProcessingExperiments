
size(400,400);

background(224,226,215);

fill(248,209,104); //yellow box top
noStroke();
beginShape();
vertex(250,0);
vertex(375,0);
vertex(375,150);
vertex(250,150);
endShape(CLOSE);

fill(248,209,104); //yellow box bottom
noStroke();
beginShape();
vertex(0,300);
vertex(50,300);
vertex(50,500);
vertex(0,400);
endShape(CLOSE);

fill(250,0,0); //red box bottom
noStroke();
beginShape();
vertex(375,300);
vertex(400,300);
vertex(400,400);
vertex(375,400);
endShape(CLOSE);



fill(0); //black box left
strokeWeight(7);
beginShape();
vertex(50,250);
vertex(150,250);
vertex(150,354);
vertex(50,354);
endShape(CLOSE);

fill(0); //black box right
strokeWeight(7);
beginShape();
vertex(150,350);
vertex(250,350);
vertex(250,379);
vertex(150,379);
endShape(CLOSE);

stroke(0);
strokeWeight(7);
line(10,50,375,50);
line(375,10,375,385);
line(50,50,50,375);
line(100,10,100,350);
line(250,2,250,375);
line(10,150,375,150);
line(310,150,310,250);
line(50,250,375,250);
line(10,300,400,300);
line(150,350,375,350);
line(150,350,150,385);


fill(250,0,0); //red box top
beginShape();
vertex(50,50);
vertex(250,50);
vertex(250,250);
vertex(50,250);
endShape(CLOSE);

fill(19,30,156); //blue box bottom
beginShape();
vertex(250,300);
vertex(375,300);
vertex(375,375);
vertex(250,375);
endShape(CLOSE);


