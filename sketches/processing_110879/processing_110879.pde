
size(500, 500);
smooth();
background(#ffffff);


//ring
stroke(123,123,123);
strokeWeight(4);
ellipse(250, 85, 30,30);

//ear
fill(#bfbfbf);
rect(132,200, 20,30);
rect(347,200, 20,30);

rect(132,238, 20,30);
rect(347,238, 20,30);




//face
noStroke();
fill(#bfbfbf);
ellipse(250, 250, 220, 315);

//cheek
fill(#cccccc);
quad(181,225, 319,225, 272,386,  228, 386);
stroke(#494747);
strokeWeight(3);
line(250,200,  250,330);

//nose
line(250, 260, 230,280);
line(250, 260, 270, 280);



//eyebrow
noStroke();
fill(#494747);
arc(210, 250, 130, 160, 1.25*PI, 1.75*PI);
arc(290, 250, 130, 160, 1.25*PI, 1.75*PI);

//eye
stroke(#e2e1e0);
strokeWeight(3);
fill(#e8e7e6);
ellipse(210, 220, 55, 55);
ellipse(290, 220, 55, 55);

//iris
fill(#000000);
ellipse(210, 220, 15, 15);
ellipse(290, 220, 15, 15);







//mouth
strokeWeight(3);
stroke(255, 255, 255);
line(142, 330, 358, 330);
stroke(#919191);
line(162, 330, 338, 330);
noStroke();
fill(#494747);
quad(230,318,  270,318,   270,330,   230,330);



