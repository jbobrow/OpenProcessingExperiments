
//Jacqueline Barbaresco-kowalski-o Pinguin  estÃ¡ licenciado com uma LicenÃ§a Creative Commons - AtribuiÃ§Ã£o 4.0 Internacional.
//data:11/03/2014
 
//Arquitetura e Urbanismo UTFPR
int flocos=700;
float[] nevex;
float[]nevey;
int ac;//funÃ�Â§Ã�Â£o acumular neve


void setup() {
  //  <span class="qx7f507" id="qx7f507_8">frameRate</span>(10);

  background(100, 242, 239);

  size(600, 600);
  strokeWeight(5);

  stroke(2);

  nevex = new float[flocos];
  nevey = new float[flocos];
  for (int i=0; i<flocos; i++)
  {
    nevex[i] = floor(random(width));
    nevey[i] = floor(random(height));
  }
}
void draw() {
  background(100, 242, 239);
//chÃ�Â£o
  noStroke();
  rect(0, 260, 600, 600);
  //pÃ�Â©s//
  fill(245, 106, 25);
  ellipse(250, 525, 20, 40);
  ellipse(240, 530, 20, 35);
  ellipse(230, 520, 20, 35);
  ellipse(310, 530, 20, 40);
  ellipse(320,525,20,35);
  ellipse(300,530,20,35);
  


  //corpo//ellipse maior
 fill(8, 7, 7);
  ellipse(280, 400, 185, 260);
  
  //corpo//ellipse menor
  fill(255, 255, 255);
  ellipse(280, 435, 130, 175);

  //olhos
  stroke(255);
  fill(255, 255, 255);
  ellipse(260, 325, 40, 40);
  ellipse(300, 325, 40, 40);
  fill(255, 255, 255);
  fill(8, 7, 7);
  ellipse(270, 329, 10, 10);
  ellipse(290, 329, 10, 10);


//ellipseMode(CORNER);
  //asas
  fill(8, 7, 7);
  

  pushMatrix();
  translate(200,339);
  rotate(radians(mouseX/4.0));
  translate(10,45);
  ellipse(0,0, 20, 90);
  popMatrix();
  
  pushMatrix();
  translate(341,342);
  rotate(radians(-mouseX/4.0));
  translate(10,45);
  ellipse(0, 0,20, 90);
  popMatrix();
  noStroke();
  fill(255, 255, 255);

//ellipseMode(CENTER);
  //bico

  fill(245, 106, 25);
  triangle(270,345,280,355,290,345);




  stroke(200);
  for (int i=0;i<flocos;i++)
  {
    point(nevex[i], nevey[i]);
    nevey[i]=nevey[i]+random(-0.1, 0.5);//MOVIMENTO VERTICAL
    nevex[i]=nevex[i]+random(-0.1, 0.1);//MOVIMENTO HORIZONTAL
    if (nevey[i]>height)
    {
      nevex[i] = floor(random(width*2.5));
      nevey[i] = 0;//floor(random(height));
      noStroke();
      if (ac<400)//limite altura da neve
        ac++;//funÃ�Â§Ã�Â£o acumular neve
    }

    fill(255);

    rect(0, height, width, -pow(ac, 0.900));
  }
}

