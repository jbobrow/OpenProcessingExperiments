
int c;
int h=441;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(630, 630);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,43,86,129,172,215,258,301,344,387,430,32,75,118,161,204,247,290,333,376,419,
440,21,64,107,150,193,236,279,322,365,408,10,53,96,139,182,225,268,311,354,397,
418,20,42,85,128,171,214,257,300,343,386,429,31,74,117,160,203,246,289,332,375,
396,439,41,63,106,149,192,235,278,321,364,407,9,52,95,138,181,224,267,310,353,
374,417,19,62,84,127,170,213,256,299,342,385,428,30,73,116,159,202,245,288,331,
352,395,438,40,83,105,148,191,234,277,320,363,406,8,51,94,137,180,223,266,309,
330,373,416,18,61,104,126,169,212,255,298,341,384,427,29,72,115,158,201,244,287,
308,351,394,437,39,82,125,147,190,233,276,319,362,405,7,50,93,136,179,222,265,
286,329,372,415,17,60,103,146,168,211,254,297,340,383,426,28,71,114,157,200,243,
264,307,350,393,436,38,81,124,167,189,232,275,318,361,404,6,49,92,135,178,221,
242,285,328,371,414,16,59,102,145,188,210,253,296,339,382,425,27,70,113,156,199,
220,263,306,349,392,435,37,80,123,166,209,231,274,317,360,403,5,48,91,134,177,
198,241,284,327,370,413,15,58,101,144,187,230,252,295,338,381,424,26,69,112,155,
176,219,262,305,348,391,434,36,79,122,165,208,251,273,316,359,402,4,47,90,133,
154,197,240,283,326,369,412,14,57,100,143,186,229,272,294,337,380,423,25,68,111,
132,175,218,261,304,347,390,433,35,78,121,164,207,250,293,315,358,401,3,46,89,
110,153,196,239,282,325,368,411,13,56,99,142,185,228,271,314,336,379,422,24,67,
88,131,174,217,260,303,346,389,432,34,77,120,163,206,249,292,335,357,400,2,45,
66,109,152,195,238,281,324,367,410,12,55,98,141,184,227,270,313,356,378,421,23,
44,87,130,173,216,259,302,345,388,431,33,76,119,162,205,248,291,334,377,399,1,
22,65,108,151,194,237,280,323,366,409,11,54,97,140,183,226,269,312,355,398,420,
};
void draw() {
  for (int j= 0; j < 630; j=j+30) {
    for (int i= 0; i < 630; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+2, i+22);
      z=z+1;
    }
  }z=0;
}









