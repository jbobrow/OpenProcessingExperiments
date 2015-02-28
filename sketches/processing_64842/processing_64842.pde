
int[] pointedx = new int[64];
int[] pointedy = new int[64];


void setup() {
  size(500, 500);
  strokeWeight(1);
  stroke(0);
  background(255);



  pointedx[0] = 183;
  pointedx[1] = 191;
  pointedx[2] = 294;
  pointedx[3] = 296;
  pointedx[4] = 297;
  pointedx[5] = 305;
  pointedx[6] = 326;
  pointedx[7] = 347;
  pointedx[8] = 354;
  pointedx[9] = 372;
  pointedx[10] = 375;
  pointedx[11] = 377;
  pointedx[12] = 402;
  pointedx[13] = 403;
  pointedx[14] = 224;
  pointedx[15] = 218;
  pointedx[16] = 216;
  pointedx[17] = 209;
  pointedx[18] = 196;
  pointedx[19] = 165;
  pointedx[20] = 125;
  pointedx[21] = 124;
  pointedx[22] = 101;
  pointedx[23] = 101;
  pointedx[24] = 270;
  pointedx[25] = 277;
  pointedx[26] = 280;
  pointedx[27] = 315;
  pointedx[28] = 353;
  pointedx[29] = 388;
  pointedx[30] = 387;
  pointedx[31] = 392;
  pointedx[32] = 381;
  pointedx[33] = 241;
  pointedx[34] = 230;
  pointedx[35] = 231;
  pointedx[36] = 203;
  pointedx[37] = 165;
  pointedx[38] = 109;
  pointedx[39] = 111;
  pointedx[40] = 223;
  pointedx[41] = 261;
  pointedx[42] = 282;
  pointedx[43] = 317;
  pointedx[44] = 345;
  pointedx[45] = 367;
  pointedx[46] = 375;
  pointedx[47] = 368;
  pointedx[48] = 281;
  pointedx[49] = 244;
  pointedx[50] = 209;
  pointedx[51] = 165;
  pointedx[52] = 128;
  pointedx[53] = 147;
  pointedx[54] = 203;
  pointedx[55] = 272;
  pointedx[56] = 317;
  pointedx[57] = 336;
  pointedx[58] = 357;
  pointedx[59] = 342;
  pointedx[60] = 272;
  pointedx[61] = 248;
  pointedx[62] = 186;
  pointedx[63] = 162;

  //--------------------



  pointedy[0] = 102;
  pointedy[1] = 99;
  pointedy[2] = 102;
  pointedy[3] = 108;
  pointedy[4] = 154;
  pointedy[5] = 171;
  pointedy[6] = 182;
  pointedy[7] = 184;
  pointedy[8] = 185;
  pointedy[9] = 160;
  pointedy[10] = 113;
  pointedy[11] = 102;
  pointedy[12] = 102;
  pointedy[13] = 404;
  pointedy[14] = 406;
  pointedy[15] = 404;
  pointedy[16] = 336;
  pointedy[17] = 304;
  pointedy[18] = 286;
  pointedy[19] = 287;
  pointedy[20] = 344;
  pointedy[21] = 402;
  pointedy[22] = 404;
  pointedy[23] = 124;
  pointedy[24] = 115;
  pointedy[25] = 120;
  pointedy[26] = 163;
  pointedy[27] = 197;
  pointedy[28] = 196;
  pointedy[29] = 153;
  pointedy[30] = 260;
  pointedy[31] = 381;
  pointedy[32] = 392;
  pointedy[33] = 396;
  pointedy[34] = 361;
  pointedy[35] = 319;
  pointedy[36] = 273;
  pointedy[37] = 265;
  pointedy[38] = 360;
  pointedy[39] = 143;
  pointedy[40] = 133;
  pointedy[41] = 150;
  pointedy[42] = 213;
  pointedy[43] = 223;
  pointedy[44] = 215;
  pointedy[45] = 257;
  pointedy[46] = 370;
  pointedy[47] = 377;
  pointedy[48] = 387;
  pointedy[49] = 313;
  pointedy[50] = 248;
  pointedy[51] = 243;
  pointedy[52] = 251;
  pointedy[53] = 172;
  pointedy[54] = 151;
  pointedy[55] = 232;
  pointedy[56] = 254;
  pointedy[57] = 250;
  pointedy[58] = 311;
  pointedy[59] = 363;
  pointedy[60] = 346;
  pointedy[61] = 250;
  pointedy[62] = 228;
  pointedy[63] = 134;
}

void draw() {

  //for (int i = 0; i < 63; i++) {

  //line(pointedx[i], pointedx[i+1], pointedy[i], pointedy[i+1]);
//  beginShape();
//  for (int i = 0; i < 63; i++) {
//    vertex(pointedx[i], pointedy[i]);
//    vertex(pointedx[i+1], pointedy[i+1]);
//  }
//  endShape();
noStroke();
fill(255,4);
rect(0,0, width, height);
noFill();
stroke(0);
for(int f = 0; f < 64; f++){
  for (int i = 0; i < f; i++) {
  line(pointedx[i], pointedy[i], pointedx[i+1], pointedy[i+1]);
}
}
  }


