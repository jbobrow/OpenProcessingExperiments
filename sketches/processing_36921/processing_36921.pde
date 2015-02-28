
//My first program
//Rayniel Estrella

size(600,600);
smooth();
strokeWeight(4);
//source: http://processing.org/colors
fill(255,0,0,50); //grayscale 0-255 //rgb values 0-255
ellipse(100,200,50,50);

stroke(0,255,0);
line(10,100,250,400);
noFill();
//noStroke();
rect(400,100,35,35);

beginShape();
vertex(10,10);
vertex(100,10);
vertex(10,250);
vertex(10,10);
endShape();

textSize(100);
text("hello",100,100);

