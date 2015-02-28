

size(200,200);


background(255,255,255);


noStroke();
fill(0,0,0);
beginShape();
vertex(90,30);
vertex(140,60);
vertex(110,100);
vertex(60,140);
vertex(70,170);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(140,60,60,140);

stroke(255,235,3);
noFill();
triangle(90,30,110,100,70,170);




