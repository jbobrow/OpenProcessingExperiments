
 int c;
int h=784;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 15, true);
  size(840, 840);
  background(0);
  smooth(8);
  textFont(f, 15);
}
int [] m = 
{
1,58,115,172,33,90,147,204,261,318,375,236,293,350,407,464,521,578,439,496,553,610,667,724,781,642,699,756,
175,29,86,143,4,61,118,378,232,289,346,207,264,321,581,435,492,549,410,467,524,784,638,695,752,613,670,727,
146,7,57,114,171,32,89,349,210,260,317,374,235,292,552,413,463,520,577,438,495,755,616,666,723,780,641,698,
117,174,35,85,142,3,60,320,377,238,288,345,206,263,523,580,441,491,548,409,466,726,783,644,694,751,612,669,
88,145,6,63,113,170,31,291,348,209,266,316,373,234,494,551,412,469,519,576,437,697,754,615,672,722,779,640,
59,116,173,34,91,141,2,262,319,376,237,294,344,205,465,522,579,440,497,547,408,668,725,782,643,700,750,611,
30,87,144,5,62,119,169,233,290,347,208,265,322,372,436,493,550,411,468,525,575,639,696,753,614,671,728,778,
218,275,332,389,250,307,364,15,72,129,186,47,104,161,596,653,710,767,628,685,742,393,450,507,564,425,482,539,
392,246,303,360,221,278,335,189,43,100,157,18,75,132,770,624,681,738,599,656,713,567,421,478,535,396,453,510,
363,224,274,331,388,249,306,160,21,71,128,185,46,103,741,602,652,709,766,627,684,538,399,449,506,563,424,481,
334,391,252,302,359,220,277,131,188,49,99,156,17,74,712,769,630,680,737,598,655,509,566,427,477,534,395,452,
305,362,223,280,330,387,248,102,159,20,77,127,184,45,683,740,601,658,708,765,626,480,537,398,455,505,562,423,
276,333,390,251,308,358,219,73,130,187,48,105,155,16,654,711,768,629,686,736,597,451,508,565,426,483,533,394,
247,304,361,222,279,336,386,44,101,158,19,76,133,183,625,682,739,600,657,714,764,422,479,536,397,454,511,561,
400,457,514,571,432,489,546,589,646,703,760,621,678,735,22,79,136,193,54,111,168,211,268,325,382,243,300,357,
574,428,485,542,403,460,517,763,617,674,731,592,649,706,196,50,107,164,25,82,139,385,239,296,353,214,271,328,
545,406,456,513,570,431,488,734,595,645,702,759,620,677,167,28,78,135,192,53,110,356,217,267,324,381,242,299,
516,573,434,484,541,402,459,705,762,623,673,730,591,648,138,195,56,106,163,24,81,327,384,245,295,352,213,270,
487,544,405,462,512,569,430,676,733,594,651,701,758,619,109,166,27,84,134,191,52,298,355,216,273,323,380,241,
458,515,572,433,490,540,401,647,704,761,622,679,729,590,80,137,194,55,112,162,23,269,326,383,244,301,351,212,
429,486,543,404,461,518,568,618,675,732,593,650,707,757,51,108,165,26,83,140,190,240,297,354,215,272,329,379,
603,660,717,774,635,692,749,414,471,528,585,446,503,560,197,254,311,368,229,286,343,8,65,122,179,40,97,154,
777,631,688,745,606,663,720,588,442,499,556,417,474,531,371,225,282,339,200,257,314,182,36,93,150,11,68,125,
748,609,659,716,773,634,691,559,420,470,527,584,445,502,342,203,253,310,367,228,285,153,14,64,121,178,39,96,
719,776,637,687,744,605,662,530,587,448,498,555,416,473,313,370,231,281,338,199,256,124,181,42,92,149,10,67,
690,747,608,665,715,772,633,501,558,419,476,526,583,444,284,341,202,259,309,366,227,95,152,13,70,120,177,38,
661,718,775,636,693,743,604,472,529,586,447,504,554,415,255,312,369,230,287,337,198,66,123,180,41,98,148,9,
632,689,746,607,664,721,771,443,500,557,418,475,532,582,226,283,340,201,258,315,365,37,94,151,12,69,126,176,
};
void draw() {
  for (int j= 0; j < 840; j=j+30) {
    for (int i= 0; i < 840; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+2, i+20);
      z=z+1;
    }
  }
  z=0;
}



