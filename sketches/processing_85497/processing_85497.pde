

size(200,200);


background(0,0,0);


noStroke();
fill(255,255,255);
beginShape();
vertex(10,40);
vertex(90,10);
vertex(160,80);
vertex(90,200);
vertex(90,150);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(90,10,90,200);

stroke(255,235,3);
noFill();
triangle(10,40,160,80,90,150);




