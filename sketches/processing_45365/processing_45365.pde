
int numCountries = 10;
int numDecades = 18;
int currentdec = 0;

float xspeed = .5;
float yspeed = .5;
float x;
float y;

float xOrigin;
float yOrigin;

// 2D Array:
int[][] imByDec = new int[numCountries][numDecades];
float[][] imByDecX = new float[numCountries][numDecades];
float[][] imByDecY = new float[numCountries][numDecades];


// Other arrays:
String[] country = new String[numCountries];
float[]  xOriginMin = new float[numCountries];
float[]  xOriginMax = new float[numCountries];
float[]  yOriginMin = new float[numCountries];
float[]  yOriginMax = new float[numCountries];
float[] cSpeedX = new float[numCountries];
float[] cSpeedY = new float[numCountries];
float[] countrysize = new float[numCountries];


//Color Array:
color[] cColor = new color[numCountries];

String[] decade = new String[numDecades];

//Image:
PImage usa;

void setup() {
  size (800, 600);
  smooth();


  // Names:
  country[0] = "Germ";
  country[1] = "Ireland";
  country[2] = "Italy";
  country[3] = "Pol";
  country[4] = "UK";
  country[5] = "China";
  country[6] = "India";
  country[7] = "Japan";
  country[8] = "Mex";
  country[9] = "Africa";

  //Decades:
  decade[0] = "1820s";
  decade[1] = "1830s";
  decade[2] = "1840s";
  decade[3] = "1850s";
  decade[4] = "1860s";
  decade[5] = "1870s";
  decade[6] = "1880s";
  decade[7] = "1890s";
  decade[8] = "1900s";
  decade[9] = "1910s";
  decade[10] = "1920s";
  decade[11] = "1930s";
  decade[12] = "1940s";
  decade[13] = "1950s";
  decade[14] = "1960s";
  decade[15] = "1970s";
  decade[16] = "1980s";
  decade[17] = "1990s";


  //Set values for Country Arrays:
  // UK
  xOriginMin[4] = width+90;
  xOriginMax[4] = width+100;
  yOriginMin[4] = 20;
  yOriginMax[4] = 25;
  cSpeedX[4] = -xspeed*1.25;
  cSpeedY[4] = yspeed;
  cColor[4] = color(0, 167, 248, 30);
  countrysize[4] = 70;

  imByDec[4][0] = 25079;  // UK 1820s
  imByDec[4][1] = 75810;  // UK 1830s
  imByDec[4][2] = 267044;  // UK 1840s
  imByDec[4][3] = 423974;  // UK 1850s
  imByDec[4][4] = 606896;  // UK 1860s
  imByDec[4][5] = 548043;  // UK 1870s
  imByDec[4][6] = 807357;  // UK 1880s
  imByDec[4][7] = 271538;  // UK 1890s
  imByDec[4][8] = 525950;  // UK 1900s
  imByDec[4][9] = 341408;  // UK 1910s
  imByDec[4][10] = 339570;  // UK 1920s
  imByDec[4][11] = 31572;  // UK 1930s
  imByDec[4][12] = 139306;  // UK 1940s
  imByDec[4][13] = 202824;  // UK 1950s
  imByDec[4][14] = 213822;  // UK 1960s
  imByDec[4][15] = 137374;  // UK 1970s
  imByDec[4][16] = 159173;  // UK 1980s
  imByDec[4][17] = 151866;  // UK 1990s
  
  // GERMANY
  xOriginMin[0] = width+90;
  xOriginMax[0] = width+100;
  yOriginMin[0] = 50;
  yOriginMax[0] = 60;
  cSpeedX[0] = -xspeed;
  cSpeedY[0] = yspeed;
  cColor[0] = color(0, 245, 177, 20);
  countrysize[0] = 50;

  imByDec[0][0] = 6761;  // Germ 1820s
  imByDec[0][1] = 152454;  // Germ 1830s
  imByDec[0][2] = 434626;  // Germ 1840s
  imByDec[0][3] = 951667;  // Germ 1850s
  imByDec[0][4] = 787468;  // Germ 1860s
  imByDec[0][5] = 718182;  // Germ 1870s
  imByDec[0][6] = 1452970;  // Germ 1880s
  imByDec[0][7] = 505152;  // Germ 1890s
  imByDec[0][8] = 341498;  // Germ 1910s
  imByDec[0][9] = 143945;  // Germ 1910s
  imByDec[0][10] = 412212;  // Germ 1920s
  imByDec[0][11] = 114058;  // Germ 1930s
  imByDec[0][12] = 226578;  // Germ 1940s
  imByDec[0][13] = 477765;  // Germ 1950s
  imByDec[0][14] = 190796;  // Germ 1960s
  imByDec[0][15] = 74414;  // Germ 1970s
  imByDec[0][16] = 91961;  // Germ 1980s
  imByDec[0][17] = 92606;  // Germ 1990s

  // IRELAND
  xOriginMin[1]=width+90;
  xOriginMax[1]=width+100;
  yOriginMin[1]= 15;
  yOriginMax[1]= 20;
  cSpeedX[1] = -xspeed*1.75;
  cSpeedY[1] = yspeed;
  cColor[1] = color(236, 253, 4, 60);
  countrysize[1] = 30;

  imByDec[1][0] = 50724;  // Ireland 1820s
  imByDec[1][1] = 207381;  // Ireland 1830s
  imByDec[1][2] = 780719;  // Ireland 1840s
  imByDec[1][3] = 914119;  // Ireland 1850s
  imByDec[1][4] = 435778;  // Ireland 1860s
  imByDec[1][5] = 436871;  // Ireland 1870s
  imByDec[1][6] = 655482;  // Ireland 1880s
  imByDec[1][7] = 388416;  // Ireland 1890s
  imByDec[1][8] = 339065;  // Ireland 1900s
  imByDec[1][9] = 146181;  // Ireland 1910s
  imByDec[1][10] = 211234;  // Ireland 1920s
  imByDec[1][11] = 10973;  // Ireland 1930s
  imByDec[1][12] = 19789;  // Ireland 1940s
  imByDec[1][13] = 48362;  // Ireland 1950s
  imByDec[1][14] = 32966;  // Ireland 1960s
  imByDec[1][15] = 11490;  // Ireland 1970s
  imByDec[1][16] = 31969;  // Ireland 1980s
  imByDec[1][17] = 56950;  // Ireland 1990s

  // ITALY
  xOriginMin[2]=width+50;
  xOriginMax[2]=width+60;
  yOriginMin[2]=200;
  yOriginMax[2]=210;
  cSpeedX[2] = -xspeed;
  cSpeedY[2] = .15*yspeed;
  cColor[2] = color(44, 75, 233, 120);
  countrysize[2] = 50;

  imByDec[2][0] = 409;  // Italy 1820s
  imByDec[2][1] = 2253;  // Italy 1830s
  imByDec[2][2] = 1870;  // Italy 1840s
  imByDec[2][3] = 9231;  // Italy 1850s
  imByDec[2][4] = 11725;  // Italy 1860s
  imByDec[2][5] = 55759;  // Italy 1870s
  imByDec[2][6] = 307309;  // Italy 1880s
  imByDec[2][7] = 651893;  // Italy 1890s
  imByDec[2][8] = 2045877;  // Italy 1900s
  imByDec[2][9] = 1109524;  // Italy 1910s
  imByDec[2][10] = 455315;  // Italy 1920s
  imByDec[2][11] = 68028;  // Italy 1930s
  imByDec[2][12] = 57661;  // Italy 1940s
  imByDec[2][13] = 185491;  // Italy 1950s
  imByDec[2][14] = 214111;  // Italy 1960s
  imByDec[2][15] = 129368;  // Italy 1970s
  imByDec[2][16] = 67254;  // Italy 1980s
  imByDec[2][17] = 62722;  // Italy 1990s

  // POLAND
  xOriginMin[3] = width+50;
  xOriginMax[3] = width+55;
  yOriginMin[3] = 180;
  yOriginMax[3] = 190;
  cSpeedX[3] = -xspeed;
  cSpeedY[3] = .15*yspeed;
  cColor[3] = color(168, 27, 139, 100);
  countrysize[3] = 50;

  imByDec[3][0] = 16;  // Pol 1820s
  imByDec[3][1] = 369;  // Pol 1830s
  imByDec[3][2] = 105;  // Pol 1840s
  imByDec[3][3] = 1164;  // Pol 1850s
  imByDec[3][4] = 2027;  // Pol 1860s
  imByDec[3][5] = 12970;  // Pol 1870s
  imByDec[3][6] = 51806;  // Pol 1880s
  imByDec[3][7] = 96720;  // Pol 1890s
  imByDec[3][8] = 0;  // Pol 1900s
  imByDec[3][9] = 4813;  // Pol 1910s
  imByDec[3][10] = 227734;  // Pol 1920s
  imByDec[3][11] = 17026;  // Pol 1930s
  imByDec[3][12] = 7571;  // Pol 1940s
  imByDec[3][13] = 9985;  // Pol 1950s
  imByDec[3][14] = 53539;  // Pol 1960s
  imByDec[3][15] = 37234;  // Pol 1970s
  imByDec[3][16] = 83252;  // Pol 1980s
  imByDec[3][17] = 163747;  // Pol 1990s

 

  // CHINA
  xOriginMin[5] = -100;
  xOriginMax[5] = -90;
  yOriginMin[5] = 250;
  yOriginMax[5] = 260;
  cSpeedX[5]  = xspeed;
  cSpeedY[5]  = y;
  cColor[5] = color(97, 222, 67, 60);
  countrysize[5] = 200;

  imByDec[5][0] = 2;  // China 1820s
  imByDec[5][1] = 8;  // China 1830s
  imByDec[5][2] = 35;  // China 1840s
  imByDec[5][3] = 41397;  // China 1850s
  imByDec[5][4] = 64301;  // China 1860s
  imByDec[5][5] = 123201;  // China 1870s
  imByDec[5][6] = 61711;  // China 1880s
  imByDec[5][7] = 14799;  // China 1890s
  imByDec[5][8] = 20605;  // China 1900s
  imByDec[5][9] = 21278;  // China 1910s
  imByDec[5][10] = 29907;  // China 1920s
  imByDec[5][11] = 4928;  // China 1930s
  imByDec[5][12] = 16709;  // China 1940s
  imByDec[5][13] = 9657;  // China 1950s
  imByDec[5][14] = 34764;  // China 1960s
  imByDec[5][15] = 124326;  // China 1970s
  imByDec[5][16] = 346747;  // China 1980s
  imByDec[5][17] = 419114;  // China 1990s

  // INDIA
  xOriginMin[6] = -100;
  xOriginMax[6] = -90;
  yOriginMin[6] = 350;
  yOriginMax[6] = 360;
  cSpeedX[6]  = xspeed;
  cSpeedY[6]  = -yspeed*.25;
  cColor[6] = color(247, 28, 48, 100);
  countrysize[6] = 200;

  imByDec[6][0] = 8;  // India 1820s
  imByDec[6][1] = 39;  // India 1830s
  imByDec[6][2] = 36;  // India 1840s
  imByDec[6][3] = 43;  // India 1850s
  imByDec[6][4] = 69;  // India 1860s
  imByDec[6][5] = 163;  // India 1870s
  imByDec[6][6] = 269;  // India 1880s
  imByDec[6][7] = 68;  // India 1890s
  imByDec[6][8] = 4713;  // India 1900s
  imByDec[6][9] = 2082;  // India 1910s
  imByDec[6][10] = 1886;  // India 1920s
  imByDec[6][11] = 496;  // India 1930s
  imByDec[6][12] = 1761;  // India 1940s
  imByDec[6][13] = 1973;  // India 1950s
  imByDec[6][14] = 27189;  // India 1960s
  imByDec[6][15] = 164134;  // India 1970s
  imByDec[6][16] = 250786;  // India 1980s
  imByDec[6][17] = 363060;  // India 1990s

  // JAPAN
  xOriginMin[7] = -100;
  xOriginMax[7] = -90;
  yOriginMin[7] = 250;
  yOriginMax[7] = 260;
  cSpeedX[7]  = xspeed;
  cSpeedY[7]  = y;
  cColor[7] = color(237, 23, 253, 60);
  countrysize[7] = 50;

  imByDec[7][0] = 0;  // Japan 1820s
  imByDec[7][1] = 0;  // Japan 1830s
  imByDec[7][2] = 0;  // Japan 1840s
  imByDec[7][3] = 0;  // Japan 1850s
  imByDec[7][4] = 186;  // Japan 1860s
  imByDec[7][5] = 149;  // Japan 1870s
  imByDec[7][6] = 2270;  // Japan 1880s
  imByDec[7][7] = 25942;  // Japan 1890s
  imByDec[7][8] = 129797;  // Japan 1900s
  imByDec[7][9] = 83837;  // Japan 1910s
  imByDec[7][10] = 33462;  // Japan 1920s
  imByDec[7][11] = 1948;  // Japan 1930s
  imByDec[7][12] = 1555;  // Japan 1940s
  imByDec[7][13] = 46250;  // Japan 1950s
  imByDec[7][14] = 39988;  // Japan 1960s
  imByDec[7][15] = 267638;  // Japan 1970s
  imByDec[7][16] = 333746;  // Japan 1980s
  imByDec[7][17] = 164166;  // Japan 1990s

  // MEXICO
  xOriginMin[8] = width/5;
  xOriginMax[8] = width/4;
  yOriginMin[8] = height+10;
  yOriginMax[8] = height;
  cSpeedX[8]  = xspeed*.75;
  cSpeedY[8]  = -yspeed;
  cColor[8] = color(240, 158, 21, 120);
  countrysize[8] = 100;

  imByDec[8][0] = 4817;  // Mex 1820s
  imByDec[8][1] = 6599;  // Mex 1830s
  imByDec[8][2] = 3271;  // Mex 1840s
  imByDec[8][3] = 3078;  // Mex 1850s
  imByDec[8][4] = 2191;  // Mex 1860s
  imByDec[8][5] = 5162;  // Mex 1870s
  imByDec[8][6] = 0;  // Mex 1880s
  imByDec[8][7] = 0;  // Mex 1890s
  imByDec[8][8] = 49642;  // Mex 1900s
  imByDec[8][9] = 219004;  // Mex 1910s
  imByDec[8][10] = 459287;  // Mex 1920s
  imByDec[8][11] = 22319;  // Mex 1930s
  imByDec[8][12] = 60589;  // Mex 1940s
  imByDec[8][13] = 299811;  // Mex 1950s
  imByDec[8][14] = 453937;  // Mex 1960s
  imByDec[8][15] = 640294;  // Mex 1970s
  imByDec[8][16] = 1655843;  // Mex 1980s
  imByDec[8][17] = 2249421;  // Mex 1990s

  // AFRICA
  xOriginMin[9] = width-100;
  xOriginMax[9] = width-90;
  yOriginMin[9] = height+10;
  yOriginMax[9] = height;
  cSpeedX[9]  = -xspeed*.15;
  cSpeedY[9]  = -yspeed;
  cColor[9] = color(70, 53, 120);
  countrysize[9] = 200;

  imByDec[9][0] = 16;  // Africa 1820s
  imByDec[9][1] = 54;  // Africa 1830s
  imByDec[9][2] = 55;  // Africa 1840s
  imByDec[9][3] = 210;  // Africa 1850s
  imByDec[9][4] = 312;  // Africa 1860s
  imByDec[9][5] = 358;  // Africa 1870s
  imByDec[9][6] = 857;  // Africa 1880s
  imByDec[9][7] = 350;  // Africa 1890s
  imByDec[9][8] = 7368;  // Africa 1900s
  imByDec[9][9] = 8443;  // Africa 1910s
  imByDec[9][10] = 6286;  // Africa 1920s
  imByDec[9][11] = 1750;  // Africa 1930s
  imByDec[9][12] = 7367;  // Africa 1940s
  imByDec[9][13] = 14092;  // Africa 1950s
  imByDec[9][14] = 28954;  // Africa 1960s
  imByDec[9][15] = 80779;  // Africa 1970s
  imByDec[9][16] = 176893;  // Africa 1980s
  imByDec[9][17] = 354939;  // Africa 1990s


  //Set origins for each population
  for (int c = 0; c<numCountries; c++) {
    for (int d = 0; d<numDecades; d++) {
      imByDecX[c][d] = random(xOriginMin[c], xOriginMax[c]);
      imByDecY[c][d] = random(yOriginMin[c], yOriginMax[c]);
    }
  }
}



void draw() {
  background (255);


  noStroke();
  for (int c = 0; c<numCountries; c++) {
    fill (cColor[c]);
    for (int d = 0; d<currentdec; d++) {
      int[] CountryArray = imByDec[c]; // get the array at position 9
      float numPop = map(imByDec[c][d], 0, 2249421, 1, 10000); //calling populations from Africa, mapping the size
      imByDecX[c][d] += cSpeedX[c];
      imByDecY[c][d] += cSpeedY[c];
      float x = imByDecX[c][d];
      float y = imByDecY[c][d];

      for (int p = 0; p<numPop; p++) { 
        float distance = random(0, countrysize[c]); //africa Xorigin, dots fill in the circle from 0-100
        float ang = random(0, 360); // angle is somewhere random along the circle circumference in degrees
        float cPopX = distance*cos(ang) +x;
        float cPopY = distance*sin(ang) +y;
        rect(cPopX, cPopY, 4, 4);
      }
    }
  }
  if (mousePressed) {
    usa = loadImage("usa.png");
    //imageMode(CENTER);
    image(usa, 0, 0, 800, 600);
  }
}



void keyPressed() {

  // - or + will change currentdec
  if (key == '-') {
    currentdec--; 
    if (currentdec < 0 ) {
      currentdec = 0;
    }
  }

  if (key == '=') {
    currentdec++; 
    if (currentdec > numDecades) {
      currentdec = numDecades;
    }
  }
  println("decade shown" + decade[currentdec]);
}
                
