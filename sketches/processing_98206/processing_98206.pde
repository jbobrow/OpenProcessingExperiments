
// Ariane
//planta baixa
int yc=0;
PImage img;
PFont fonte;

void setup ()
{
  size (200, 200);
  background (#EAEADA);
  img = loadImage("arch.jpg");
}

void draw () {
  background (#EAEADA);

  fonte = createFont("word", 12);


  textFont (fonte);

  for (int x = 0; x < 200; x += 2)
    for (int y = 0; y < 200; y += 2) {
      strokeWeight(1);
      fill(#FCFC05);
      point(x, y);
    }

  // pessoa
  fill(#EACFB2);
  ellipse (yc/10, 170, 3, 7);
  ellipse(yc/10, 160, 3, 7);
  stroke(155);
  fill(0);
  ellipse(yc/10, 165, 8, 8);
  if (yc<5000)
    yc++;
  else
    yc=0;

  // canteiro
  fill(#E0D609);
  beginShape ();
  vertex (200, 0);
  vertex (200, 20);
  vertex(160, 20);
  vertex (120, 15);
  vertex (100, 10);
  vertex(80, 5);
  vertex (40, 5);
  vertex (0, 0);
  vertex (200, 0);
  endShape();
  rect (180, 100, 30, 180);
  rect (0, 180, 180, 20);

  // piscina
  fill(147, 66, 25);
  rect(90, 95, 85, 55);

  //veiculo
  noStroke ();
  stroke(#AF07E3);
  fill(0);
  rect (mouseX, mouseY, 15, 10); 

  //edificação
  for (int i = 90; i<175; i=i+3)
  {
    stroke (1);

    line(i, 95, i, 150);

    image(img, 100, 100, img.width/6, img.height/6);
  }

  fill(201, 110, 5);

  for (int i=0; i<30; i=i+5)
    for (int j=0; j<30; j=j+5)
    {
      rect(30+i, 10+j, 5, 5);// garagem
    }
  for (int i=0; i<35; i=i+5)
    for (int j=0; j<45; j=j+5)
    {
      rect(75+i, 45+j, 5, 5);//casa
    }
  for (int i=0; i<60; i=i+5)
    for (int j=0; j<50; j=j+5)
    {
      rect(40+i, 30+j, 5, 5);// casa
    }
  for (int i=0; i<25; i=i+5)
    for (int j=0; j<60; j=j+5)
    {
      rect(5+i, 105+j, 5, 5);//anexo
    }

  // arvores
  fill (#559D0A);
  ellipse (180, 170, 25, 29);
  ellipse ( 150, 180, 30, 42);
  ellipse ( 90, 185, 20, 15);
  ellipse ( 50, 190, 10, 10);
  ellipse( 190, 189, 30, 30);
  ellipse ( 20, 180, 40, 40);
  ellipse ( 180, 15, 30, 30);
  ellipse ( 160, 15, 25, 25);

  // assinatura
  fonte = createFont("Ariane", 12);
  textAlign(RIGHT); 
  fill (255);  
  text(" Ariane Lacerda 2013", width-10, height-10);
}



