
size(600,600);
background(255);

fill(200);
beginShape();
vertex(0,300);
vertex(0,600);
vertex(420,600);
endShape();

beginShape();
vertex(0,160);
vertex(0,220);
vertex(440,600);
endShape();
noFill();

fill(120);
beginShape();
vertex(0,0);
vertex(0,160);
vertex(440,600);
endShape();
noFill();

fill(80);
beginShape();
vertex(0,0);
vertex(140,0);
vertex(440,600);
endShape();
noFill();


fill(240);
beginShape();
vertex(0,220);
vertex(0,300);
vertex(440,600);
endShape();
noFill();

fill(0);
ellipse(100,300,70,70);
quad(200,260,240,260,240,300,200,340);
noFill();

fill(150);
triangle(44,60,200,180,176,240);
noFill();



strokeWeight(2);
ellipse(400,400,70,70);


triangle(200,100,260,100,260,200);

line(440,600,140,0);
line(440,600,0,0);
line(440,600,0,160);
line(440,600,0,220);

fill(80);
beginShape();
vertex(500,0);
vertex(500,140);
vertex(300,140);
vertex(300,280);
vertex(500,280);
vertex(500,460);
vertex(600,460);
vertex(600,0);
endShape();
ellipse(0,600,400,400);
noFill();

fill(255);
triangle(240,200,260,240,220,240);
noFill();

fill(180);
rect(260,300,120,80);

noFill();

strokeWeight(20);
line(420,600,0,300);
noStroke();


