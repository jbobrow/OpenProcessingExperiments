
size(500, 500);
background(200, 90, 10);


fill(100, 90, 70);
stroke(10, 200, 80);
strokeWeight(1);
beginShape(TRIANGLE_FAN);
vertex(30, 30);
vertex(60, 130);
vertex(60, 190); 
vertex(30, 190);
endShape(CLOSE);


beginShape(TRIANGLE_STRIP);
vertex(100, 200);
vertex(120, 150);
vertex(250, 170);
vertex(110, 190);
vertex(170, 200);
vertex(220, 150);
endShape();


beginShape(TRIANGLE_FAN);
fill(10, 10, 10);
vertex(300, 300);
vertex(310, 150);
fill(100, 100, 100); 
vertex(350, 180);
vertex(400, 140);
vertex(450, 200);
fill(255, 20, 20);
vertex(300, 300);
endShape();

beginShape(TRIANGLE_STRIP);
fill(100, 10, 10);
vertex(300, 450);
vertex(310, 300);
fill(210, 160, 10); 
vertex(350, 330);
vertex(400, 290);
vertex(450, 350);
vertex(300, 350);
endShape();







