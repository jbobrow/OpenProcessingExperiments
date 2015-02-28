

size(200,200);


background(255,255,255);


noStroke();
fill(0,0,0);
beginShape();
vertex(40,80);
vertex(140,60);
vertex(120,150);
vertex(60,140);
vertex(90,110);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(140,60,60,140);

stroke(255,235,3);
noFill();
triangle(40,80,120,150,90,110);




