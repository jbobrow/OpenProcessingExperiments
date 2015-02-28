
void setup() {
size(800,800);

noStroke();
fill(0,0,255);
rect(0,0,800,100);
fill(20,0,230);
rect(0,100,800,100);
fill(50,0,180);
rect(0,200,800,100);
fill(80,0,150);
rect(0,300,800,100);
fill(110,0,120);
rect(0,400,800,100);
fill(140,0,90);
rect(0,500,800,100);
fill(170,0,60);
rect(0,600,800,100);
fill(200,0,30);
rect(0,700,800,100);
fill(230,0,0);
rect(0,800,800,100);
stroke(1);







fill(255,204,126);
ellipse(390,390,500,500);
rect(290,650,200,300);

fill(118,84,31);
triangle(150,150,650,200,75,50);

fill(77,51,12);
rect(100,150,150,35);
rect(260,150,150,35);

pushMatrix();
translate(170, 350);
fill(0,0,0);
triangle(30, 75, 58, 20, 86, 75);
popMatrix();

pushMatrix();
translate(200,550);
fill(0,0,0);
rect(30, 32, 200, 55, 3, 6, 12, 18);
popMatrix();

 
fill(242,233,215);
ellipse(175,225,150,75);
fill(242,233,215);
ellipse(325,225,150,75);
fill(165,27,31);
ellipse(175,225,75,75);
fill(165,27,31);
ellipse(325,225,75,75);
fill(131,23,26);
ellipse(175,225,50,50);
fill(131,23,26);
ellipse(325,225,50,50);
fill(106,19,22);
ellipse(175,225,25,25);
fill(106,19,22);
ellipse(325,225,25,25);

 
  
  
  fill(255,0,21);
  ellipse(425,350,25,25);
  
  fill(15,13,180);
  ellipse(400,400,25,25);
  fill(224,204,14);
  fill(255,146,3);
  ellipse(450,450,25,25);
  fill(5,255,3);
  ellipse(500,500,25,25);
  fill(255,3,222);
  ellipse(350,400,25,25);
  fill( 3,255,219);
  ellipse(300,500,25,25);
  fill(255,255,255);
  ellipse(350,500,25,25);
  fill(53,211,110);
  ellipse(400,500,25,25);
  fill(153,211,53);
  ellipse(350,450,25,25);
  fill(158,53,211);
  ellipse(500,350,25,25);
  fill(219,159,113);
  ellipse(550,400,25,25);
  fill(219,113,171);
  ellipse(515,425,25,25);
  
  fill(255,255,255);
 ellipse(220,500,140,55);
 
 fill(131,91,53);
 rect(420,170,220,140);

  fill(134,77,16);
  beginShape();
  curveVertex(443, 335);
  curveVertex(443, 335);
  curveVertex(495, 339);
  curveVertex(495, 339);
  curveVertex(515, 423);   
  curveVertex(515, 423);
  curveVertex(475, 467);
  curveVertex(475, 467);
  endShape();
  
}

void draw() {
  print("x: " + mouseX);
  println("y: " + mouseY);
}


