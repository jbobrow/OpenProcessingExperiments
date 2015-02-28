
//constantes dos arbustos
float noiseScale=0.01;

//constantes das janelas
int[]x= {
  120, 130, 140, 150, 160, 170, 180, 190, 215, 225, 235, 245, 255, 265, 275, 285
  
};
int[]y= {
  485, 485, 485, 485, 485, 485, 485, 485, 485, 485, 485, 485, 485, 485, 485, 485
};
int[]xl= {
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
};
int[]yl= {
  7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
};


//constantes do céu
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

//constantes das nuvens
int num = 30;
int[] a = new int[num];
int[] b = new int[num];


void setup () {
  size (400, 600);

  //cores do céu
  c1 = color(#0A1A48);
  c2 = color(#6CABED);
}

void draw() {

  //Céu
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);

  //Nuvem

  if (mouseY>300) {

    for (int i = a.length-1; i > 0; i--) {
      a[i] = a[i-1];
      b[i] = b[i-1];
    }
    a[0] = mouseX;
    b[0] =mouseY;
    for (int i = 0; i < a.length; i++) {
      smooth();
      noStroke ();
      fill (120+i*9);
      ellipse(a[i], b[i], 100, 40);
    }
  }


  //Gramado
  noStroke();
  fill (81, 111, 85);
  rect (0, 580, 400, 20);

  //Base do edifício
  stroke (0);
  fill (255);
  quad (100, 580, 310, 580, 300, 495, 110, 495);

  //Porta de vidro
  stroke (0);
  fill (106, 160, 147);
  quad (150, 580, 260, 580, 250, 500, 160, 500);

  //Muro
  fill (134, 133, 124);
  quad (0, 580, 400, 580, 500, 495, 0, 540);

  //Arbusto
  colorMode(HSB);
  for (int x=0; x < width; x++) {
    float noiseVal = noise((x)*noiseScale, 
    mouseY*noiseScale);
    stroke(80, 200, map(noiseVal*255, 0, 255, 100, 150));
    line(x, map(mouseY, 0, height, height-100, height-75)+noiseVal*80, x, height-20);
  }

  colorMode(RGB);
  stroke(0);

    //estrutura do prédio
  if (mouseX<110) {
    fill (255);
    triangle (110, 495, 215, 495, 170, 100);
    triangle (215, 40, 260, 80, 240, 340);
    quad (205, 495, 300, 495, 215, 40, 160, 90);
    
    //blocos do prédio
    line (162, 105, 218, 55);
    line (165, 130, 223, 85);
    line (168, 162, 230, 123);
    line (172, 200, 238, 165);
    line (177, 243, 248, 220);
    line (183, 290, 259, 280);
    line (190, 350, 273, 350);
    line (197, 420, 285, 420);

    line (218, 55, 258, 95);
    line (223, 85, 257, 120);
    line (230, 123, 253, 152);
    line (238, 165, 252, 187);

    line (168, 162, 158, 175);
    line (172, 200, 153, 215);
    line (177, 243, 147, 257);
    line (183, 290, 140, 305);
    line (190, 350, 130, 360);
    line (285, 420, 122, 420);
  } 
  else if (mouseX>110) {
    fill (255);
    triangle (205, 495, 300, 495, 240, 100);
    triangle (215, 40, 160, 90, 160, 350);
    quad (110, 495, 205, 495, 260, 80, 215, 40);
    
    //blocos do prédio 2
    line (211, 55, 257, 98);
    line (253, 130, 205, 85);
    line (250, 164, 196, 123);
    line (245, 200, 186, 165);
    line (239, 243, 174, 220);
    line (232, 290, 160, 280);
    line (224, 350, 145, 350);
    line (128, 420, 215, 420);
    
    line (160, 105, 211, 56);
    line (160, 130, 205, 85);
    line (160, 165, 196, 123);
    line (160, 202, 186, 165);
    line (160, 240, 174, 220);
    
    line (245, 200, 258, 215);
    line (239, 243, 263, 257);
    line (232, 290, 270, 305);    
    line (224, 350, 280, 360);
    line (215, 420, 287, 420);


  }


  //janelas
   stroke (0,0,0);
  for (int i=0;i<16;i++) {
    rect(x[i], y[i], xl[i], yl[i]);
  }
}
//continuação do céu  
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {

  noFill();

  if (axis == Y_AXIS) {
    for (int i=y; i<=y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}

//imagem de apoio: http://www.hsb.se/polopoly_fs/1.64280.1241799525!/image/3563565965.jpg_gen/derivatives/fixedwidth400/3563565965.jpghttp://www.hsb.se/polopoly_fs/1.64280.1241799525!/image/3563565965.jpg_gen/derivatives/fixedwidth400/3563565965.jpg
