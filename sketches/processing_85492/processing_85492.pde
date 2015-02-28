

size(200,200);


background(255,255,255);


noStroke();
fill(0,0,0);
beginShape();
vertex(10,10);
vertex(90,10);
vertex(160,190);
vertex(90,200);
vertex(40,180);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(90,10,90,200);

stroke(255,235,3);
noFill();
triangle(10,10,160,190,40,180);




