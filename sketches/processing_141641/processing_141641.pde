
size(500,500);
background(255,255,255);

//gespa1//
strokeWeight(2);
stroke(0,255,0);
for (int i = 0; i < 500; i = i+1) {
  line(i, 500, i, random(380, 420));
}

//llumraig//
strokeWeight(3);
stroke(255,200,0);
line(250, 120, random(50, 450), random(50, 120));
line(250, 120, random(50, 450), random(50, 120));
line(250, 120, random(50, 450), random(50, 120));
line(250, 120, random(50, 450), random(50, 120));
line(250, 120, random(50, 450), random(50, 120));
line(250, 120, random(50, 450), random(50, 120));

//llum//
stroke(0,0,0);
fill(255,255,0);
ellipse(250, 150, 50, 100);

//cos//
noStroke();
fill(255,0,0);
rect(50, 250, 400, 150, 25);
ellipse(250, 250, 300, 250);

//rodes//
noStroke();
fill(0,0,0);
ellipse(150, 400, 80, 80);
ellipse(350, 400, 80, 80);

//logo//
fill(255,255,255);
rect(250, 300, 30, 30);
rect(310, 300, 30, 30);
rect(370, 300, 30, 30);

//lvidre//
fill(0,255,255);
rect(150, 180, 100, 80, 110, 5, 5, 5);


//portamaletes//
strokeWeight(4);
stroke(0,0,0);
line(260, 180, 350, 180);
line(260, 185, 350, 185);
line(260, 190, 350, 190);
line(260, 195, 350, 195);
line(260, 200, 350, 200);
line(260, 205, 350, 205);
line(260, 210, 350, 210);
line(260, 215, 350, 215);
line(260, 220, 350, 220);
line(260, 225, 350, 225);
line(260, 230, 350, 230);
line(260, 235, 350, 235);
line(260, 240, 350, 240);
line(260, 245, 350, 245);
line(260, 250, 350, 250);
line(260, 255, 350, 255);

//text//
fill(255,255,255);
textSize(38);
text("080",120,330);

//gespa2//
strokeWeight(1);
stroke(0,255,0);
for (int i = 0; i < 500; i = i+1) {
  line(i, 500, i, random(420, 450));
}


