
void setup(){
  size(600,600);
  background(#834869);
}
 
void draw(){

println(mouseX+","+mouseY);
  //cabeza
fill(#CC9966);
beginShape();
vertex(430,258);
vertex(430,290);
vertex(395,395);
vertex(365,459);
vertex(250,495);
vertex(135,459);
vertex(105,395);
vertex(70,290);
vertex(70,258);
vertex(70,85);
vertex(430,85);
vertex(430,258);
endShape();

//ulls;
stroke (3);
fill (255);
ellipse (175, 200, 85, 70);
ellipse (325, 200, 85, 70);
fill (178, 137, 91);
ellipse (175, 200, 55, 70);
ellipse (325, 200, 55, 70);
fill (0);
ellipse (175, 200, 25, 40);
ellipse (325, 200, 25, 40);

//orejas
//derecha
fill(#CC9966);
arc(430, 250, 50, 80, 0, HALF_PI);
arc(440, 195, 35, 30, PI+QUARTER_PI, TWO_PI);
line(454,250,457,195);
//rellenoOrejaDerecha
strokeWeight (3);
stroke (0);
stroke(#CC9966);
line (430, 187, 430, 285);
fill(#CC9966);
noStroke();
beginShape();
vertex(457,195);
vertex(430,187);
vertex(430,250);
vertex(454,250);
vertex(457,195);
endShape();
 
//izquierda  
strokeWeight (3);
stroke (0);
stroke(#CC9966);
line (68, 184, 71, 283);
line (69, 184, 71, 284);
line (70, 184, 71, 285);
line (71, 184, 71, 286);
stroke(#000000);
arc(70, 250, 50, 80, HALF_PI, PI);
arc(60, 195, 35, 30, PI, TWO_PI-QUARTER_PI);
line(44, 250,42,195);
//rellenoOrejaIzquierda
fill(#CC9966);
noStroke();
beginShape();
vertex(43,194);
vertex(68,190);
vertex(70,250);
vertex(46,250);
vertex(43,194);
endShape();

//Boca
fill(0);
line(250, 350, 125, 150);
ellipse(250, 350, 150 , 150);
fill(#CC9966);
arc(250, 350, 150, 250,PI,TWO_PI);

//nariz;
strokeWeight (3);
stroke (0);
line (250, 235, 285, 296);
line (285, 296, 267, 304);
line (267, 304, 247, 304);

//CABELLS
fill(#000000);
stroke(0);
triangle(78,50,95,20,115,50);
triangle(115,50,135,20,155,50);
triangle(155,50,175,20,195,50);
triangle(195,50,215,20,235,50);
triangle(235,50,255,20,275,50);
triangle(275,50,295,20,315,50);
triangle(315,50,335,20,355,50);
triangle(355,50,375,20,395,50);
triangle(395,50,410,20,423,50);
//cabell de darrera
triangle(95,50,115,20,135,50);
triangle(135,50,155,20,175,50);
triangle(175,50,195,20,215,50);
triangle(215,50,235,20,255,50);
triangle(255,50,275,20,295,50);
triangle(295,50,315,20,335,50);
triangle(335,50,355,20,375,50);
triangle(375,50,395,20,415,50);

rect (95,50,2,95);
rect (90,50,2,100);
rect (85,50,2,105);
rect (80,50,2,110);
rect (75,50,2,115);
rect (70,50,2,120); 

rect (100,50,2,95);
rect (105,50,2,95);
rect (110,50,2,95);
rect (115,50,2,95);
rect (120,50,2,95);
rect (125,50,2,95);
rect (130,50,2,95);
rect (135,50,2,95);
rect (140,50,2,95);
rect (145,50,2,95);
rect (150,50,2,95);
rect (155,50,2,95);
rect (160,50,2,95);
rect (165,50,2,95);
rect (170,50,2,95);
rect (175,50,2,95);
rect (180,50,2,95);
rect (185,50,2,95);
rect (190,50,2,95);
rect (195,50,2,95);
rect (200,50,2,95);
rect (305,50,2,95);
rect (310,50,2,95);
rect (315,50,2,95);
rect (320,50,2,95);
rect (325,50,2,95);
rect (330,50,2,95);
rect (335,50,2,95);
rect (340,50,2,95);
rect (345,50,2,95);
rect (350,50,2,95);
rect (355,50,2,95);
rect (360,50,2,95);
rect (365,50,2,95);
rect (370,50,2,95);
rect (375,50,2,95);
rect (380,50,2,95);
rect (385,50,2,95);
rect (390,50,2,95);
rect (395,50,2,95);
rect (400,50,2,95);
rect (205,50,2,95);
rect (210,50,2,95);
rect (215,50,2,95);
rect (220,50,2,95);
rect (225,50,2,95);
rect (230,50,2,95);
rect (235,50,2,95);
rect (240,50,2,95);
rect (245,50,2,95);
rect (250,50,2,95);
rect (255,50,2,95);
rect (260,50,2,95);
rect (265,50,2,95);
rect (270,50,2,95);
rect (275,50,2,95);
rect (280,50,2,95);
rect (285,50,2,95);
rect (290,50,2,95);
rect (295,50,2,95);
rect (300,50,2,95);

rect (405,50,2,95);
rect (410,50,2,100);
rect (415,50,2,105);
rect (420,50,2,110);
rect (425,50,2,115);
rect (430,50,2,120);
}


