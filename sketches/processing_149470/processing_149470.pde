
int i,j;
int hashfrontrows = 28;
int hashfrontcols = 2;
int hashsides = 8;
int hashsiderows = 4;
int hashsidecols = 2;
int hashtops = 8;
int hashtoprows = 4;
int hashtopcols = 2;

int hashfront[][] = new int[hashfrontrows][hashfrontcols];
int hashside[][][] = new int[hashsides][hashsiderows][hashsidecols];
int hashtop[][][] = new int[hashtops][hashtoprows][hashtopcols];

hashfront[0][0] = 4; hashfront[0][1] = 9;
hashfront[1][0] = 4; hashfront[1][1] = 11;
hashfront[2][0] = 6; hashfront[2][1] = 10;
hashfront[3][0] = 6; hashfront[3][1] = 12;
hashfront[4][0] = 4; hashfront[4][1] = 13;
hashfront[5][0] = 4; hashfront[5][1] = 15;
hashfront[6][0] = 6; hashfront[6][1] = 14;
hashfront[7][0] = 6; hashfront[7][1] = 16;
hashfront[8][0] = 8; hashfront[8][1] = 15;
hashfront[9][0] = 8; hashfront[9][1] = 13;
hashfront[10][0] = 10; hashfront[10][1] = 12;
hashfront[11][0] = 10; hashfront[11][1] = 14;
hashfront[12][0] = 12; hashfront[12][1] = 13;
hashfront[13][0] = 12; hashfront[13][1] = 11;
hashfront[14][0] = 14; hashfront[14][1] = 10;
hashfront[15][0] = 14; hashfront[15][1] = 8;
hashfront[16][0] = 12; hashfront[16][1] = 9;
hashfront[17][0] = 12; hashfront[17][1] = 7;
hashfront[18][0] = 14; hashfront[18][1] = 6;
hashfront[19][0] = 14; hashfront[19][1] = 4;
hashfront[20][0] = 12; hashfront[20][1] = 5;
hashfront[21][0] = 12; hashfront[21][1] = 3;
hashfront[22][0] = 10; hashfront[22][1] = 4;
hashfront[23][0] = 10; hashfront[23][1] = 6;
hashfront[24][0] = 8; hashfront[24][1] = 7;
hashfront[25][0] = 8; hashfront[25][1] = 5;
hashfront[26][0] = 6; hashfront[26][1] = 6;
hashfront[27][0] = 6; hashfront[27][1] = 8;

hashside[0][0][0] = 4; hashside[0][0][1] = 5;
hashside[0][1][0] = 6; hashside[0][1][1] = 6;
hashside[0][2][0] = 6; hashside[0][2][1] = 8;
hashside[0][3][0] = 4; hashside[0][3][1] = 7;

hashside[1][0][0] = 2; hashside[1][0][1] = 8;
hashside[1][1][0] = 4; hashside[1][1][1] = 9;
hashside[1][2][0] = 4; hashside[1][2][1] = 11;
hashside[1][3][0] = 2; hashside[1][3][1] = 10;

hashside[2][0][0] = 2; hashside[2][0][1] = 12;
hashside[2][1][0] = 4; hashside[2][1][1] = 13;
hashside[2][2][0] = 4; hashside[2][2][1] = 15;
hashside[2][3][0] = 2; hashside[2][3][1] = 14;

hashside[3][0][0] = 8; hashside[3][0][1] = 3;
hashside[3][1][0] = 10; hashside[3][1][1] = 4;
hashside[3][2][0] = 10; hashside[3][2][1] = 6;
hashside[3][3][0] = 8; hashside[3][3][1] = 5;

hashside[4][0][0] = 4; hashside[4][0][1] = 11;
hashside[4][1][0] = 6; hashside[4][1][1] = 10;
hashside[4][2][0] = 6; hashside[4][2][1] = 12;
hashside[4][3][0] = -1; hashside[4][3][1] = -1;

hashside[5][0][0] = 4; hashside[5][0][1] = 15;
hashside[5][1][0] = 6; hashside[5][1][1] = 14;
hashside[5][2][0] = 6; hashside[5][2][1] = 16;
hashside[5][3][0] = -1; hashside[5][3][1] = -1;

hashside[6][0][0] = 8; hashside[6][0][1] = 13;
hashside[6][1][0] = 10; hashside[6][1][1] = 14;
hashside[6][2][0] = 10; hashside[6][2][1] = 12;
hashside[6][3][0] = -1; hashside[6][3][1] = -1;

hashside[7][0][0] = 8; hashside[7][0][1] = 9;
hashside[7][1][0] = 10; hashside[7][1][1] = 10;
hashside[7][2][0] = 10; hashside[7][2][1] = 8;
hashside[7][3][0] = -1; hashside[7][3][1] = -1;

hashtop[0][0][0] = 2; hashtop[0][0][1] = 8;
hashtop[0][1][0] = 4; hashtop[0][1][1] = 9;
hashtop[0][2][0] = 6; hashtop[0][2][1] = 8;
hashtop[0][3][0] = 4; hashtop[0][3][1] = 7;

hashtop[1][0][0] = 2; hashtop[1][0][1] = 12;
hashtop[1][1][0] = 4; hashtop[1][1][1] = 13;
hashtop[1][2][0] = 6; hashtop[1][2][1] = 12;
hashtop[1][3][0] = 4; hashtop[1][3][1] = 11;

hashtop[2][0][0] = 4; hashtop[2][0][1] = 5;
hashtop[2][1][0] = 6; hashtop[2][1][1] = 6;
hashtop[2][2][0] = 8; hashtop[2][2][1] = 5;
hashtop[2][3][0] = 6; hashtop[2][3][1] = 4;

hashtop[3][0][0] = 8; hashtop[3][0][1] = 3;
hashtop[3][1][0] = 10; hashtop[3][1][1] = 4;
hashtop[3][2][0] = 12; hashtop[3][2][1] = 3;
hashtop[3][3][0] = 10; hashtop[3][3][1] = 2;

hashtop[4][0][0] = 8; hashtop[4][0][1] = 5;
hashtop[4][1][0] = 8; hashtop[4][1][1] = 7;
hashtop[4][2][0] = 10; hashtop[4][2][1] = 6;
hashtop[4][3][0] = -1; hashtop[4][3][1] = -1;

hashtop[5][0][0] = 12; hashtop[5][0][1] = 3;
hashtop[5][1][0] = 12; hashtop[5][1][1] = 5;
hashtop[5][2][0] = 14; hashtop[5][2][1] = 4;
hashtop[5][3][0] = -1; hashtop[5][3][1] = -1;

hashtop[6][0][0] = 12; hashtop[6][0][1] = 7;
hashtop[6][1][0] = 12; hashtop[6][1][1] = 9;
hashtop[6][2][0] = 14; hashtop[6][2][1] = 8;
hashtop[6][3][0] = -1; hashtop[6][3][1] = -1;

hashtop[7][0][0] = 8; hashtop[7][0][1] = 9;
hashtop[7][1][0] = 10; hashtop[7][1][1] = 10;
hashtop[7][2][0] = 8; hashtop[7][2][1] = 11;
hashtop[7][3][0] = -1; hashtop[7][3][1] = -1;

size(480,540);
background(192);
noStroke();
fill(255);

beginShape();
  for (i=0; i<hashfrontrows; i++)
    vertex(30*hashfront[i][0], 30*hashfront[i][1]);
endShape(CLOSE);

fill(127);
for (j=0; j<hashsides; j++) {
  beginShape();
    for (i=0; i<hashsiderows; i++)
      if (hashside[j][i][0]!=-1)
        vertex(30*hashside[j][i][0], 30*hashside[j][i][1]);
  endShape(CLOSE);
}

fill(64);
for (j=0; j<hashtops; j++) {
  beginShape();
    for (i=0; i<hashtoprows; i++)
      if (hashtop[j][i][0]!=-1)
        vertex(30*hashtop[j][i][0], 30*hashtop[j][i][1]);
  endShape(CLOSE);
}
