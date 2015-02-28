
size(500,500);

background(#2EFCE3);

fill(#FF6200);
rect(0,0,100,100);
rect(400,0,100,100);
rect(0,400,100,100);
rect(400,400,100,100);

fill(#48FC2E);
ellipse(100,100,100,100);
ellipse(400,400,100,100);
ellipse(100,400,100,100);
ellipse(148,347,44,44);
ellipse(200,300,100,100);

ellipse(300,200,100,100);
ellipse(347,148,44,44);
ellipse(400,100,100,100);

beginShape();
vertex(0,250);
vertex(250,0);
vertex(250,500);
vertex(500,250);
endShape();

fill(#0262D3);
beginShape();
vertex(50,150);
vertex(150,50);
vertex(200,250);
vertex(250,200);
endShape();

fill(#0262D3);
beginShape();
vertex(350,450);
vertex(450,350);
vertex(250,300);
vertex(300,250);
endShape();

strokeWeight(9);
stroke(#0262D3);
point(250,250);
strokeWeight(1);
line(0,500,500,0);
