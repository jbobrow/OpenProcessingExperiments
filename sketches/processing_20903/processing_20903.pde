
PImage Base;
PImage Border;
PImage s2;
PImage s4;
PImage s6;
PImage s8;
PImage s10;
PImage s12;
PImage s14;
PImage s16;
PImage s18;
PImage s20;
PImage s22;
PImage s24;
PImage s26; //24-1
PImage s28; //24-2
PImage s30;
PImage s32;
PImage s34;
PImage s36;
PImage s38;
PImage s40;
PImage s42;
PImage s44;
PImage s46;
PImage s48;
PImage s50;
PImage s52;
PImage s54;
PImage s56;
PImage s58;
PImage s60;
PImage min1;
PImage min2;
PImage min3;
PImage min4;
PImage min5;
PImage min6;
PImage min7;
PImage min8;
PImage min9;
PImage min10;
PImage min20;
PImage min30;
PImage min40;
PImage min50;
PImage h1;
PImage h2;
PImage h3;
PImage h4;
PImage h5;
PImage h6;
PImage h7;
PImage h8;
PImage h9;
PImage h10;
PImage h11;
PImage h12;



void setup() {
  size(640, 480);
  background(0);
  smooth();
  Base = loadImage("Base.png");
  Border = loadImage("Border.png");
  h1 = loadImage("h1.png");
  h2 = loadImage("h2.png");
  h3 = loadImage("h3.png");
  h4 = loadImage("h4.png");
  h5 = loadImage("h5.png");
  h6 = loadImage("h6.png");
  h7 = loadImage("h7.png");
  h8 = loadImage("h8.png");
  h9 = loadImage("h9.png");
  h10 = loadImage("h10.png");
  h11 = loadImage("h11.png");
  h12 = loadImage("h12.png");
  
  min1 = loadImage("min1.png");
  min2 = loadImage("min2.png");
  min3 = loadImage("min3.png");
  min4 = loadImage("min4.png");
  min5 = loadImage("min5.png");
  min6 = loadImage("min6.png");
  min7 = loadImage("min7.png");
  min8 = loadImage("min8.png");
  min9 = loadImage("min9.png");
  min10 = loadImage("min10.png");
  min20 = loadImage("min20.png");
  min30 = loadImage("min30.png");
  min40 = loadImage("min40.png");
  min50 = loadImage("min50.png");
  
  s2 = loadImage("s2.png");
  s4 = loadImage("s4.png");
  s6 = loadImage("s6.png");
  s8= loadImage("s8.png");
  s10 = loadImage("s10.png");
  s12 = loadImage("s12.png");
  s14 = loadImage("s14.png");
  s16 = loadImage("s16.png");
  s18 = loadImage("s18.png");
  s20 = loadImage("s20.png");
  s22 = loadImage("s22.png");
  s24 = loadImage("s24.png");
  s26 = loadImage("s24-1.png");
  s28 = loadImage("s24-2.png");
  s30 = loadImage("s26.png");
  s32 = loadImage("s28.png");
  s34 = loadImage("s30.png");
  s36 = loadImage("s32.png");
  s38 = loadImage("s34.png");
  s40 = loadImage("s36.png");
  s42 = loadImage("s38.png");
  s44 = loadImage("s40.png");
  s46 = loadImage("s42.png");
  s48 = loadImage("s44.png");
  s50 = loadImage("s46.png");
  s52 = loadImage("s48.png");
  s54 = loadImage("s50.png");
  s56 = loadImage("s52.png");
  s58 = loadImage("s54.png");
  s60 = loadImage("s56.png");
  
  
  
}

void draw() {

  background(0);

  float s = second();
  float m = minute();
  float h = hour()%12;


  image(Base, 0, 0);
  image (Border,0,0);

  if (h<1) image( h1, 0, 0);
  if (h<2) image( h2, 0, 0);
  if (h<3) image( h3, 0, 0);
  if (h<4) image( h4, 0, 0);
  if (h<5) image( h5, 0, 0);
  if (h<6) image( h6, 0, 0);
  if (h<7) image( h7, 0, 0);
  if (h<8) image( h8, 0, 0);
  if (h<9) image( h9, 0, 0);
  if (h<10) image( h10, 0, 0);
  if (h<11) image( h11, 0, 0);
  if (h<12) image( h12, 0, 0);
  
  
  if (s>2) image(s2, 0, 0);
  if (s>4) image(s4, 0, 0);
  if (s>6) image(s6, 0, 0);
  if (s>8) image(s8, 0, 0);
  if (s>10) image(s10, 0, 0);
  if (s>12) image(s12, 0, 0);
  if (s>14) image(s14, 0, 0);
  if (s>16) image(s16, 0, 0);
  if (s>18) image(s18, 0, 0);
  if (s>20) image(s20, 0, 0);
  if (s>22) image(s22, 0, 0);
  if (s>24) image(s24, 0, 0);
  if (s>26) image(s26, 0, 0);
  if (s>28) image(s28, 0, 0);
  if (s>30) image(s30, 0, 0);
  if (s>32) image(s32, 0, 0);
  if (s>34) image(s34, 0, 0);
  if (s>36) image(s36, 0, 0);
  if (s>38) image(s38, 0, 0);
  if (s>40) image(s40, 0, 0);
  if (s>42) image(s42, 0, 0);
  if (s>44) image(s44, 0, 0);
  if (s>46) image(s46, 0, 0);
  if (s>48) image(s48, 0, 0);
  if (s>50) image(s50, 0, 0);
  if (s>52) image(s52, 0, 0);
  if (s>54) image(s54, 0, 0);
  if (s>56) image(s56, 0, 0);
  if (s>58) image(s58, 0, 0);
  if (s>60) image(s60, 0, 0);
  
  if (m>9) image(min10,0,0);
  if (m>19) image(min20,0,0);
  if (m>29) image(min30,0,0);
  if (m>39) image(min40,0,0);
  if (m>49) image(min50,0,0);
  
  m %= 10;
  if (m>0) image(min1,0,0);
  if (m>1) image(min2,0,0);
  if (m>2) image(min3,0,0);
  if (m>3) image(min4,0,0);
  if (m>4) image(min5,0,0);
  if (m>5) image(min6,0,0);
  if (m>6) image(min7,0,0);
  if (m>7) image(min8,0,0);
  if (m>8) image(min9,0,0);
  
  

}

