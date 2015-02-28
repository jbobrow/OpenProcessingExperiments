
// Song of the Blend Morphs
// Steve Tiffany, 2012

// x,y control coordinates of background chorus, 20-frame loop
int[][] dance1 = { {138,77}, {151,93}, {181,125}, {227,159}, {291,187},
{366,192},{427,177},{477,144},{510,112},{530,90},{539,79},{530,91},
{509,114},{470,144},{411,176},{334,192},{254,180},{185,151},{146,106},{129,78} };

// x,y control coordinates of foreground figure, 100-frame loop
int[][] dance2 ={ {4,2}, {18,17}, {61,44}, {147,74}, {231,98}, 
{337,114}, {448,104}, {537,70}, {582,37}, {621,8}, {598,32}, {526,73}, 
{442,116}, {318,150}, {245,140}, {171,114}, {111,75}, {60,49}, {27,22}, 
{4,3}, {28,30}, {92,60}, {160,70}, {231,46}, {288,21}, {359,32}, {422,66}, 
{488,76}, {543,41}, {631,8}, {618,37}, {578,80}, {516,121}, {426,156}, 
{300,170}, {204,161}, {131,126}, {80,87}, {51,48}, {8,1}, {18,37}, {58,72}, 
{156,90}, {246,57}, {351,20}, {417,51}, {493,93}, {562,43}, {622,76}, 
{634,3}, {578,51}, {479,62}, {391,22}, {322,7}, {235,34}, {128,54}, 
{104,14}, {59,9}, {20,40}, {2,6}, {36,6}, {101,15}, {161,49}, {200,101}, 
{272,167}, {398,184}, {445,142}, {474,81}, {500,39}, {536,12}, {514,2}, 
{487,7}, {440,37}, {357,80}, {267,115}, {175,141}, {93,132}, {57,80}, 
{29,38}, {29,10}, {56,6}, {119,18}, {178,55}, {272,92}, {393,123}, 
{497,122}, {579,100}, {626,70}, {639,39}, {613,4}, {547,36}, {504,64}, 
{429,114}, {327,131}, {243,127}, {135,96}, {79,69}, {45,36}, {18,12}, {5,1} };
int x, y, count1, count2;

void setup() {
  size(640,200);
  frameRate(8);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  x = dance1[count1][0];
  y = dance1[count1][1];
  count1++;
  if (count1>=dance1.length) {count1 = 0;}
  translate(-260,0);
  fill(200);
  dancer();
  translate(520,0);
  fill(200);
  dancer();
  translate(-360,0);
  fill(140);
  dancer();
  translate(200,0);
  fill(140);
  dancer();
  x = dance2[count2][0];
  y = dance2[count2][1];
  count2++;
  if (count2>=dance2.length) {count2 = 0;}
  translate(-100,0);
  fill(255);
  dancer();
}

void dancer() {
  beginShape(); // body
  curveVertex(map(x,0,width,382,282), map(y,0,height,7,64));
  curveVertex(map(x,0,width,393,300), map(y,0,height,16,76));
  curveVertex(map(x,0,width,389,304), map(y,0,height,37,91));
  curveVertex(map(x,0,width,376,300), map(y,0,height,45,104));
  curveVertex(map(x,0,width,375,301), map(y,0,height,52,111));
  curveVertex(map(x,0,width,398,323), map(y,0,height,52,116));
  curveVertex(map(x,0,width,422,363), map(y,0,height,47,137));
  curveVertex(map(x,0,width,448,382), map(y,0,height,20,156));
  curveVertex(map(x,0,width,467,401), map(y,0,height,3,173));
  curveVertex(map(x,0,width,478,411), map(y,0,height,20,190));
  curveVertex(map(x,0,width,449,388), map(y,0,height,29,168));
  curveVertex(map(x,0,width,425,365), map(y,0,height,60,150));
  curveVertex(map(x,0,width,384,319), map(y,0,height,69,127));
  curveVertex(map(x,0,width,365,327), map(y,0,height,97,149));
  curveVertex(map(x,0,width,384,365), map(y,0,height,129,160));
  curveVertex(map(x,0,width,357,352), map(y,0,height,169,183));
  curveVertex(map(x,0,width,379,375), map(y,0,height,196,196));
  curveVertex(map(x,0,width,335,337), map(y,0,height,180,194));
  curveVertex(map(x,0,width,363,347), map(y,0,height,138,165));
  curveVertex(map(x,0,width,334,308), map(y,0,height,120,168));
  curveVertex(map(x,0,width,297,289), map(y,0,height,137,167));
  curveVertex(map(x,0,width,304,309), map(y,0,height,180,194));
  curveVertex(map(x,0,width,263,268), map(y,0,height,196,196));
  curveVertex(map(x,0,width,288,291), map(y,0,height,175,183));
  curveVertex(map(x,0,width,278,272), map(y,0,height,132,165));
  curveVertex(map(x,0,width,317,280), map(y,0,height,93,148));
  curveVertex(map(x,0,width,327,257), map(y,0,height,66,130));
  curveVertex(map(x,0,width,285,221), map(y,0,height,57,155));
  curveVertex(map(x,0,width,261,192), map(y,0,height,25,165));
  curveVertex(map(x,0,width,237,165), map(y,0,height,14,180));
  curveVertex(map(x,0,width,237,181), map(y,0,height,2,166));
  curveVertex(map(x,0,width,266,198), map(y,0,height,14,157));
  curveVertex(map(x,0,width,287,222), map(y,0,height,42,143));
  curveVertex(map(x,0,width,328,248), map(y,0,height,50,118));
  curveVertex(map(x,0,width,355,275), map(y,0,height,51,111));
  curveVertex(map(x,0,width,357,277), map(y,0,height,45,104));
  curveVertex(map(x,0,width,351,268), map(y,0,height,33,90));
  curveVertex(map(x,0,width,362,272), map(y,0,height,12,73));
  curveVertex(map(x,0,width,382,282), map(y,0,height,7,64));
  curveVertex(map(x,0,width,393,300), map(y,0,height,16,76));
  curveVertex(map(x,0,width,389,304), map(y,0,height,37,91));
  endShape();
  fill(0);
  beginShape(); // mouth
  curveVertex(map(x,0,width,360,275), map(y,0,height,29,90));
  curveVertex(map(x,0,width,369,289), map(y,0,height,29,91));
  curveVertex(map(x,0,width,380,298), map(y,0,height,28,90));
  curveVertex(map(x,0,width,366,292), map(y,0,height,40,95));
  curveVertex(map(x,0,width,360,275), map(y,0,height,29,90));
  curveVertex(map(x,0,width,369,289), map(y,0,height,29,91));
  curveVertex(map(x,0,width,380,298), map(y,0,height,28,90));
  endShape();
}


