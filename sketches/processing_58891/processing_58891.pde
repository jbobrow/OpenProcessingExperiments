
size(400, 400);
smooth();
colorMode(HSB, 360, 100, 100, 100);

//background
background(#92A8BF);

// body
fill(90,90,60);// medium green yellow: #549B0E
stroke(90,90,40);
strokeWeight(10);
ellipse(200, 400, 600, 440);

// head
strokeWeight(7);
ellipse(200, 200, 240, 320);

// eyelid
strokeWeight(5);
ellipse(200, 160, 120, 140);
// eye whites (sclera)
fill(90,5,90);
ellipse(200, 160, 110, 90);
// eye color (iris)
fill(210, 80, 90);
stroke(90, 10, 90, 50);
ellipse(200, 160, 70, 70);
// eye black (pupil)
fill(210, 90, 30);
stroke(210, 90, 30, 50);
ellipse(200, 160, 30, 30);
// eye highlight
fill(90,5,100);
stroke(90, 10, 100, 50);
strokeWeight(3);
ellipse(210, 150, 10, 10);

// mouth black
fill(90,90,10);
stroke(90,90,40);
strokeWeight(5);
ellipse(200, 290, 140, 80);

// tongue pink
stroke(350, 60, 100);
strokeWeight(40);
line(180, 310, 170, 340);
// tongue shadow
stroke(350, 60, 10, 10);
line(180, 310, 175, 325);
stroke(350, 60, 10, 10);
line(180, 310, 178, 313);
fill(90,90,10, 60);
noStroke();
ellipse(200, 290, 120, 57);

// teeth
fill(90,5,100);
stroke(90, 10, 100, 50);
strokeWeight(3);
rect(174, 267, 10, 16);
rect(188, 270, 10, 15);
rect(202, 270, 10, 15);
rect(216, 267, 10, 16);

// gums
fill(350, 60, 100);
stroke(350, 60, 100, 50);
ellipse(200, 263, 70, 15);




