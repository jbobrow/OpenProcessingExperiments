
//London Eye
//Erich M. Zimmermann
//Arquitetura e Urbanismo
//Computação I - Prof. Luiz Ernesto Merkle - UTFPR


//variáveis
color bg1;
color bg2;

float noiseScale = 0.01;
float m;

float [] px;
float [] py;

float [] qx;
float [] qy;
float [] rx;
float [] ry;

float [] bgbx;
float [] bgby;


//setup
void setup () {
  size (800, 600);
  ellipseMode(CENTER);
  colorMode(RGB);
  smooth();

  bg1 = color(8, 50, 108);
  bg2 = color(45, 135, 200);

  px = new float [16];
  py = new float [16];
  qx = new float [16];
  qy = new float [16];
  rx = new float [32];
  ry = new float [32];
  bgbx = new float[800];
  bgby = new float[800];

  for (int h = 0; h < 800; h++) {
    bgby [h] = random(140, 300);
    bgbx [h] = random(33, 100);
  } 

  for (int i = 0; i < 16; i++) {
    px [i] = 200.5*cos(PI/8*i);
    py [i] = 200.5*sin(PI/8*i);
    qx [i] = 175*cos(PI/8*i);
    qy [i] = 175*sin(PI/8*i);
  }

  for (int j = 0; j < 32; j=j+1) {
    rx [j] = 200*cos(PI/16*j);
    ry [j] = 200*sin(PI/16*j);
  }
}

//draw
void draw () {
  colorMode(RGB);

  //fundo
  color grad;
  strokeWeight(1);
  for (int bg = 0; bg < height; bg=bg+1) {
    grad = lerpColor(bg1, bg2, map(bg, 1, height-1, 0, 1));
    stroke(grad);
    line(0, bg, width, bg);
  }


  
  //construções fundo
  noStroke();   
  fill(200, 147);
  for (int g = 0; g < width; g=g+37) {
    rect(g, height-bgby [g], bgbx [g], height);
  }


  //muro
  stroke(0);
  strokeWeight(2);
  fill(130, 131, 119);
  rect(-10, height-80, width*2, height*2);


  //etc
  m = millis()/25;


  //suporte
  strokeWeight(5);
  noFill();
  stroke(175);

  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/1.6);
  line(-10, -10, -width/2, -height/2);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(10.09);
  line(-13, -8, -width/2, -height/2);
  ellipse(0, 0, 20, 20);
  popMatrix();
  

  //roda gigante
  pushMatrix();
  translate(width/2, height/2);
  rotate(m/1000);

  //linhas finas
  for (int i = 0; i < 16; i++) {
    strokeWeight(1);
    stroke(0);
    line(px [i]*0.06, py [i]*0.06, px [i]*0.87, py [i]*0.87);
  }

  //círculos
  strokeWeight(5.5);
  stroke(25);
  ellipse(0, 0, 401, 401);
  ellipse(0, 0, 350, 350);
  ellipse(0, 0, 25, 25);

  //linhas grossas
  strokeWeight(5);
  line(qx[1], qy[1], rx[1], ry[1]);
  line(rx[3], ry[3], qx[1], qy[1]);
  line(rx[3], ry[3], qx[2], qy[2]);
  line(qx[2], qy[2], rx[5], ry[5]);
  line(rx[5], ry[5], qx[3], qy[3]);
  line(qx[3], qy[3], rx[7], ry[7]);
  line(rx[7], ry[7], qx[4], qy[4]);
  line(qx[4], qy[4], rx[9], ry[9]);
  line(rx[9], ry[9], qx[5], qy[5]);
  line(qx[5], qy[5], rx[11], ry[11]);
  line(rx[11], ry[11], qx[6], qy[6]);
  line(qx[6], qy[6], rx[13], ry[13]);
  line(rx[13], ry[13], qx[7], qy[7]);
  line(qx[7], qy[7], rx[15], ry[15]);
  line(rx[15], ry[15], qx[8], qy[8]);
  line(qx[8], qy[8], rx[17], ry[17]);
  line(rx[17], ry[17], qx[9], qy[9]);
  line(qx[9], qy[9], rx[19], ry[19]);
  line(rx[19], ry[19], qx[10], qy[10]);
  line(qx[10], qy[10], rx[21], ry[21]);
  line(rx[21], ry[21], qx[11], qy[11]);
  line(qx[11], qy[11], rx[23], ry[23]);
  line(rx[23], ry[23], qx[12], qy[12]);
  line(qx[12], qy[12], rx[25], ry[25]);
  line(rx[25], ry[25], qx[13], qy[13]);
  line(qx[13], qy[13], rx[27], ry[27]);
  line(rx[27], ry[27], qx[14], qy[14]);
  line(qx[14], qy[14], rx[29], ry[29]);
  line(rx[29], ry[29], qx[15], qy[15]);
  line(qx[15], qy[15], rx[31], ry[31]);
  line(rx[31], ry[31], 175, 0);
  line(175, 0, rx[1], ry[1]);
  
  //luzes
  for (int i = 0; i < 16; i++) {
    strokeWeight(10);
    colorMode(HSB);
    stroke(random(150, 255), random(100, 125), random(150, 255));
    point(px [i], py [i]);

    strokeWeight(5);
    stroke(random(150, 255), random(150, 255), random(150, 255));
    point(qx [i], qy [i]);
  }

  popMatrix();


  //água
  for (int x=0; x < width; x++) {
    float noiseVal = noise((m+x)*noiseScale, m*noiseScale);
    stroke(142, 200, map(noiseVal*255, 0, 255, 100, 255));
    line(x, map(m/1000, 0, height, height-90, height-75)+noiseVal*80, x, height);
  }
}
