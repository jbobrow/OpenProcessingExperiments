
void setup(){
size(500,500);
background(4,133,183);
 
 
}
 
void draw(){
 
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

}


