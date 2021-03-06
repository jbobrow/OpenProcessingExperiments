
void setup(){
  size(480,650);
}
void draw(){
  strokeWeight(2);
  //cara
fill(#EFDBCA);
beginShape();
vertex(100,200);
vertex(100,300);
vertex(110,350);
vertex(130,450);
vertex(180,500);
vertex(220,510);
vertex(250,515);
vertex(280,510);
vertex(300,500);
vertex(350,450);
vertex(390,300);
vertex(390,200);
endShape();


//banda
fill(#1D3289);
rect(97,125,295,80);
fill(#AEABAB);
rect(150,140,200,50);

//pelo
fill(0);
beginShape();
vertex(97,126);
vertex(68,140);
vertex(97,110);
vertex(60,100);
vertex(100,90);
vertex(78,50);
vertex(120,60);
vertex(130,10);
vertex(160,40);
vertex(170,20);
vertex(180,40);
vertex(200,10);
vertex(220,40);
vertex(240,5);
vertex(260,30);
vertex(280,10);
vertex(300,40);
vertex(330,10);
vertex(350,40);
vertex(380,20);
vertex(390,50);
vertex(420,50);
vertex(390,80);
vertex(425,85);
vertex(390,110);
vertex(430,130);
vertex(390,140);
vertex(390,125);
endShape();

//ojos
fill(255,255,255);
//ojo izquierdo
ellipse(175,260,70,40);
fill(#951717);
ellipse(175,260,30,30);
//sharingan
ellipse(175,260,12,12);
fill(0);
ellipse(172,266,4,4);
ellipse(170,255,4,4);
ellipse(180,256,4,4);

//ojo derecho
fill(255,255,255);
ellipse(310,260,70,40);
fill(#951717);
//sharingan
ellipse(310,260,30,30);
ellipse(310,260,12,12);
fill(0);
ellipse(308,266,4,4);
ellipse(305,255,4,4);
ellipse(316,256,4,4);

//oreja derecha
fill(#EFDBCA);
arc(394, 230, 50, 80, 0, HALF_PI);
arc(405, 220, 35, 50, PI+QUARTER_PI, TWO_PI);

//oreja izquierda
fill(#EFDBCA);
arc(95, 230, 50, 80, HALF_PI, PI);
arc(85, 220, 35, 50, PI, TWO_PI-QUARTER_PI);

//konoha
noFill();
ellipse(245,165,40,40);
ellipse(245,165,20,20);
ellipse(155,180,5,5);
ellipse(155,165,5,5);
ellipse(155,150,5,5);
ellipse(345,180,5,5);
ellipse(345,150,5,5);
ellipse(345,165,5,5);
triangle(215, 175, 225, 165, 230,180 );

//nariz

line(245,290,235,345);
line(235,345,245,355);
//boca
beginShape();
fill(255,255,255);
vertex(205,400);
vertex(195,410);
vertex(205,420);
vertex(230,425);
vertex(245,425);
vertex(260,425);
vertex(280,420);
vertex(290,410);
vertex(280,400);
vertex(205,400);
vertex(205,400);
vertex(205,420);
endShape();
//dientes
beginShape();
vertex(230,400);
vertex(230,423);
endShape();
beginShape();
vertex(255,400);
vertex(255,423);
endShape();
beginShape();
vertex(275,400);
vertex(275,420);
endShape();
beginShape();
vertex(205,410);
vertex(285,410);
endShape();

//cejas
fill(0);
triangle(140, 230, 160, 220, 210,235 );
triangle(270, 235, 330, 220,340,235 );








}



