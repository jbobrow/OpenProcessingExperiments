
size(500,500);
background(255);
//HILFSLINIEN

//line(250,0,250,500);
//line(0,250,500,250);


//GESICHTSFORM
fill(255,218,185,150);
stroke(255,218,185);
ellipse(250,250,230,290);
noFill();
noStroke();
//GESICHTSFORM


//AUGE LINKS

//LID
fill(199,21,133,200);
arc(200,180,40,50, radians(180), radians(360));
noFill();
//LID

//WEIß
fill(255,255,255,200);
arc(200,180,40,50, radians(0), radians(180));
noFill();
//WEIß

//LIDSTRICH
stroke(0);
line(165,180,220,180);
noStroke();
//LIDSTRICH

//LINSE
fill(65,105,225);
ellipse(200,190,10,15);
noFill();
//LINSE

//PUPILLE
fill(0);
ellipse(200,190,5,8);
noFill();
//PUPILLE

//AUGE LINKS


//AUGE RECHTS

//LID
fill(199,21,133,200);
arc(300,180,40,50, radians(180), radians(360));
noFill();
//LID

//WEIß
fill(255,255,255,200);
arc(300,180,40,50, radians(0), radians(180));
noFill();
//WEIß

//LIDSTRICH
stroke(0);
line(280,180,335,180);
noStroke();
//LIDSTRICH

//LINSE
fill(65,105,225);
ellipse(300,190,10,15);
noFill();
//LINSE

//PUPILLE
fill(0);
ellipse(300,190,5,8);
noFill();
//PUPILLE

//AUGE RECHTS

//MUND

fill(240,128,128);
stroke(240,128,128);
arc(250, 300, 80, 50, radians(-50), radians(230));
noFill();
noStroke();

stroke(205,92,92);
line(210,300,289,300);

//MUND
