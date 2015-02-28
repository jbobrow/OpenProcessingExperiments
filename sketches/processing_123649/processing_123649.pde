
size (400,400);

background(#47A2EA);


  frameRate(10);


  for (int j=0;j<1000;j++) {
    stroke(255, random(55, 255));
    strokeWeight(4);
    point(random(0, 400), random(0,400));
  }
  

strokeWeight(3);
stroke(0,0,255);
fill(255);

rect(195,15,10,370);
rect(15,195,370,10);

line (100,200,300,200);
line(200,100,200,300);

beginShape();
vertex(71,79);
vertex(79,71);
vertex(329,321);
vertex(321,329);
vertex(71,79);
endShape();

beginShape();
vertex(71,321);
vertex(79,329);
vertex(329,79);
vertex(321,71);
vertex(71,321);
endShape();

ellipse(200,200,80,80);

triangle(400,400,350,300,300,350);
triangle(370,370,320,270,270,320);

triangle(0,0,50,100,100,50);
triangle(30,30,80,130,130,80);

triangle(0,400,50,300,100,350);
triangle(30,370,80,270,130,320);

triangle(400,0,350,100,300,50);
triangle(370,30,320,130,270,80);

triangle(200,0,235.355,100,164.645,100);
triangle(200,400,235.355,300,164.645,300);
triangle(400,200,300,164.645,300,235.355);
triangle(0,200,100,164.645,100,235.355);
