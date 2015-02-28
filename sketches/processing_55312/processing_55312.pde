
size(500,600);
background(206,213,237);
smooth();


fill(255);
strokeWeight(5);
ellipse(250,180,100,100); //head
strokeWeight(2);  //change strokeweight
ellipse(230,183,30,30); //left eye
ellipse(270,183,30,30); //right eye
strokeWeight(5); //change strokeweight
point(236,186);  //eyeball left
point(264,179);  //eyeball right

strokeWeight(1);
rect(236,208,30,5);

strokeWeight(2);  //change strokeweight 
line(250,130,250,70);  //antane on top of head
strokeWeight(20);
point(250,70);

strokeWeight(0.8);
noFill();
ellipse(250,70,35,35);
ellipse(250,70,42,42);
ellipse(250,70,50,50);

//arms
strokeWeight(15);
noFill();
//ellipse(250,160,350,300);
arc(250,160,350,300,radians(111),radians(150));
arc(250,160,350,300,radians(389),radians(450));

//legs
fill(0);
strokeWeight(2);
point(250,490);
ellipse(250,493,45,74);

//body
strokeWeight(5);
fill(255);
quad(180,240,320,240,285,450,215,450);


//heart
smooth();
noStroke();
fill(229,28,78);
beginShape();
vertex(290, 270);
bezierVertex(290, 245, 330, 260, 290, 295);
vertex(290, 270);
bezierVertex(290, 245, 250, 260, 290, 295);
endShape();




