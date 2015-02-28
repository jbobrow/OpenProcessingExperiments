


//  Daniel Scalisse Galvão     12         S53 - Arquitetura e Urbanismo
//  Computação 1


// Congresso Nacional: dia ensolarado/noite de luar e estrelas


int S=0;

void setup() { 
  size(660, 550);
}

void draw() {

  background(42, 227, 232);

  // mouse fundo
  if (mouseX < height-100)
    background (42, 227, 232);
  else
    background(8, 1, 70);


  // estrelas
  if (mouseX < height-100)
    background (42, 227, 232);
  else
    stroke(255);
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400)); 
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400)); 
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));
  point(random(0, 1000), random(0, 400));



  //sol
   if (mouseX < height-100)
    fill(255, 230, 0);
  else
    fill(224,208,127);
 
  S++;
  stroke(0);
  if (S>660) {
    S=-70;
  }
  noStroke();



  ellipse (0+S++%width, 80, 60, 60);

  //congresso
  stroke(0);
  fill(252, 245, 245);
  ellipse(150, 415, 115, 105);   
  arc(470, 360, 120, 85, 0, PI);
  line(410, 360, 530, 360);


  //chão
  fill(13, 185, 11);
  rect(0, 440, 680, 500);


  // lago
  fill(21, 176, 234);
  quad(150, 440, 260, 480, 260, 480, 150, 480); 
  quad(340, 480, 513, 440, 510, 480, 340, 480); 
  rect(120, 440, 25, 40);
  rect(517, 440, 25, 40);


  //congresso 2
  fill(252, 245, 245);
  rect(80, 400, 500, 40);
  rect (145, 440, 10, 40);
  rect(510, 440, 10, 40);
  rect(0, 480, 700, 15);
  rect(65, 400, 530, 10);
  quad(305, 440, 300, 480, 340, 480, 330, 440);
  rect(220, 200, 50, 200);
  rect(290, 200, 50, 200);

  // passarela
  rect(270, 260, 20, 20);
  line(270, 265, 290, 265);
  line(270, 275, 290, 275);


  //janelas 
  stroke(0);
  fill(172, 189, 247);
  for (int a=0; a<49;a++)
  {
    rect (85+a*10, 415, 8, 7);
  }
  for (int a=0; a<49;a++)
  {
    rect (85+a*10, 425, 8, 7);
  }

  if (mouseX > height-100) {
    for (int c=85;c<415;c+=31) {
      stroke(170);
      fill (255, 255, 62);
      for (int a=0; a<18;a++)
      {
        rect (c+a*10, 415, 8, 7);
      }
      for (int a=0; a<18;a++)
      {
        rect (c+a*10, 425, 8, 7);
      }
    }
  }


  //congresso 3
  stroke(0);
  fill(252, 245, 245);
  quad(266, 400, 297, 400, 303, 480, 260, 480);

  //congresso 4
  noStroke();
  rect(280, 465, 50, 15);
  rect(511, 470, 9, 15);
  rect(146, 470, 9, 15);
}



