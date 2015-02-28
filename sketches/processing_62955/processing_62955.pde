
//Workshop 2b


size(600, 600);
smooth();
background(255);

float val = 70;

//eyes
strokeWeight(2);
ellipse(215,142+val/2, 51,51);
fill(0);
ellipse(215,142+val/2, 26,26);

noFill();
ellipse(376,136+val/2, 44,44);
fill(255,0,0);
ellipse(379,138+val/2, 24+(val/10.0),24+(val/10.0));


//glasses
noFill();
strokeWeight(14);
quad(142,117, 273,106+val, 263,211, 151,218);
line(271,126+val, 339,124+val);
quad(338,105+val, 442,106, 446,199, 339,199);


//nose
beginShape();
fill(255);
strokeWeight(5);
vertex(287,143+val);
vertex(287-val,306);
vertex(320+val,306);
vertex(320,143+val);
endShape();

//mouth
strokeWeight(val);
rect(212,338, 195,16+(val+15));


//beard

strokeWeight(1);
for (int i=195; i<=424; i+=5) {
  line(i,405+val, i,410+val*2);
}


/*/ Workshop 1b

size(600, 600);
smooth();
background(255);

float val = 50;

//glasses
strokeWeight(14);
quad(142,117-val, 273,106+val, 263,211, 151,218);
line(271,126+val, 339,124+val);
quad(338,105+val, 442,106, 446+val,199-val, 339,199+val);

//eyes
//Right Eye
strokeWeight(2);
ellipse(215,142, 51+val,51+val);
fill(0);
ellipse(215,142, 26+val,26+val);
//Left Eye
noFill();
ellipse(376+val,136+val, 48-val,48-val);
fill(255,0,0);
ellipse(379+val,138, 24-val,24-val);

//nose
beginShape();
fill(255);
vertex(287,143);
vertex(287,306);
vertex(320+(val*4),306-val);
vertex(320,143);
endShape();

//mouth
beginShape();
line(429,338-val, 212,338);
line(212,338, 212,352);
line(212,352, 429,353+(val*2));
endShape();

/*
//beard
line(195,406, 183-val,412);
line(206,412, 200,420+(val/2));
line(212,420, 212,430+val);
line(230,434, 230,442);
line(231,436, 233,444);
line(248,440, 242,449+val);
line(267,438, 267,449+val);
line(287,444, 290,459+val);

line(312,444+val, 309+val,459+val);
line(316,442+val, 321+val,449+val);
line(331,438, 335,449+val);
line(342,438+val, 342,442+val);

line(356,434+val, 356,444+val);
line(362,438+val, 365,446+val);
line(370,434+val, 374,442+val);
line(375,425+val, 379,434);
line(393,425+val, 401,439);
line(401,425, 404,432);
line(404,412, 414,425);
line(414,406, 422,412);
line(414,396, 428,398);
line(418,385, 429,388);
line(418,376, 429,376);
line(421,361, 429,367);
*/





