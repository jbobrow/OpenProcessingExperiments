

size(200,200);


background(255,255,255);


noStroke();
fill(0,0,0);
beginShape();
vertex(90,60);
vertex(180,50);
vertex(170,130);
vertex(20,150);
vertex(30,130);
vertex(100,100);
endShape(CLOSE);

stroke(255,3,3);
line(180,50,20,150);

stroke(255,235,3);
noFill();
triangle(90,60,170,130,30,130);




