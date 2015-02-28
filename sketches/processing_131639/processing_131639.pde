
//Ana Carolina Luiz Rahal S53 UTFPR
//Primetime Nursey School-Stúdio MK27

// Neve
int pingos=400;
float [] chuvax;
float [] chuvay;

void setup() {
  size(400, 400);
 //neve
  stroke(255);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
}

void draw() {
  background(41,213,227);
  stroke(153);
  fill(255);
    rect(50, 300, 249, 50);
  //x,y,largura,altura
  //retângulo da base

fill(191,193,193);
rect(0,350,400,50);
//calçada

  fill(153);
  for (int i = 50;i < 300; i = i+3) {
    line(i, 300, i, 350);
  }
  //linhas repetidas do retângulo da base
  
  fill(255);
  rect(50, 180, 210, 120);
  rect(52, 182, 206, 118);
  //retângulo superior

  fill(234, 247, 97);
  rect(66, 239, 150, 60);
  //reângulo verde limão

  fill(153);
  for (int i = 50;i < 256; i = i+9) {
    line(i, 182, i, 300);
  }
  //linhas repetidas do retângulo superior

  fill(234, 247, 97);
  rect(260, 192, 40, 45);
  //retangulo lateral
  
  fill(66, 234, 84);
  ellipse(350, 300, 60, 50);//arbusto
  line(350, 300, 350, 350);//tronco
  
  fill(255);
  strokeWeight(1);
 line (50,270,68,270);
 line(50,272,68,272);
 //parte reta da rampa
 
 line(68,270,216,298);
 line(68,272,216,300);
 //parte inclinada da rampa
 
 line(216,298,260,298);
 line(216,300,260,300);
 //final da rampa
 
  line(0, 350, 400, 350);//chão
  
   //HOMEM
  fill(0);
  pushMatrix();
  translate(mouseX/2.5,mouseX/15);
  ellipse(68,248,5,5);
  //rosto
  rect(65,250,5,12);
  //tronco
  rect(65,262,4,10);
  //pé
  popMatrix();
 stroke(255);
  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+random(-0.1, 0.5);
    chuvax[i]=chuvax[i]+random(-0.1, 0.1);
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(width*1.5));
      chuvay[i] = 0;floor(random(height));
    }
  }
}

void keyPressed()
{
  background(random(255), random(255), random(255));
}

