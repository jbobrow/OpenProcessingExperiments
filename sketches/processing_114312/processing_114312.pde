
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
7,38,68,98,102,133,164,194,224,253,285,315,345,375,379,405,436,466,496,500,531,562,592,622,626,
27,57,88,118,23,153,183,214,269,149,304,335,365,395,300,425,455,486,516,421,551,581,612,642,547,
73,77,107,13,43,199,203,258,139,169,350,354,385,290,320,471,475,505,411,441,597,601,631,537,567,
93,123,2,32,63,219,274,128,158,189,370,400,279,310,340,491,521,400,430,461,617,647,526,556,587,
113,18,48,52,82,264,144,174,178,208,390,295,325,329,360,511,416,446,450,480,637,542,572,576,606,
131,162,192,222,251,282,313,343,373,377,408,439,469,499,503,535,565,595,625,629,5,36,66,96,100,
151,181,212,267,147,302,332,363,393,298,428,458,489,519,424,554,585,615,645,550,25,55,86,116,21,
197,201,256,137,167,348,352,382,288,318,474,478,508,414,444,600,604,635,540,570,71,75,105,11,41,
217,272,126,156,187,368,398,277,307,338,494,524,403,433,464,620,650,529,560,590,91,121,0,30,61,
262,142,172,176,206,388,293,323,327,357,514,419,449,453,483,640,545,575,579,610,111,16,46,50,80,
280,311,341,371,375,406,437,467,497,501,532,563,593,623,627,8,39,69,99,103,135,165,195,225,254,
300,330,361,391,296,426,456,487,517,422,552,582,613,643,548,28,58,89,119,24,154,185,215,270,150,
346,350,380,286,316,472,476,506,412,442,598,602,632,538,568,74,78,108,14,44,200,204,260,140,170,
366,396,275,305,336,492,522,401,431,462,618,648,527,557,588,94,124,3,33,64,220,275,129,160,190,
386,291,321,325,355,512,417,447,451,481,638,543,573,577,607,114,19,49,53,83,265,145,175,179,210,
410,440,470,500,504,530,561,591,621,625,6,37,67,97,101,132,163,193,223,252,283,314,344,374,378,
429,460,490,520,425,550,580,611,641,546,26,56,87,117,22,152,182,213,268,148,303,333,364,394,299,
475,479,510,415,445,596,600,630,536,566,72,76,106,12,42,198,202,257,138,168,349,353,383,289,319,
495,525,404,435,465,616,646,525,555,586,92,122,1,31,62,218,273,127,157,188,369,399,278,308,339,
515,420,450,454,485,636,541,571,575,605,112,17,47,51,81,263,143,173,177,207,389,294,324,328,358,
533,564,594,624,628,10,40,70,100,104,130,161,191,221,250,281,312,342,372,376,407,438,468,498,502,
553,583,614,644,549,29,60,90,120,25,150,180,211,266,146,301,331,362,392,297,427,457,488,518,423,
599,603,633,539,569,75,79,110,15,45,196,200,255,136,166,347,351,381,287,317,473,477,507,413,443,
619,649,528,558,589,95,125,4,35,65,216,271,125,155,186,367,397,276,306,337,493,523,402,432,463,
639,544,574,578,608,115,20,50,54,85,261,141,171,175,205,387,292,322,326,356,513,418,448,452,482,
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



