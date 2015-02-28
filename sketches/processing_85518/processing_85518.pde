
size(200,200);

background(255,255,255);

noStroke();
fill(0,0,0);
beginShape();
vertex(60,60);
vertex(100,60);
vertex(140,100);
vertex(100,140);
vertex(60,140);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(100,60,100,140);

stroke(255,235,3);
noFill();
triangle(60,60,140,100,60,140);




