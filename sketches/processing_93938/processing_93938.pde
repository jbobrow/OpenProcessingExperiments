
/*
WYOMING
Offenses Known to Law Enforcement, 2007

*link*
07tbl08wy.xls
*/
class Pair {
  public int x;
  public int y;
  public Pair(int a, int b) {
    x = a;
    y = b;
  }
}

PImage img;
Pair[] locations = {  new Pair(15,290),  new Pair(322,81),  new Pair(465,85),  new Pair(506,274),  new Pair(665,500),  new Pair(213,61),  new Pair(58,376),  new Pair(606,288),  new Pair(9,478),  new Pair(511,274),  new Pair(592,91),  new Pair(525,274),  new Pair(170,445),  new Pair(666,366),  new Pair(493,401),  new Pair(31,195),  new Pair(56,412),  new Pair(248,279),  new Pair(641,491),  new Pair(301,8),  new Pair(706,288),  new Pair(491,276),  new Pair(692,85),  new Pair(732,147),  new Pair(747,495),  new Pair(234,32),  new Pair(408,412),  new Pair(266,262),  new Pair(201,441),  new Pair(450,450),  new Pair(437,26),  new Pair(714,77),  new Pair(304,174),  new Pair(734,377),  new Pair(652,378),  new Pair(331,127)};
float[] populations = {1817,1242,4566,52434,55604,9266,678,5691,11585,2321,24438,2393,11957,1118,855,9292,2508,7066,25504,2279,1316,2926,861,3275,1142,5388,8572,9795,19432,1721,16507,1199,2912,5446,3426,4857};
float[] violentcrimes = {2,6,28,152,115,31,2,15,18,4,41,9,78,6,0,42,3,15,18,4,5,9,1,12,5,11,54,32,135,1,9,0,17,7,7,15};
float[] propertycrimes = {25,32,70,2595,2557,247,12,178,436,89,920,45,308,11,3,323,25,213,828,28,17,87,14,122,20,202,377,417,851,22,372,12,81,170,121,43};

void setup() {
  img = loadImage("wyoming.png");
  size(750,515);
  ellipseMode(CENTER);
  strokeWeight(0);
}
void draw() {
  colorMode(RGB,255,255,255);
  background(255);
  image(img,0,0);
  colorMode(HSB, 100,100,100);
  for (int i = 0; i < populations.length; i++) {
    stroke(0,0,0,0);
    fill(83f*(violentcrimes[i]/propertycrimes[i]),60,70,127);
    ellipse(locations[i].x,locations[i].y,populations[i]/500f,populations[i]/500f);
  }
}

