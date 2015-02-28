
color ojo= color(255,0,0);
color vendas= color(215,214,155);
int dis=250;
color cuerpo= color(64,35,22);
int sep=580;
color ropa=color(0);


size(800,450);

//vendapie

strokeWeight(5);
stroke(161,160,112);
fill(vendas);
quad(25,353,69,353,60,373,10,373);

//vendapie2

strokeWeight(5);
stroke(161,160,112);
fill(vendas);
quad(25+dis,353,69+dis,353,60+dis,373,10+dis,373);

//cuerpo

smooth();
noStroke();
fill(64,35,22);
ellipse(120,150,130,130);

stroke(64,35,22);
strokeWeight(75);
line(115,200,115,290);

strokeWeight(35);
line(130,300,175,360);

strokeWeight(35);
line(110,300,70,360);

strokeWeight(35);
line(110,230,195,230);

//cuerpo2
smooth();
noStroke();
fill(cuerpo);
ellipse(120+dis,150,130,130);

stroke(cuerpo);
strokeWeight(75);
line(115+dis,200,115+dis,290);

strokeWeight(35);
line(130+dis,300,175+dis,360);

strokeWeight(35);
line(110+dis,300,70+dis,360);

strokeWeight(35);
line(110+dis,230,195+dis,230);

//cuerpo3

smooth();
noStroke();
fill(242,223,191);
ellipse(110+sep,150,130,130);

stroke(242,223,191);
strokeWeight(33);
line(35+sep,205,110+sep,205);

strokeWeight(33);
line(55+sep,255,110+sep,255);



stroke(ropa);
strokeWeight(35);
line(130+sep,298,160+sep,360);

strokeWeight(35);
line(100+sep,300,70+sep,360);






strokeCap(SQUARE);
strokeWeight(75);
line(115+sep,199,115+sep,290);

strokeWeight(33);
line(35+sep,205,130+sep,205);

strokeWeight(33);
line(55+sep,255,110+sep,255);

strokeWeight(12);
stroke(240);
line(70+sep,185,70+sep,200);
line(90+sep,185,90+sep,200);
line(110+sep,185,110+sep,200);
line(77+sep,230,85+sep,230);

line(77+sep,255,95+sep,255);


noStroke();
fill(240);
arc(82+sep,222,19,19,0.0,3.14);

//boca

noStroke();
fill(255);
arc(120,150,130,130,0.31,0.94);

//boca2
noStroke();
fill(255);
arc(120+dis,150,130,130,0.31,0.94);

//dientes
stroke(0);
strokeWeight(3);
line(170,189,165,165);
line(165,165,150,189);
line(149,189,145,154);

//dientes2
stroke(0);
strokeWeight(3);
line(170+dis,189,165+dis,165);
line(165+dis,165,150+dis,189);
line(149+dis,189,145+dis,154);

//vendas

strokeWeight(5);
stroke(161,160,112);
fill(vendas);
quad(65,100,165,90,173,107,50,130);

quad(45,146,180,118,185,130,51,163);

quad(45,176,185,143,187,155,51,193);

beginShape();
vertex(185,249);
vertex(200,249);
vertex(200,275);
vertex(160,275);
vertex(160,260);
vertex(185,260);
endShape(CLOSE);
quad(180,210,200,210,200,250,182,250);
quad(165,210,185,210,185,250,167,250);
quad(75,270,150,250,150,285,75,290);
quad(75,250,150,250,150,265,75,270);
quad(76,216,150,249,150,270,76,226);
quad(75,205,150,205,150,210,75,230);

quad(77,305,155,300,165,315,112,330);
quad(129,328,172,327,186,345,143,345);
quad(149,360,187,345,193,362,160,370);

quad(65,330,109,330,100,350,50,350);

//vendas2

strokeWeight(5);
stroke(161,160,112);
fill(vendas);
quad(65+dis,100,165+dis,90,173+dis,107,50+dis,130);

quad(45+dis,146,180+dis,118,185+dis,130,51+dis,163);

quad(45+dis,176,185+dis,143,187+dis,155,51+dis,193);

beginShape();
vertex(185+dis,249);
vertex(200+dis,249);
vertex(200+dis,275);
vertex(160+dis,275);
vertex(160+dis,260);
vertex(185+dis,260);
endShape(CLOSE);
quad(180+dis,210,200+dis,210,200+dis,250,182+dis,250);
quad(165+dis,210,185+dis,210,185+dis,250,167+dis,250);
quad(75+dis,270,150+dis,250,150+dis,285,75+dis,290);
quad(75+dis,250,150+dis,250,150+dis,265,75+dis,270);
quad(76+dis,216,150+dis,249,150+dis,270,76+dis,226);
quad(75+dis,205,150+dis,205,150+dis,210,75+dis,230);

quad(77+dis,305,155+dis,300,165+dis,315,112+dis,330);
quad(129+dis,328,172+dis,327,186+dis,345,143+dis,345);
quad(149+dis,360,187+dis,345,193+dis,362,160+dis,370);

quad(65+dis,330,109+dis,330,100+dis,350,50+dis,350);


//ojo

stroke(117,54,43);
fill(ojo);
ellipse(150,138,20,20);

//ojo2

stroke(117,54,43);
fill(ojo);
ellipse(150+dis,138,20,20);

//pelo
smooth();
noStroke();
fill(0);
triangle(30+sep,143,58+sep,111,55+sep,143);
arc(110+sep,150,130,130,0+PI,TWO_PI+QUARTER_PI);
triangle(151+sep,200,175+sep,200,160+sep,180);

strokeWeight(5);
stroke(255);
line(60+sep,110,120+sep,110);
line(60+sep,120,130+sep,120);
line(60+sep,130,140+sep,130);

noStroke();
fill(242,223,191);
triangle(57+sep,150,85+sep,110,57+sep,150);
triangle(60+sep,155,90+sep,100,95+sep,155);
triangle(45+sep,150,60+sep,130,63+sep,155);
triangle(95+sep,150,110+sep,110,112+sep,155);
ellipse(122+sep,165,30,30);

//ojo3
noStroke();
fill(255);
arc(82+sep,150,28,28,0.0,3.14);

strokeWeight(2);
stroke(0);
fill(207,189,64);
arc(82+sep,150,15,15,0.0,3.14);

fill(0);
arc(82+sep,150,5,5,0.0,3.14);

strokeWeight(4);
stroke(0);
line(65+sep,150,85+sep,143);

//camisa

strokeWeight(12);
stroke(240);
line(130+sep,195,155+sep,195);

//pistolas

strokeWeight(25);
stroke(150);
line(5+sep,165,5+sep,220);
line(25+sep,240,25+sep,290);

strokeWeight(15);
line(-50+sep,225,22+sep,225);
line(-30+sep,245,40+sep,245);

strokeWeight(6);
line(sep,240,sep,266);
line(sep,263,sep+8,263);

line(-20+sep,205,-20+sep,231);
line(-22+sep,207,-12+sep,207);
