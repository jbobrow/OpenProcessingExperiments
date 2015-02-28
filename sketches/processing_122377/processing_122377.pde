
int timer;
int m = 0;

int y;
int[][] multi = new int[][]{
{157,217,154,193,154,193},
{169,154,192,160,195,184},
{198,208,183,206,183,206},
{169,207,162,169,185,166},
{208,163,210,190,209,186},
{208,182,207,164,182,165},
{157,166,154,207,154,185},
{154,163,171,150,186,152},
{201,154,210,161,210,184},
{210,207,199,216,168,214},
{137,212,121,208,116,181},
{112,154,115,128,115,128},
{115,114,124,41,255,54},
{392,230,425,407,281,407},
{281,407,280,432,253,434},
{226,436,212,430,212,407},
{212,407,79,437,116,240},
{116,240,91,92,181,92},
{249,92,248,212,247,191},
{248,194,251,78,295,74},
{330,72,333,102,333,102},
{333,102,336,141,327,138},
{320,136,278,127,278,181},
{278,181,276,215,314,214},
{352,213,348,169,348,167},
{348,167,347,136,312,136}, 
{278,137,276,179,279,190},
{280,194,275,156,308,155},
{341,154,346,178,347,186},
{347,194,336,217,312,214},
{288,211,295,155,314,156},
{314,156,329,154,327,187},
{325,220,308,217,295,211},
{289,208,282,201,279,190},
{276,177,277,160,279,140},
{282,113,266,253,273,287},
{273,287,224,281,224,293},
{224,305,194,331,163,349},
{153,355,195,365,221,358},
{243,352,249,329,248,332},
{246,349,230,375,230,375},
{230,375,252,376,252,357},
{252,376,274,375,274,375},
{274,375,255,337,256,332},
{257,327,281,374,336,349},
{336,349,298,320,295,304},
{292,290,250,288,250,306},
{250,324,251,293,239,294},
{239,294,228,290,219,306}};

void setup() {
  size(300, 300);
  frameRate(60);
  background(255);
  smooth();
  noCursor();
 
}

void draw() {
  background(255);
  strokeWeight(2);
  stroke(0);
  scale(0.6,0.6);
  frameRate(30);
  noFill();
  beginShape();
vertex(182,214);
  for ( y =0; y < m; y++){
    bezierVertex(multi[y][0],multi[y][1],multi[y][2],multi[y][3],multi[y][4],multi[y][5]);
  }
endShape();
}


void mouseMoved(){
  if (m < 49){
  m++;
  } else {
    
  }
}
 
