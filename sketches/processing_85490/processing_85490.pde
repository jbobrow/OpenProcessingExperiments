

size(200,200);


background(0,0,0);


noStroke();
fill(255,255,255);
beginShape();
vertex(10,10);
vertex(180,50);
vertex(160,190);
vertex(20,150);
vertex(40,180);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(180,50,20,150);

stroke(255,235,3);
noFill();
triangle(10,10,160,190,40,180);




