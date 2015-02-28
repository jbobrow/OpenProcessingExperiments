
//constantes arbustos
float noiseScale=0.01;
 
//constantes janelas
int[]x={210,213,222,201,182,165,150};
int[]y={490,490,490,490,490,490,490,490};
int[]xl={5,5,5,5,5,5,5,5};
int[]yl={7,7,7,7,7,7,7,7};
  
//constantes céu
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
   
//constantes nuvens
int num = 30;
int[] a = new int[num];
int[] b = new int[num];
   
   
void setup () {
  size (400, 600);
   
  //cores céu
  c1 = color(#0A1A48);
  c2 = color(#6CABED);
}
   
void draw() {
   
  //Céu
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
   
  //Nuvem
    
  if (mouseY>450) {
     
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
   
  //Base edifício
  stroke (0);
  fill (255);
  quad (100, 580, 310, 580, 300, 495, 110, 495);
 
  //Porta vidro
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
  
  //prédio parte 1 ERROR
//  quad(mouseX/5+100, 50, mouseX/5+150, 50, 200, 300, 150, 300);
  //60 55 50 45 40 35 30 25 20
  
  //prédio estrutura
   if (mouseX<110) {
  fill (255);
  triangle (110, 495, 215, 495, 170, 100);
  triangle (215, 40, 260, 80, 240, 340);
  quad (205, 495, 300, 495, 215, 40, 160, 90);
  //prédio blocos
  line (162,105,218,55);
  line (165,130,223,85);
  line (168,162,230,123);
  line (172,200,238,165);
  line (177,243,248,220);
  line (183,290,259,280);
  line (190,350,273,350);
  line (197,420,285,420);
  
  line (218,55,258,95);
  line (223,85,257,120);
  line (230,123,253,152);
  line (238,165,252,187);
  
  line (168,162,158,175);
  line (172,200,153,215);
  line (177,243,147,257);
  line (183,290,140,305);
  line (190,350,130,360);
  line (285,420,120,420);

   } else if (mouseX>110) {
     fill (255);
     triangle (205,495,300,495,240,100);
     triangle (215,40,160,90,160,350);
     quad (110,495,205,495,260,80,215,40);
     //prédio blocos
  line (211,55,257,98);
  line (160,105,211,56);
   }


//janelas
for (int i=0;i<7;i++) {
  rect(x[i],y[i],xl[i],yl[i]);
}
}
//cont. céu   
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
