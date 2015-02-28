
size(400, 500);
background(3, 173, 255);



//face
fill(240, 186, 213);
strokeWeight(3);
stroke(240, 186, 213);
ellipse(width/2, height/2, 170, 250);

//ears
ellipse(110,height/2,15,50);
ellipse(290,height/2,15,50);
stroke(240-30,186-30,213-30);
ellipse(110,height/2, 8,30);
ellipse(290,height/2, 8,30);
fill(240,186,213);
stroke(240,186,213);
rect(112,(height/2)-10,10,20);
rect(278,(height/2)-10,10,20);


//eyes
fill(255);
stroke(240,186,213);
ellipse(170,230,40,40);
ellipse(230,230,40,40);

fill(0);
stroke(0);
ellipse(170,240,10,10);
ellipse(230,220,10,10);

//mouth
fill(120,0,0);
stroke(240,186,213);
ellipse(200,325,80,20);


//nose
noFill();
stroke(0);
strokeWeight(3);
rect(200,270,10,30);
fill(240,186,213);
stroke(0,0,0,0);
rect(201,267,13,33);

//tongue
fill(0);
stroke(220,0,0);
fill(220,0,0);
ellipse(200,350,30,50);
rect(185,325,30,27);

stroke(0,0,0,40);
strokeWeight(2);
line(width/2,335,width/2,365);

//crest
fill(0);
stroke(0);
strokeWeight(1);
rect(185,110,30,60);

fill(0);
stroke(0);
beginShape();
vertex(185,110);
vertex(185+30,110);
vertex(185+15,110-20);
endShape();
