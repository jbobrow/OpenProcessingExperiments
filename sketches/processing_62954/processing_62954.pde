
//Workshop 2b


size(600, 600);
smooth();
background(255);

float val = 100;

//glasses
strokeWeight(14);
quad(142,117, 273,106, 263,211, 151,218);
line(271,126, 339,124);
quad(338,105, 442,106, 446,199, 339,199);

//eyes
strokeWeight(2);
ellipse(215,142, 51,51);
fill(0);
ellipse(215,142, 26,26);
noFill();
ellipse(376,136, 48,48);

fill(255,0,0);
ellipse(379,138, 24+(val/10.0),24+(val/10.0));

//nose
beginShape();
noFill();
vertex(287,143);
vertex(287,306);
vertex(320,306);
vertex(320,143);
endShape();

//mouth
rect(212,338, 200,16);


//beard

strokeWeight(1);
for (int i=195; i<=438; i+=5) {
  line(i,405, i,410);
}



