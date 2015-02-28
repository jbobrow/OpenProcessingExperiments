
//Autor: Diego Alonso
//Data da criação: 02/10/2013

float r=255;
float g=255;
float b=255;

void setup() {
  size(600, 600);
  stroke(0);  
  background(0, 0, 255);
}

void draw() {

  frameRate(40);
  rectMode(CENTER);

  //Centro da tenda;

  fill(random(r), random(g), random(b));
  rect(400, 400, 100, 200);
  fill(random(r), random(g), random(b));
  rect(490, 400, 80, 200);
  fill(random(r), random(g), random(b));
  rect(330, 400, 80, 200);
  fill(random(r), random(g), random(b));
  rect(250, 400, 100, 200);
  fill(random(r), random(g), random(b));
  rect(135, 400, 132, 200);


  //Topo da tenda

  fill(random(r), random(g), random(b));
  triangle(310, 45, 68, 300, 180, 300);//1ºtriangulo
  fill(random(r), random(g), random(b));
  triangle(310, 45, 180, 300, 250, 300);//2ºtriangulo
  fill(random(r), random(g), random(b));
  triangle(310, 45, 250, 300, 350, 300);//3ºtriangulo
  fill(random(r), random(g), random(b));
  triangle(310, 45, 350, 300, 480, 300);//4º
  fill(random(r), random(g), random(b));
  triangle(310, 45, 400, 300, 480, 300);//5º
  fill(random(r), random(g), random(b));
  triangle(310, 45, 480, 300, 530, 300);//6º

  //Porta de entrada.

  fill(30);
  triangle(299, 300, 220, 495, 390, 495);

  //Base da Tenda

  fill(18, 193, 16);
  rect(300, 550, 610, 110);

  //Bandeira

  strokeWeight(3);
  line(310, 45, 310, 5);
  fill(255);
  rect(355, 18, 85, 25);
  fill(0);
  strokeWeight(50);
  text("Diego Alonso!", 315, 23);
  strokeWeight(1);

  //Nuvens
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  for (int x=50; x<=140; x+=30)
    ellipse(x, 60, 50, 50);
  for (int x=480; x<=570; x+=30)
    ellipse(x, 60, 50, 50);
}



