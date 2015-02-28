
float y=400, x1=0, x2=0, x3=0, x4=0;//float para decimales
float x=400, y1=0, y2=0, y3=0, y4=0;
float rojo=0, verde=155, azul=219;
float rojo2=247, verde2=236, azul2=69;

void setup() {
  size(400, 400);
  background(rojo=0, verde=155, azul=219);

  frameRate(20);//20 animación común
}
void draw() {
  background(rojo, verde, azul);
  noStroke();
  //cielo
  fill(254, 238, 0);
  ellipse(49.85, 53.21, 72.549, 72.548);//sol
  fill(255);
  ellipse(69.78 +x1, 95.99, 102.83, 27.246);
  ellipse(58.43 +x1, 80.19, 52.274, 29.057);//nube1
  ellipse(194.77 +x2, 66.13, 32.008, 16.239);
  ellipse(210.77+x2, 63.9, 20.468, 11.789);//nube2
  ellipse(338.08+x3, 94.21, 76.47, 20.261);
  ellipse(369.29+x3, 84.41, 27.777, 25.49);
  ellipse(379.8+x3, 94.3, 30.503, 10.932);//nube3

  //edificio1
  fill(91, 91, 95);
  rect(165.14, 198.2, 111.765, 201.796);
  fill(0, 46, 130);
  rect(176, 220, 23, 23);
  rect(209, 220, 23, 23);
  rect(243, 220, 23, 23);
  rect(176, 253, 23, 23);
  rect(176, 287, 23, 23);
  rect(209, 253, 23, 23);
  rect(209, 287, 23, 23);
  rect(243, 253, 23, 23);
  rect(243, 287, 23, 23);
  //edificio2
  fill(135, 135, 138);
  rect(276.9, 131.14, 51, 268.863);
  fill(254, 238, 0);
  rect(285.78, 142.9, 11, 11);
  rect(305.72, 143.22, 11, 11);
  rect(285.78, 162.17, 11, 11);
  rect(305.72, 162.17, 11, 11);
  //edificio3
  fill(91, 91, 95);
  rect(328.54, 261.86, 71.464, 138.144);
  fill(0, 46, 130);
  ellipse(365.62, 295.88, 36, 36);
 
  //avion
  stroke(191, 4, 17);
  strokeWeight(20);
  line(43+x4, 356+y4, 149+x4, 280+y4);
  noStroke();
  fill(191, 4, 17);
  triangle(86.66+x4, 327.346+y4, 140+x4, 284+y4, 118+x4, 377+y4);
  triangle(86.66+x4, 327.346+y4, 42+x4, 282+y4, 140+x4, 284+y4);
  triangle(63.37+x4, 349.36+y4, 59.37+x4, 376.09+y4, 50.29+x4, 358.79+y4);
  triangle(56.36+x4, 340.92+y4, 42.53+x4, 350.89+y4, 30.22+x4, 339.22+y4);

  x1=x1+1;
  y1=150;//nube1

  x2=x2+2;//nube2
  y2=90;


  x3=x3+1;//nube3
  y3=y3-1;

x4=x4+1;
y4=y4-1;//avion

  azul=azul-1;
  verde=verde-1;
  rojo=rojo-1;

  azul2=azul2-1;
  verde2=verde2-1;
  rojo2=rojo2-1;
}
