
int numCountries = 10;
int numDecades = 18;

float xspeed;
float yspeed;

float xOrigin;
float yOrigin;


// 2D Array:
int[][] imByDec = new int[numCountries][numDecades];

// Extra arrays for you to keep track or display stuff on stage:
String[] country = new String[numCountries];
String[] decade = new String[numDecades];

//Migrating Objects
Person newPerson;



void setup() {
  size (800,600);
  background (224,217,207);
  newPerson = new Person();


  // Set up names:
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



  // GERMANY
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
  imByDec[3][0] = 16;  // Pol 1820s
  imByDec[3][1] = 369;  // Pol 1830s
  imByDec[3][2] = 105;  // Pol 1840s
  imByDec[3][3] = 1164;  // Pol 1850s
  imByDec[3][4] = 2027;  // Pol 1860s
  imByDec[3][5] = 12970;  // Pol 1870s
  imByDec[3][6] = 51806;  // Pol 1880s
  imByDec[3][7] = 96720;  // Pol 1890s
  //imByDec[3][8] = 0;  // Pol 1900s
  imByDec[3][9] = 4813;  // Pol 1910s
  imByDec[3][10] = 227734;  // Pol 1920s
  imByDec[3][11] = 17026;  // Pol 1930s
  imByDec[3][12] = 7571;  // Pol 1940s
  imByDec[3][13] = 9985;  // Pol 1950s
  imByDec[3][14] = 53539;  // Pol 1960s
  imByDec[3][15] = 37234;  // Pol 1970s
  imByDec[3][16] = 83252;  // Pol 1980s
  imByDec[3][17] = 163747;  // Pol 1990s

  // UK
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

  // CHINA
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
  //imByDec[7][0] = ;  // Japan 1820s
  //imByDec[7][1] = ;  // Japan 1830s
  //imByDec[7][2] = ;  // Japan 1840s
  //imByDec[7][3] = ;  // Japan 1850s
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
  imByDec[8][0] = 4817;  // Mex 1820s
  imByDec[8][1] = 6599;  // Mex 1830s
  imByDec[8][2] = 3271;  // Mex 1840s
  imByDec[8][3] = 3078;  // Mex 1850s
  imByDec[8][4] = 2191;  // Mex 1860s
  imByDec[8][5] = 5162;  // Mex 1870s
  //imByDec[8][6] = 1913;  // Mex 1880s
  //imByDec[8][7] = 971;  // Mex 1890s
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
}


void draw () {
  xspeed = .75 + xspeed;
  yspeed = .75 + yspeed;

  //GERMANY
  int[] germArray = imByDec[0];
  for (int i=0; i<imByDec[0][0]/20; i++) {
    float germXorigin = random(765, width+100);
    float germYorigin = random(40, 85);
    noStroke();
    fill(215,210,178);
    rect(germXorigin-xspeed, germYorigin+yspeed, 2,2);
  }

  //IRELAND
  int[] irelandArray = imByDec[1];
  for (int i=0; i<imByDec[1][0]/200; i++) {
    float irelandXorigin = random(755, width+100);
    float irelandYorigin = random(-30, 20);
    noStroke();
    fill(209,201,152);
    rect(irelandXorigin-xspeed*1.85, irelandYorigin+yspeed, 2,2);
    constrain(irelandXorigin,150,150);
  }

  //ITALY
  int[] italyArray = imByDec[2];
  for (int i=0; i<imByDec[2][0]/40; i++) {
    float italyXorigin = random(765, width+100);
    float italyYorigin = random(100, 250);
    noStroke();
    fill(170,109,78);
    rect(italyXorigin-xspeed, italyYorigin+.25*yspeed, 2,2);
  }
  
    //POLAND
  int[] polArray = imByDec[3];
  for (int i=0; i<imByDec[3][0]; i++) {
    float polXorigin = random(785, width+100);
    float polYorigin = random(35, 80);
    noStroke();
    fill(63,68,74);
    rect(polXorigin-xspeed, polYorigin+yspeed, 2,2);
  }
  
      //UK
  int[] ukArray = imByDec[4];
  for (int i=0; i<imByDec[4][0]/40; i++) {
    float ukXorigin = random(745, width+100);
    float ukYorigin = random(-15, 45);
    noStroke();
    fill(210,172,159);
    rect(ukXorigin-xspeed*1.25, ukYorigin+yspeed, 2,2);
  }
  
      //CHINA
  int[] chinaArray = imByDec[5];
  for (int i=0; i<imByDec[5][0]; i++) {
    float chinaXorigin = random(-100, 10);
    float chinaYorigin = random(200, 350);
    noStroke();
    fill(239,198,136);
    rect(chinaXorigin+xspeed, chinaYorigin, 2,2);
  }
  
  //INDIA
  int[] indiaArray = imByDec[6];
  for (int i=0; i<imByDec[6][0]; i++) {
    float indiaXorigin = random(-100, 0);
    float indiaYorigin = random(275, 400);
    noStroke();
    fill(168,193,200);
    rect(indiaXorigin+xspeed, (indiaYorigin-.25*yspeed), 2,2);
  }
  
  //JAPAN
  int[] japanArray = imByDec[7];
  for (int i=0; i<imByDec[7][0]; i++) {
    float japanXorigin = random(-10, 20);
    float japanYorigin = random(190, 250);
    noStroke();
    fill(148,99,92);
    rect(japanXorigin+xspeed, japanYorigin, 2,2);
  }
  
    //MEXICO
  int[] mexArray = imByDec[8];
  for (int i=0; i<imByDec[8][0]/200; i++) {
    float mexXorigin = random(width/4, width/2);
    float mexYorigin = random(height+10, height);
    noStroke();
    fill(189,147,105);
    rect(mexXorigin+xspeed*.15, mexYorigin-yspeed, 2,2);
  }

  //AFRICA
  int[] africaArray = imByDec[9]; // get the array at position 9
  for(int i = 0; i<imByDec[9][0]; i++) {
    float africaXorigin = random(width-100, width);
    float africaYorigin = random(500, height);
    noStroke();
    fill(94,69,72);
    rect(africaXorigin-xspeed, africaYorigin-yspeed, 2,2);

    //for(int i = 0; i < africaArray.length; i++){
    //  ellipse(imByDec[9][0],imByDec[9][3],40,40);
  }


}
class Person {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  Person() {
    c = color(255);
    xpos = width/2;
    ypos = height/2;
    xspeed = .005;
  }
  void display() {
    ellipseMode(CENTER);
    fill(c);
    ellipse(xpos,ypos, 20,20);
  }
  void move() {
    xpos = xpos+xspeed;
    if(xpos > width) {
      xpos = 0;
    }
  }
}

