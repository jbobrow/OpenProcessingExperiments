
int mida=20;
float llarg;
void setup(){
size (450,450);
background(0,255);


 

}
void draw(){





stroke(10,10,215);
strokeWeight(10);
line(15,0,mouseX,mouseY);

stroke(20,20,225);
strokeWeight(10);
line(25,0,mouseX,mouseY);

stroke(30,30,235);
strokeWeight(10);
line(35,0,mouseX,mouseY);

stroke(40,40,245);
strokeWeight(10);
line(45,0,mouseX,mouseY);



stroke(60,60,255);
strokeWeight(10);
line(60,0,mouseX,mouseY);

stroke(60,40,255);
strokeWeight(10);
line(70,0,mouseX,mouseY);

stroke(60,20,255);
strokeWeight(10);
line(80,0,mouseX,mouseY);

stroke(60,0,255);
strokeWeight(10);
line(90,0,mouseX,mouseY);



stroke(55,10,255);
strokeWeight(10);
line(105,0,mouseX,mouseY);

stroke(50,20,255);
strokeWeight(10);
line(115,0,mouseX,mouseY);

stroke(45,30,255);
strokeWeight(10);
line(125,0,mouseX,mouseY);

stroke(40,40,255);
strokeWeight(10);
line(135,0,mouseX,mouseY);



stroke(50,40,245);
strokeWeight(10);
line(150,0,mouseX,mouseY);

stroke(60,40,235);
strokeWeight(10);
line(160,0,mouseX,mouseY);

stroke(70,40,225);
strokeWeight(10);
line(170,0,mouseX,mouseY);

stroke(80,40,215);
strokeWeight(10);
line(180,0,mouseX,mouseY);



stroke(80,50,225);
strokeWeight(10);
line(195,0,mouseX,mouseY);

stroke(80,60,225);
strokeWeight(10);
line(205,0,mouseX,mouseY);

stroke(80,70,225);
strokeWeight(10);
line(215,0,mouseX,mouseY);

stroke(80,80,225);
strokeWeight(10);
line(225,0,mouseX,mouseY);



stroke(80,100,200);
strokeWeight(10);
line(240,0,mouseX,mouseY);

stroke(70,120,200);
strokeWeight(10);
line(250,0,mouseX,mouseY);

stroke(60,140,200);
strokeWeight(10);
line(260,0,mouseX,mouseY);

stroke(50,160,200);
strokeWeight(10);
line(270,0,mouseX,mouseY);



stroke(50,180,200);
strokeWeight(10);
line(285,0,mouseX,mouseY);

stroke(50,200,200);
strokeWeight(10);
line(295,0,mouseX,mouseY);

stroke(50,220,200);
strokeWeight(10);
line(305,0,mouseX,mouseY);

stroke(50,200,200);
strokeWeight(10);
line(315,0,mouseX,mouseY);



stroke(50,180,200);
strokeWeight(10);
line(330,0,mouseX,mouseY);

stroke(50,160,200);
strokeWeight(10);
line(340,0,mouseX,mouseY);

stroke(60,140,200);
strokeWeight(10);
line(350,0,mouseX,mouseY);

stroke(70,120,200);
strokeWeight(10);
line(360,0,mouseX,mouseY);


stroke(80,100,200);
strokeWeight(10);
line(375,0,mouseX,mouseY);

stroke(80,80,225);
strokeWeight(10);
line(385,0,mouseX,mouseY);

stroke(80,70,225);
strokeWeight(10);
line(395,0,mouseX,mouseY);

stroke(80,60,225);
strokeWeight(10);
line(405,0,mouseX,mouseY);


stroke(80,50,225);
strokeWeight(10);
line(420,0,mouseX,mouseY);

stroke(75,40,230);
strokeWeight(10);
line(430,0,mouseX,mouseY);

stroke(70,40,235);
strokeWeight(10);
line(440,0,mouseX,mouseY);

stroke(75,40,240);
strokeWeight(10);
line(450,0,mouseX,mouseY);


//cara

noStroke();
strokeWeight(0);
fill(190,180,180);
rect(100, 200, 150, 200);
triangle(175, 350, 310, 425, 40, 425);
rect(310, 425, -270, 425);
ellipse(175, 200, 150, 150);
ellipse(100, 250, 55, 80);
ellipse(250, 250, 55, 80);
ellipse(175, 160, 55, 80);
ellipse(175, 160, 10, 240);
ellipse(175, 40, 15, 15);


noStroke();
strokeWeight(0);
fill(0,0,0);
ellipse(110, 250, 55, 70);
ellipse(240, 250, 55, 70);
rect(100, 216, 150, 68);

noStroke();
strokeWeight(0);
fill(255,255,255);
ellipse(134, 250, 80, 80);
ellipse(216, 250, 80, 80);

noStroke();
strokeWeight(0);
fill(190,180,180);
rect(100, 216, 150, -10);
rect(100, 284, 150, 68);

noStroke();
strokeWeight(0);
fill(0,0,0);
rect(214, 248, 10, 10);
rect(134, 248, 10, 10);

stroke(0,0,0);
strokeWeight(4);
ellipse(144, 340, 80, 75);
ellipse(206, 340, 80, 75);

noStroke();
strokeWeight(0);
fill(255,255,255);
ellipse(144, 340, 80, 75);
ellipse(206, 340, 80, 75);
noStroke();
rect(145, 302, 60, 75);

stroke(0,0,0);
strokeWeight(4);
line(145,302,145,377);
line(185,302,185,377);
line(165,302,165,377);
line(205,302,205,377);
line(145,302,145,377);

line(125,307,125,372);
line(225,307,225,372);

line(145,302,205,302);
line(145,377,205,377);

line(106,327,244,327);
line(106,352,244,352);




stroke(100,100,100,100);
strokeWeight(6);
line(100,290,250,290);
strokeWeight(3);
line(100,210,250,210);

fill(0,13);
rect(0,0,width,height);

stroke(255);
noFill();
llarg = mouseX*0.15;

stroke(255);
line(mouseX-llarg,mouseY-llarg,mouseX+llarg,mouseY+llarg);
line(mouseX-llarg,mouseY+llarg,mouseX+llarg,mouseY-llarg);
}


