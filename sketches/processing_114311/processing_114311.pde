
int c;
int h=625;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(750, 750);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,51,102,153,204,255,306,357,408,459,510,561,612,38,89,140,191,242,293,344,395,446,497,548,599,
624,25,76,127,178,229,280,331,382,433,484,535,586,12,63,114,165,216,267,318,369,420,471,522,573,
598,24,50,101,152,203,254,305,356,407,458,509,560,611,37,88,139,190,241,292,343,394,445,496,547,
572,623,49,75,126,177,228,279,330,381,432,483,534,585,11,62,113,164,215,266,317,368,419,470,521,
546,597,23,74,100,151,202,253,304,355,406,457,508,559,610,36,87,138,189,240,291,342,393,444,495,
520,571,622,48,99,125,176,227,278,329,380,431,482,533,584,10,61,112,163,214,265,316,367,418,469,
494,545,596,22,73,124,150,201,252,303,354,405,456,507,558,609,35,86,137,188,239,290,341,392,443,
468,519,570,621,47,98,149,175,226,277,328,379,430,481,532,583,9,60,111,162,213,264,315,366,417,
442,493,544,595,21,72,123,174,200,251,302,353,404,455,506,557,608,34,85,136,187,238,289,340,391,
416,467,518,569,620,46,97,148,199,225,276,327,378,429,480,531,582,8,59,110,161,212,263,314,365,
390,441,492,543,594,20,71,122,173,224,250,301,352,403,454,505,556,607,33,84,135,186,237,288,339,
364,415,466,517,568,619,45,96,147,198,249,275,326,377,428,479,530,581,7,58,109,160,211,262,313,
338,389,440,491,542,593,19,70,121,172,223,274,300,351,402,453,504,555,606,32,83,134,185,236,287,
312,363,414,465,516,567,618,44,95,146,197,248,299,325,376,427,478,529,580,6,57,108,159,210,261,
286,337,388,439,490,541,592,18,69,120,171,222,273,324,350,401,452,503,554,605,31,82,133,184,235,
260,311,362,413,464,515,566,617,43,94,145,196,247,298,349,375,426,477,528,579,5,56,107,158,209,
234,285,336,387,438,489,540,591,17,68,119,170,221,272,323,374,400,451,502,553,604,30,81,132,183,
208,259,310,361,412,463,514,565,616,42,93,144,195,246,297,348,399,425,476,527,578,4,55,106,157,
182,233,284,335,386,437,488,539,590,16,67,118,169,220,271,322,373,424,450,501,552,603,29,80,131,
156,207,258,309,360,411,462,513,564,615,41,92,143,194,245,296,347,398,449,475,526,577,3,54,105,
130,181,232,283,334,385,436,487,538,589,15,66,117,168,219,270,321,372,423,474,500,551,602,28,79,
104,155,206,257,308,359,410,461,512,563,614,40,91,142,193,244,295,346,397,448,499,525,576,2,53,
78,129,180,231,282,333,384,435,486,537,588,14,65,116,167,218,269,320,371,422,473,524,550,601,27,
52,103,154,205,256,307,358,409,460,511,562,613,39,90,141,192,243,294,345,396,447,498,549,575,1,
26,77,128,179,230,281,332,383,434,485,536,587,13,64,115,166,217,268,319,370,421,472,523,574,600,
};
void draw() {
  for (int j= 0; j < 750; j=j+30) {
    for (int i= 0; i < 750; i=i+30) {
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



