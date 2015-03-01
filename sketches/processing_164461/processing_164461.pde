
size(400,350);
background(75,90,15);
fill(50);
beginShape();
vertex(50,50);
vertex(100,50);
vertex(100,100);
vertex(75,125);
vertex(50,100);
endShape(CLOSE);

noFill();
strokeWeight(5);
stroke(15,75,90);
beginShape();
vertex(50,200);
vertex(300,200);
vertex(350,250);
vertex(300,300);
vertex(50,300);
endShape();

fill(75,15,90);
strokeWeight(3);
noStroke();
beginShape();
//exterior - clockwise
vertex(350,50);
vertex(200,50);
vertex(175,75);
vertex(200,100);
vertex(350,100);
//interior - counterclockwise
beginContour();
vertex(345,90);
vertex(200,90);
vertex(185,75);
vertex(200,60);
vertex(345,60);
endContour();
endShape(CLOSE);

fill(255,0,0);
textSize(20);
textAlign(RIGHT,CENTER);
text("chevrons",330,75);


