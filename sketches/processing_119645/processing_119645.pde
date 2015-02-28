
int colorSol = color(255,255,0);
int colorLuna = color(163,164,165);

void setup(){
  size(600,500);
  fill(56,81,255);
}

void draw(){
if(mousePressed == false){
  background(26,71,201);
//sol
  noStroke();
  fill(colorSol);
  ellipse(527,50,60,60);

//cara
  stroke(0,0,0);
  strokeWeight(3);
  fill(255,204,102);
  ellipseMode(CENTER);
  ellipse(250,250,295,401);
   
//pelo
  noStroke();
  fill(191,64,0);
  triangle(119,149,97,112,141,115);
  triangle(142,109,120,67,172,79);
  triangle(175,74,183,28,222,53);
  triangle(223,51,255,15,273,50);
  triangle(276,51,316,20,318,73);
  triangle(321,74,377,71,354,106);
  triangle(356,110,407,118,380,150);
   
//oreja izquierda
  noStroke();
  fill(255,204,102);
  ellipse(84,224,60,100);
//pendiente izquierdo
  fill(0,0,0); 
  ellipse(81,271,25,25);
//oreja derecha 
  fill(255,204,102);
  ellipse(412,224,60,100);
//pendiente derecho 
  fill(0,0,0);
  ellipse(414,275,25,25);
   
//ojos
  stroke(2);
  fill(82,205,247);
  ellipse(190,208,50,50);
  ellipse(310,208,50,50);
  fill(0,0,0);
  ellipse(190,208,20,20);
  ellipse(310,208,20,20);
 
//boca
  fill(255,119,119);
  stroke(201,107,6);
  strokeWeight(8);
  ellipse(250,346,180,180);
  noStroke();
  fill(255,204,102);
  rect(150,250,200,90);
  stroke(201,107,6);
  strokeWeight(6);
  fill(201,107,6);
  line(160,340,340,340);
 
//ceja izquierda
rect(156,155,60,10);
 
//ceja derecha
rect(286,155,60,10);
 
//dientes
  stroke(0);
  fill(#FFFFFF);
  rect(166,344,28,25);
  rect(194,344,28,25);
  rect(222,344,28,25);
  rect(250,344,28,25);
  rect(278,344,28,25);
  rect(306,344,28,25);
 
//nariz
  line(249,240,220,290);
  line(220,290,257,289);
 //cara
  stroke(0,0,0);
  strokeWeight(3);
  fill(255,204,102);
  ellipseMode(CENTER);
  ellipse(250,250,295,401);
   
//pelo
  noStroke();
  fill(191,64,0);
  triangle(119,149,97,112,141,115);
  triangle(142,109,120,67,172,79);
  triangle(175,74,183,28,222,53);
  triangle(223,51,255,15,273,50);
  triangle(276,51,316,20,318,73);
  triangle(321,74,377,71,354,106);
  triangle(356,110,407,118,380,150);
   
//oreja izquierda
  noStroke();
  fill(255,204,102);
  ellipse(84,224,60,100);
//pendiente izquierdo
  fill(0,0,0); 
  ellipse(81,271,25,25);
//oreja derecha 
  fill(255,204,102);
  ellipse(412,224,60,100);
//pendiente derecho 
  fill(0,0,0);
  ellipse(414,275,25,25);
   
//ojos
  stroke(2);
  fill(82,205,247);
  ellipse(190,208,50,50);
  ellipse(310,208,50,50);
  fill(0,0,0);
  ellipse(190,208,20,20);
  ellipse(310,208,20,20);
 
//boca
  fill(255,119,119);
  stroke(201,107,6);
  strokeWeight(8);
  ellipse(250,346,180,180);
  noStroke();
  fill(255,204,102);
  rect(150,250,200,90);
  stroke(201,107,6);
  strokeWeight(6);
  fill(201,107,6);
  line(160,340,340,340);
 
//ceja izquierda
rect(156,155,60,10);
 
//ceja derecha
rect(286,155,60,10);
 
//dientes
  stroke(0);
  fill(#FFFFFF);
  rect(166,344,28,25);
  rect(194,344,28,25);
  rect(222,344,28,25);
  rect(250,344,28,25);
  rect(278,344,28,25);
  rect(306,344,28,25);
 
//nariz
  line(249,240,220,290);
  line(220,290,257,289);
}if(mousePressed ==true) {  
  background(55,55,57);
  noStroke();
  
//estrellas
  fill(255,255,255);
  ellipse(417,38,5,5);
  ellipse(45,29,5,5);
  ellipse(458,57,5,5);
  ellipse(490,31,5,5);
  ellipse(38,82,5,5);
  ellipse(44,70,5,5);
  ellipse(19,78,5,5);
  ellipse(340,31,5,5);
  ellipse(450,61,5,5);
  ellipse(367,51,5,5);
  ellipse(447,54,5,5);
  ellipse(404,15,5,5);
  ellipse(310,10,5,5);
  ellipse(319,20,5,5); 
  ellipse(483,25,5,5);
  ellipse(385,95,5,5);   
  ellipse(440,31,5,5); 
  ellipse(21,3,5,5); 
  ellipse(38,82,5,5); 
  ellipse(458,85,5,5);  
  ellipse(464,40,5,5);
  ellipse(480,70,5,5);
  ellipse(160,14,5,5);
  ellipse(60,15,5,5);
  ellipse(70,48,5,5);
  ellipse(120,66,5,5);
  ellipse(157,44,5,5);
  ellipse(77,30,5,5);
  ellipse(341,26,5,5);
  ellipse(357,45,5,5);
  ellipse(386,14,5,5);
  ellipse(415,56,5,5);
  ellipse(214,9,5,5);
  ellipse(279,13,5,5);
  ellipse(233,24,5,5);
  ellipse(393,31,5,5);
  ellipse(16,33,5,5);
  ellipse(122,14,5,5);
  ellipse(85,69,5,5);
  ellipse(429,34,5,5);
  ellipse(512,62,5,5);
  ellipse(421,78,5,5);
  ellipse(388,68,5,5);
  ellipse(361,12,5,5);
  ellipse(97,41,5,5);
  ellipse(128,35,5,5);
  ellipse(29,52,5,5);
  ellipse(392,65,5,5);

//luna
  noStroke();
  fill(colorLuna);
  ellipse(527,50,60,60);
//capa
  stroke(0,0,0);
  strokeWeight(15);
  fill(255,0,0);
  arc(250,150,400,400,0,PI, CHORD);
  stroke(0,0,0);
  strokeWeight(15);
  fill(#FF0000);
  arc(250,460,350,350,PI, TWO_PI,CHORD);
//cara
  stroke(0,0,0);
  strokeWeight(3);
  fill(247,222,197);
  ellipseMode(CENTER);
  ellipse(250,250,295,401);
   
//pelo
  noStroke();
  fill(191,64,0);
  triangle(119,149,97,112,141,115);
  triangle(142,109,120,67,172,79);
  triangle(175,74,183,28,222,53);
  triangle(223,51,255,15,273,50);
  triangle(276,51,316,20,318,73);
  triangle(321,74,377,71,354,106);
  triangle(356,110,407,118,380,150);
   
//oreja izquierda
  noStroke();
  fill(255,204,102);
  ellipse(84,224,60,100);
//pendiente izquierdo
  fill(0,0,0); 
  ellipse(81,271,25,25);
//oreja derecha 
  fill(255,204,102);
  ellipse(412,224,60,100);
//pendiente derecho 
  fill(0,0,0);
  ellipse(414,275,25,25);
   
//ojos
  stroke(2);
  fill(82,205,247);
  ellipse(190,208,50,50);
  ellipse(310,208,50,50);
  fill(0,0,0);
  ellipse(190,208,20,20);
  ellipse(310,208,20,20);
 
//boca
  fill(255,119,119);
  stroke(201,107,6);
  strokeWeight(8);
  ellipse(250,346,180,180);
  noStroke();
  fill(255,204,102);
  rect(150,250,200,90);
  stroke(201,107,6);
  strokeWeight(6);
  fill(201,107,6);
  line(160,340,340,340);
 
//ceja izquierda
rect(156,155,60,10);
 
//ceja derecha
rect(286,155,60,10);
 
//dientes
  stroke(0);
  fill(#FFFFFF);
  rect(166,344,28,25);
  rect(194,344,28,25);
  rect(222,344,28,25);
  rect(250,344,28,25);
  rect(278,344,28,25);
  rect(306,344,28,25);
 
//nariz
  line(249,240,220,290);
  line(220,290,257,289);
 //cara
  stroke(0,0,0);
  strokeWeight(3);
  fill(255,204,102);
  ellipseMode(CENTER);
  ellipse(250,250,295,401);
   
//pelo
  noStroke();
  fill(191,64,0);
  triangle(119,149,97,112,141,115);
  triangle(142,109,120,67,172,79);
  triangle(175,74,183,28,222,53);
  triangle(223,51,255,15,273,50);
  triangle(276,51,316,20,318,73);
  triangle(321,74,377,71,354,106);
  triangle(356,110,407,118,380,150);
   
//oreja izquierda
  noStroke();
  fill(255,204,102);
  ellipse(84,224,60,100);
//pendiente izquierdo
  fill(0,0,0); 
  ellipse(81,271,25,25);
//oreja derecha 
  fill(255,204,102);
  ellipse(412,224,60,100);
//pendiente derecho 
  fill(0,0,0);
  ellipse(414,275,25,25);
   
//ojos
  stroke(2);
  fill(255,0,0);
  ellipse(190,208,50,50);
  ellipse(310,208,50,50);
  fill(0,0,0);
  ellipse(190,208,20,20);
  ellipse(310,208,20,20);
 
//boca
  fill(255,119,119);
  stroke(201,107,6);
  strokeWeight(8);
  ellipse(250,346,180,180);
  noStroke();
  fill(255,204,102);
  rect(150,250,200,90);
  stroke(201,107,6);
  strokeWeight(6);
  fill(201,107,6);
  line(160,340,340,340);
 
//ceja izquierda
rect(156,155,60,10);
 
//ceja derecha
rect(286,155,60,10);
 
//dientes
  stroke(0);
  fill(#FFFFFF);
  triangle(166,344,194,344,178,392);
  rect(194,344,28,25);
  rect(222,344,28,25);
  rect(250,344,28,25);
  rect(278,344,28,25);
  triangle(306,344,334,344,318,392);
 
//nariz
  line(249,240,220,290);
  line(220,290,257,289);
  

  println(mouseX,mouseY);
}  
}
void mousePressed(){
  colorSol = color(234,233,222);
 
}
void mouseReleased(){
  colorSol = color (255,255,0);
}



