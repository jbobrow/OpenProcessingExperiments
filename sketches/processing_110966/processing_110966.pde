
int x;
float e;

//__________________________________________
void setup() {
  size (500, 400);
 // ceu = loadImage ("céu.jpg");
 smooth();
}

//____________________________________________________
void draw () {
  
  
  smooth();
  x= 261;
 // background (ceu);    
background(23,57,93);

fill(255); // Castellon
stroke(0);
  beginShape();
  vertex(25, 228);
  vertex(54, 258);
  vertex(186, 258);
  vertex(253, 289);
  vertex(263, 289);
  vertex(363, 244);
  vertex(344+(mouseX/20), 118);
  vertex(335+(mouseX/30), 108);
  vertex(324+(mouseX/20), 10);
  vertex(324, 228);
  vertex(25, 228);
  endShape(CLOSE);

//_____________________________________
  fill(130); // trinagulo
  beginShape();
  vertex(324, 228);
  vertex(193, 228);
  vertex(255, 281);
  vertex(260, 281);
  vertex(324, 228);
  endShape(CLOSE);
  noFill();
  
//____________________________________
 stroke (100); // sombra triângulo
    strokeWeight(4);
   line (197, 230,320, 230);
   strokeWeight(2);
line (197, 229,318, 229);
line (198, 231,318, 231);
stroke (120);
strokeWeight(3);
line (199, 232,317, 232);

//_____________________________________
strokeWeight(1); // Janelas- ladinho do triangulo
  noStroke();
  fill(68, 120, 147, 150);
  beginShape(); 
  vertex(36, 232);
  vertex(60, 253);
  vertex(166, 254);
  vertex(36, 232);
  //vertex();
  endShape(CLOSE);

//___________________________________
stroke(0); // curva dentro do triangulo
  beginShape(); 
  curveVertex(186, 258);// ponto direito
  curveVertex(186, 258);
  curveVertex(120, 242);// cume
  curveVertex(63, 234); //cume2
  curveVertex(36, 232);
  curveVertex(36, 232);
  endShape();

// __________________________________
  fill(255); // pilar
  beginShape();
  vertex(334, 258);
  vertex(340, 255);
  vertex(340, 280);
  vertex(334, 284);
  vertex(334, 258);
  endShape();

//____________________________________
fill(255);// chao do Castellon
noStroke();
  beginShape();
  vertex(0, 288);
  vertex(0, 294);
  vertex(465, 294);
  vertex(500, 288);
  vertex(0, 288);
  endShape();

//____________________________________
stroke(0);
  beginShape();// montanhinha marota
  curveVertex(310, 288);// ponto direito
  curveVertex(310, 288);
  curveVertex(423, 220-(2-mouseY/9));// cume
  curveVertex(520, 294);
  curveVertex(520, 294);
  endShape();

//_____________________________________
noStroke(); //pátio
fill (240);
beginShape();
vertex(0, 313);
vertex(0, 360);
vertex(500, 360);
vertex(500, 313);
vertex(0, 313);
//vertex(0, 313);
endShape();

//____________________________________
fill(100,200); // vão da rampa
rect (0,292,500,21);
fill(80,116,67);
rect (0,370,500,40);// parte arvores inferior

//_____________________________________
fill(255);// calçada inferior
rect (0,360,500,10);

// ___________________________________
fill(245); // rampa
beginShape();
  curveVertex(386, 289);// ponto direito
  curveVertex(386, 289);
  curveVertex(450, 300);// cume
  curveVertex(480, 313);
  curveVertex(480,313);
  curveVertex(500, 313);
  curveVertex(500, 313);
  curveVertex(500, 295);//cume
  curveVertex(386, 289);
  endShape();

//____________________________________

fill(34,94,20,235);
ellipse (25,380,35,40);
ellipse (50,370,30,40);
ellipse (75,390,40,50);
ellipse (100,380,40,30);
ellipse (125,370,40,30);
ellipse (130,390,40,50);
ellipse (150,380,45,45);
ellipse (175,370,40,40);
ellipse (205,390,30,45);
ellipse (230,380,50,40);
ellipse (250,370,40,30);
ellipse (280,390,40,40);
ellipse (300,380,30,40);
ellipse (325,370,50,50);
ellipse (350,390,50,30);
ellipse (375,380,30,20);
ellipse (410,370,40,30);
ellipse (430,390,35,50);
ellipse (450,380,20,40);
ellipse (475,380,40,25);
ellipse (490,370,50,30);

fill(125,183,18,100);
ellipse (46,394,30,30);
ellipse (109,375,20,30);
ellipse (189,393,40,50);
ellipse (263,382,30,30);
ellipse (399,396,45,55);
ellipse (484,388,30,30);


}
