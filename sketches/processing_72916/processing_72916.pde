
 //Credit to Brian for image code and loop





PFont font;
int M=0;
int value=0;
int oldY=0, oldX=0, newX=0, newY=0, enemyX=0, enemyY=0, score=0;
int numFrames = 202; 
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage img;
PImage img2;
void setup()
{

   img2 = loadImage("Oppa.png");
   
 
  scale(40,40);
  img = loadImage("Button3.png");
  
  ///////////////////////////
  ////MUSIC//////////////////
  //////////////////////////
  
  
  
  
  
  
  
  
  size(700, 339);
  noLoop();
  frameRate(20);
  font = loadFont("Bauhaus93-48.vlw");
  

  images[2]  = loadImage("(3).jpg");
  images[1]  = loadImage("(3).jpg"); 
  images[0]  = loadImage("(3).jpg"); 
  images[3] = loadImage("(4).jpg");
  images[4] = loadImage("(5).jpg");
  images[5] = loadImage("(6).jpg");
  images[6] = loadImage("(7).jpg");
  images[7] = loadImage("(8).jpg");
  images[8] = loadImage("(9).jpg");
  images[9] = loadImage("(10).jpg");
  images[10] = loadImage("(11).jpg");
  images[11] = loadImage("(12).jpg");
  images[12] = loadImage("(13).jpg");
  images[13] = loadImage("(14).jpg");
  images[14] = loadImage("(15).jpg");
  images[15] = loadImage("(16).jpg");
  images[16] = loadImage("(17).jpg");
  images[17] = loadImage("(18).jpg");
  images[18] = loadImage("(19).jpg");
  images[19] = loadImage("(20).jpg");
  images[20] = loadImage("(21).jpg");
  images[21] = loadImage("(22).jpg");
  images[22] = loadImage("(23).jpg");
  images[23] = loadImage("(24).jpg");
  images[24] = loadImage("(25).jpg");
  images[25] = loadImage("(26).jpg");
  images[26] = loadImage("(27).jpg");
  images[27] = loadImage("(28).jpg");
  images[28] = loadImage("(29).jpg");
  images[29] = loadImage("(30).jpg");
  images[30] = loadImage("(31).jpg");
  images[31] = loadImage("(32).jpg");
  images[32] = loadImage("(33).jpg");
  images[33] = loadImage("(34).jpg");
  images[34] = loadImage("(35).jpg");
  images[35] = loadImage("(36).jpg");
  images[36] = loadImage("(37).jpg");
  images[37] = loadImage("(38).jpg");
  images[38] = loadImage("(39).jpg");
  images[39] = loadImage("(40).jpg");
  images[40] = loadImage("(41).jpg");
  images[41] = loadImage("(42).jpg");
  images[42] = loadImage("(43).jpg");
  images[43] = loadImage("(44).jpg");
  images[44] = loadImage("(45).jpg");
  images[45] = loadImage("(46).jpg");
  images[46] = loadImage("(47).jpg");
  images[47] = loadImage("(48).jpg");
  images[48] = loadImage("(49).jpg");
  images[49] = loadImage("(50).jpg");
  images[50] = loadImage("(51).jpg");
  images[51] = loadImage("(52).jpg");
  images[52] = loadImage("(53).jpg");
  images[53] = loadImage("(54).jpg");
  images[54] = loadImage("(55).jpg");
  images[55] = loadImage("(56).jpg");
  images[56] = loadImage("(57).jpg");
  images[57] = loadImage("(58).jpg");
  images[58] = loadImage("(59).jpg");
  images[59] = loadImage("(60).jpg");
  images[60] = loadImage("(61).jpg");
  images[61] = loadImage("(62).jpg");
  images[62] = loadImage("(63).jpg");
  images[63] = loadImage("(64).jpg");
  images[64] = loadImage("(65).jpg");
  images[65] = loadImage("(66).jpg");
  images[66] = loadImage("(67).jpg");
  images[67] = loadImage("(68).jpg");
  images[68] = loadImage("(69).jpg");
  images[69] = loadImage("(70).jpg");
  images[70] = loadImage("(71).jpg");
  images[71] = loadImage("(72).jpg");
  images[72] = loadImage("(73).jpg");
  images[73] = loadImage("(74).jpg");
  images[74] = loadImage("(75).jpg");
  images[75] = loadImage("(76).jpg");
  images[76] = loadImage("(77).jpg");
  images[77] = loadImage("(78).jpg");
  images[78] = loadImage("(79).jpg");
  images[79] = loadImage("(80).jpg");
  images[80] = loadImage("(81).jpg");
  images[81] = loadImage("(82).jpg");
  images[82] = loadImage("(83).jpg");
  images[83] = loadImage("(84).jpg");
  images[84] = loadImage("(85).jpg");
  images[85] = loadImage("(86).jpg");
  images[86] = loadImage("(87).jpg");
  images[87] = loadImage("(88).jpg");
  images[88] = loadImage("(89).jpg");
  images[89] = loadImage("(90).jpg");
  images[90] = loadImage("(91).jpg");
  images[91] = loadImage("(92).jpg");
  images[92] = loadImage("(93).jpg");
  images[93] = loadImage("(94).jpg");
  images[94] = loadImage("(95).jpg");
  images[95] = loadImage("(96).jpg");
  images[96] = loadImage("(97).jpg");
  images[97] = loadImage("(98).jpg");
  images[98] = loadImage("(99).jpg");
  images[99] = loadImage("(100).jpg");
  images[100] = loadImage("(101).jpg");
  images[101] = loadImage("(102).jpg");
  images[102] = loadImage("(103).jpg");
  images[103] = loadImage("(104).jpg");
  images[104] = loadImage("(105).jpg");
  images[105] = loadImage("(106).jpg");
  images[106] = loadImage("(107).jpg");
  images[107] = loadImage("(108).jpg");
  images[108] = loadImage("(109).jpg");
  images[109] = loadImage("(110).jpg");
  images[110] = loadImage("(111).jpg");
  images[111] = loadImage("(112).jpg");
  images[112] = loadImage("(113).jpg");
  images[113] = loadImage("(114).jpg");
  images[114] = loadImage("(115).jpg");
  images[115] = loadImage("(116).jpg");
  images[116] = loadImage("(117).jpg");
  images[117] = loadImage("(118).jpg");
  images[118] = loadImage("(119).jpg");
  images[119] = loadImage("(120).jpg");
  images[120] = loadImage("(121).jpg");
  images[121] = loadImage("(122).jpg");
  images[122] = loadImage("(123).jpg");
  images[123] = loadImage("(124).jpg");
  images[124] = loadImage("(125).jpg");
  images[125] = loadImage("(126).jpg");
  images[126] = loadImage("(127).jpg");
  images[127] = loadImage("(128).jpg");
  images[128] = loadImage("(129).jpg");
  images[129] = loadImage("(130).jpg");
  images[130] = loadImage("(131).jpg");
  images[131] = loadImage("(132).jpg");
  images[132] = loadImage("(133).jpg");
  images[133] = loadImage("(134).jpg");
  images[134] = loadImage("(135).jpg");
  images[135] = loadImage("(136).jpg");
  images[136] = loadImage("(137).jpg");
  images[137] = loadImage("(138).jpg");
  images[138] = loadImage("(139).jpg");
  images[139] = loadImage("(140).jpg");
  images[140] = loadImage("(141).jpg");
  images[141] = loadImage("(142).jpg");
  images[142] = loadImage("(143).jpg");
  images[143] = loadImage("(144).jpg");
  images[144] = loadImage("(145).jpg");
  images[145] = loadImage("(146).jpg");
  images[146] = loadImage("(147).jpg");
  images[147] = loadImage("(148).jpg");
  images[148] = loadImage("(149).jpg");
  images[149] = loadImage("(150).jpg");
  images[150] = loadImage("(151).jpg");
  images[151] = loadImage("(152).jpg");
  images[152] = loadImage("(153).jpg");
  images[153] = loadImage("(154).jpg");
  images[154] = loadImage("(155).jpg");
  images[155] = loadImage("(156).jpg");
  images[156] = loadImage("(157).jpg");
  images[157] = loadImage("(158).jpg");
  images[158] = loadImage("(159).jpg");
  images[159] = loadImage("(160).jpg");
  images[160] = loadImage("(161).jpg");
  images[161] = loadImage("(162).jpg");
  images[162] = loadImage("(163).jpg");
  images[163] = loadImage("(164).jpg");
  images[164] = loadImage("(165).jpg");
  images[165] = loadImage("(166).jpg");
  images[166] = loadImage("(167).jpg");
  images[167] = loadImage("(168).jpg");
  images[168] = loadImage("(169).jpg");
  images[169] = loadImage("(170).jpg");
  images[170] = loadImage("(171).jpg");
  images[171] = loadImage("(172).jpg");
  images[172] = loadImage("(173).jpg");
  images[173] = loadImage("(174).jpg");
  images[174] = loadImage("(175).jpg");
  images[175] = loadImage("(176).jpg");
  images[176] = loadImage("(177).jpg");
  images[177] = loadImage("(178).jpg");
  images[178] = loadImage("(179).jpg");
  images[179] = loadImage("(180).jpg");
  images[180] = loadImage("(181).jpg");
  images[181] = loadImage("(182).jpg");
  images[182] = loadImage("(183).jpg");
  images[183] = loadImage("(184).jpg");
  images[184] = loadImage("(185).jpg");
  images[185] = loadImage("(186).jpg");
  images[186] = loadImage("(187).jpg");
  images[187] = loadImage("(188).jpg");
  images[188] = loadImage("(189).jpg");
  images[189] = loadImage("(190).jpg");
  images[190] = loadImage("(191).jpg");
  images[191] = loadImage("(192).jpg");
  images[192] = loadImage("(193).jpg");
  images[193] = loadImage("(194).jpg");
  images[194] = loadImage("(195).jpg");
  images[195] = loadImage("(196).jpg");
  images[196] = loadImage("(197).jpg");
  images[197] = loadImage("(198).jpg");
  images[198] = loadImage("(199).jpg");
  images[199] = loadImage("(200).jpg");
  images[200] = loadImage("(201).jpg");
  images[201] = loadImage("(202).jpg");
  
  
  
  
} 

void draw() { 
  
  ////////////////////////////////////
  ////////FLASHING TEXT///////////////
  ////////////////////////////////////
  if(mouseX < 50) {
    cursor(HAND);
  } 

   
 
  if (frame>30) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
    
  }
  if (frame>35) {
    fill(0,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
        
}
  if (frame>40) {
    fill(0);
    textFont(font,76);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
    
  }
  
  if (frame>45) {
    fill(255,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>50) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>55) {
    fill(255,255,0);
    textFont(font,70);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
    
    if (frame>60) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>65) {
    fill(0,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>70) {
    fill(0);
    textFont(font,76);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>75) {
    fill(255,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>80) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>85) {
    fill(255,255,0);
    textFont(font,70);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>90) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>95) {
    fill(0,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>100) {
    fill(0);
    textFont(font,76);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
    if (frame>105) {
    fill(255,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>110) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>115) {
    fill(255,255,0);
    textFont(font,70);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>120) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>125) {
    fill(0,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>130) {
    fill(0);
    textFont(font,76);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>135) {
    fill(255,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>140) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>145) {
    fill(255,255,0);
    textFont(font,70);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
   if (frame>150) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>155) {
    fill(0,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>160) {
    fill(0);
    textFont(font,76);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>165) {
    fill(255,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>170) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>175) {
    fill(255,255,0);
    textFont(font,70);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
   if (frame>180) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>185) {
    fill(0,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  if (frame>190) {
    fill(0);
    textFont(font,76);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
    if (frame>195) {
    fill(255,0,255);
    textFont(font,74);
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  
  if (frame>200) {
    fill(255,0,255);
    textFont(font, 72); 
    text("GANGNAM STYLEEEEEEEEEE ", 0, 50);
  }
  /////////////////////////////
  /////END OF TEXT/////////////
  ///////////////
  
  frame = frame + 1;
  if (frame>=numFrames) {
    frame=0;
  }
  
  image(images[frame], 50, 50);
  image(img, 130, 150);
  
  
  

  
   
}

////////////////////////////////
/////////MOUSE FUNCTIONS////////////
////////////////////////////////


void mouseClicked() {
  loop();
}

void mouseDragged() 
{
  value = value + 20;
  if (value > 255) {
    value = 0;
  if (mousePressed && (mouseButton == LEFT)) {
    frameRate(20);
    image(img2,random(2000),random(40));
    image(img2,random(2000),random(-40));
}
}

}
  



