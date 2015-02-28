
//Thayná Kavalek

// 11/03/2014

//O trabalho Yellow Submarine de Thayná Kavalek está licenciado com uma Licença Creative Commons - Atribuição-CompartilhaIgual 4.0 Internacional.


//bolhas

int pingos=200;
float [] chuvax;
float [] chuvay;
float [] chuvad;

PImage photo;

void setup() {
  size(1000, 700);
  background(0);


 photo = loadImage("mergulhador.png");

  //bolhas
  stroke(255);
  strokeWeight(0.1);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  chuvad = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
    chuvad[i] = floor(random(5, 20));
  }
}

int a = 0;
float b = 0.2;
float c = 0.3;



void draw() {
  fill (17, 22, 152, 20);
  rect(0, 0, width, height);
  
  
  


  //châo
  noStroke();
  fill(19, 13, 111);
  rect(0, 500, 1000, 199);



  //peixe laranja
  fill(255, 116, 3);
  ellipse(600-a, 50+200*sin(a/50.0), 60, 30);
  ellipse(632-a, 45+200*sin(a/50.0), 7, 15);
  ellipse(632-a, 59+200*sin(a/50.0), 7, 15);
  fill(255, 255, 255);
  ellipse(590-a, 50+200*sin(a/50.0), 5, 26);
  ellipse(610-a, 50+200*sin(a/50.0), 5, 26);
  fill(0, 0, 0);
  ellipse(580-a, 45+200*sin(a/50.0), 2, 3);




  //peixe rosa
  fill(255, 3, 222);
  ellipse(b+40, 120+500*sin(a/100.0), 50, 25);
  ellipse(b+13, 115+500*sin(a/100.0), 6, 13);
  ellipse(b+13, 125+500*sin(a/100.0), 6, 13);
  fill(187, 3, 255);
  ellipse(b+30, 120+500*sin(a/100.0), 5, 23);
  ellipse(b+50, 120+500*sin(a/100.0), 5, 23);
  fill(255, 255, 255);
  ellipse(b+58, 115+500*sin(a/100.0), 3, 4);

  //peixe roxo
  fill(187, 3, 255);
  ellipse(b+60, 150+500*sin(a/500.0), 30, 15);
  ellipse(b+45, 150+500*sin(a/500.0), 5, 10);
  fill(0, 0, 0);
  ellipse(b+72, 148+500*sin(a/500.0), 2, 2);

  a=(a+1)%width ;
  b=(b+c)%width ;  

  //luz

  //fill(246,252,161,100);
  //quad(320,0,320,0,0,320,40,320);
  //quad(320,0,320,0,80,320,120,320);
  //quad(320,0,320,0,160,320,200,320);
  //quad(320,0,320,0,240,320,280,320);
  //quad(320,0,320,0,320,320,360,320);
  //quad(320,0,320,0,400,320,440,320);
  //quad(320,0,320,0,480,320,520,320);
  //quad(320,0,320,0,560,320,600,320);
  //quad(320,0,320,0,640,320,680,320);

  //submarino
  noStroke();
  fill(254, 255, 0);
  ellipse(130+mouseX, 300+mouseY, 200, 100);
  ellipse(130+mouseX, 260+mouseY, 110, 65);

  {//janelinhas
    for (int i=0; i<130; i=i+30) {
      stroke(255, 0, 0);
      strokeWeight(2.0);
      fill(62, random(255), random(255));
      ellipse((70+i)+mouseX, 295+mouseY, 20, 20);
    }
  }

  //hélice
  fill(0, 0, 0);
  noStroke();
  rect(10+mouseX, 300+mouseY, 20, 5);
  ellipse(10+mouseX, 295+mouseY, 7, 15);
  ellipse(10+mouseX, 310+mouseY, 7, 15);

  //tubo
  fill(0, 0, 0);
  noStroke();
  rect(150+mouseX, 195+mouseY, 10, 50, 7, 7, 1, 1);
  rect(150+mouseX, 195+mouseY, 30, 10, 7, 1, 7, 1);
  rect(178+mouseX, 191+mouseY, 5, 18);

  mergulhador(mouseX,mouseY);
  
  
  
  //bolhas
  strokeWeight(0.5);
  stroke(200);
  noFill();
  for (int i=0; i<pingos; i++)

  {
    ellipse(chuvax[i], chuvay[i], chuvad[i], chuvad[i]);
    chuvay[i]=chuvay[i]-random(-0.1, 0.5);
    chuvax[i]=chuvax[i]-random(-0.1, 0.1);
    if (chuvay[i]<0)
    {
      chuvax[i] = floor(random(width*1.5));
      chuvay[i] = height;
      chuvad[i] = floor(random(5, 15));
    }
  }
}

void r (int x, int y)
{ 
  fill(255);
  rect(x, y, 2, 2);
}


void mergulhador (int x, int y)
{ 
  pushMatrix();
  scale(0.2);
  image(photo, x*5, y*5);
  popMatrix();
}
