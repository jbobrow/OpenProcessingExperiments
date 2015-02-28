
//String[] fontlist = Pfont.list();
//println(fontList);

PFont myFont;
PFont tryFont;

void setup(){
background(216,207,181);
size(500, 800);

//myFont = createFont("Helvetica",60,true);
  tryFont = loadFont("Impact-48.vlw");
  
    smooth();
}

void draw(){
fill(0);
ellipse(200,25,75,45);
ellipse(175,165,175,125);
ellipse(185,450,250,200);
ellipse(370,40,25,25);
ellipse(505,50,40,40);
ellipse(315,225,75,60);
ellipse(310,320,50,45);
ellipse(85,535,85,70);
ellipse(315,425,115,100);
ellipse(425,435,30,30);
ellipse(50,650,50,50);
ellipse(50,650,50,50);
ellipse(160,655,65,65);
ellipse(395,520,38,38);
ellipse(430,750,35,35);

beginShape();
vertex(500,115);
vertex(480,120);
vertex(500,135);
endShape(CLOSE);

fill(255,0,0);
ellipse(170,770,35,32);

beginShape();
curveVertex(200,100);
curveVertex(200,100);
vertex(200,100);
vertex(200,225);
curveVertex(200,100);
curveVertex(200,100);
endShape(CLOSE);

beginShape();
curveVertex(115,690);
curveVertex(115,690);
curveVertex(140,700);
curveVertex(200,715);
curveVertex(200,715);
vertex(200,715);
vertex(85,765);
vertex(167,770);
endShape(CLOSE);

fill(#1626C9,225);
ellipse(0,350,35,50);
ellipse(0,475,35,50);

beginShape();
vertex(0,140);
vertex(30,130);
vertex(75,50);
vertex(95,125);
vertex(175,150);
vertex(100,185);
vertex(75,300);
vertex(60,200);
vertex(0,225);
vertex(0,200);
vertex(40,175);
vertex(0,150);
endShape(CLOSE);

strokeWeight(4);
line(200,25,185,450);
line(317,225,312,320);
line(317,225,312,320);
line(375,0,370,45);
line(400,0,500,50);
line(300,85,370,155);
line(300,150,375,85);
line(302,115,375,120);
line(340,75,330,160);
line(450,200,500,252);
line(425,250,500,257);
line(435,315,500,260);
line(490,340,500,250);
line(415,430,500,475);

noFill();
beginShape();
curveVertex(300,640);
curveVertex(175,585);
curveVertex(85,600);
curveVertex(45,650);
curveVertex(75,725);
curveVertex(200,745);
curveVertex(260,730);
curveVertex(285,685);
curveVertex(275,645);
curveVertex(240,622);
curveVertex(190,627);
curveVertex(160,655);
curveVertex(150,725);
endShape();

beginShape();
curveVertex(500,485);
curveVertex(500,485);
curveVertex(350,525);
curveVertex(240,625);
curveVertex(265,735);
curveVertex(400,750);
curveVertex(500,742);
curveVertex(500,742);
endShape();

fill(0,155,0);
textFont(tryFont);
  text("Look at me!",80,445);
  text("I made my own miro!",80,525);
  text("9",460,782);
}

