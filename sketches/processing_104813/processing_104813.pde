
/* @pjs font="data/Tw Cen MT Bold.ttf, data/Tw Cen MT.ttf"; */

HScrollbar distanceSlider;

PFont small;
PFont smallBold;

PImage title_prox;

boolean prox = true;
int proxFrames = 21;  // The number of screenshots to cycle through
PImage[] proxImages = new PImage[proxFrames];
PImage baseMap;
boolean toggleTourism =false;
boolean toggleSport =false;
boolean toggleShops =true;
boolean toggleSafety = false;
boolean toggleEntertainment = false;
boolean toggleBank =false;
boolean toggleRestaurant = true;
boolean toggleCafe = true;
boolean toggleBar = true;
boolean toggleEducation = false;
boolean toggleHealthcare = false;
boolean toggleMarket =true;
int[] restaurant = {
  0, 0, 1, 1, 2, 2, 2, 3, 7, 8, 8, 8, 9, 9, 14, 20, 22, 25, 26, 31, 42
};
int[] shops = {
  0, 0, 1, 2, 2, 2, 2, 4, 7, 8, 9, 9, 9, 10, 13, 19, 19, 20, 22, 27, 34
};
int[] cafe = {
  0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 4, 6, 13, 14, 15, 18, 18, 24
};
int[] sport = {
  0, 1, 1, 1, 2, 2, 3, 4, 5, 7, 7, 8, 8, 9, 9, 9, 12, 14, 16, 17, 18
};
int[] bar = {
  0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 5, 5, 7, 9, 13
};
int[] education = {
  0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 4, 5, 6, 8, 11, 12
};
int[] tourism = {
  0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5, 7, 8, 10, 13, 13, 13, 13, 14
};
int[] bank = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 4, 6
};
int[] safety = {
  0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3
};
int[] entertainment = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 3
};
int[] healthcare = {
  0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3
};
int[] market = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1
};

void setup() {
  size(630, 900);
  
  small = createFont("Tw Cen MT", 14);
  smallBold = createFont("Tw Cen MT Bold", 14);
  
  title_prox = loadImage("PROX.png");
  
  baseMap = loadImage("base_map_cropped.jpg");
  
  for (int i = 0; i < proxFrames; i++) {
    String imageName = "animation" + nf(i, 2) + ".png";
    proxImages[i] = loadImage(imageName); // Load in the screenshots
  }
  
  distanceSlider = new HScrollbar(0, 635+220, 200, 15, 1);
  
}

void draw() {
  background(255);
  
  float slider1Pos = distanceSlider.getPos();
  float per1 = (slider1Pos)/(200);
  float steps1 = 20;
  float value1 = per1*steps1;
  float proxIndex = (value1);
  int proxInt = int(proxIndex);
  float prox = float(proxInt);
  float display1 = prox/20;
  
  fill(0);
  
  
  fill(0); 
  stroke(0);
  textFont(smallBold);
  text("STEP 1: SELECT SURROUNDING", 0, 155+415);
  text("PROGRAM AMENITIES TO ANALYZE", 0, 170+415);
  text("STEP 2: CHANGE WALKABLE", 0,380+415);
  text("DISTANCE FROM SITE", 0,380+415+15);
  text("STEP 3: ANALYZE AMOUNT OF PROGRAM", 310, 380+415);
  text("WITHIN WALKABLE RADIUS (SEE ABOVE)", 310, 380+415+15);
  textFont(small);
  text(display1, 0, 625+220);
  if (proxInt != 20) {
    text("miles",20+10,625+220);
  } else {
    text("mile",20+10,625+220);
  }
  noTint();
  image(baseMap, 0, 0, baseMap.width, baseMap.height);
  textFont(small);
  text("TOURISM", 0,200+415);
  text("SPORT/LEISURE", 0,260+415);
  text("SHOPS", 0,320+415);
  text("SAFETY", 310,380+415-180);
  text("ENTERTAINMENT", 310,440+415-180);
  text("BANK",310,500+415-180);
  text("RESTAURANT", 155,200+415);
  text("CAFE", 155,260+415);
  text("BARS", 155,320+415);
  text("EDUCATION", 465,380+415-180);
  text("HEALTHCARE", 465,440+415-180);
  text("MARKET", 465,500+415-180);
  

  
  
  
  distanceSlider.update();
  distanceSlider.display();
  
  if (toggleTourism){
    fill(32,106,180);
    strokeWeight(0);
    rect(0, 205+415, 15, 15);
    fill(0);
      text(tourism[proxInt] + "/ 14", 20, 217+415);
      fill(32, 106, 180);
      stroke(255);
      strokeWeight(1);
          ellipse(29.418921, 310.277171, 10, 10);
    ellipse(150.227986, 377.965436, 10, 10);
    ellipse(290.524729, 154.342709, 10, 10);
    ellipse(356.576187, 414.024065, 10, 10);
    ellipse(285.188841, 411.021881, 10, 10);
    ellipse(147.467592, 340.975243, 10, 10);
    ellipse(111.345155, 307.116918, 10, 10);
    ellipse(152.219663, 309.557138, 10, 10);
    ellipse(99.12284, 301.70045, 10, 10);
    ellipse(120.044182, 343.79803, 10, 10);
    ellipse(112.413789, 321.174661, 10, 10);
    ellipse(311.568367, 433.089771, 10, 10);
    ellipse(133.480721, 346.651078, 10, 10);
    ellipse(95.617023, 317.60619, 10, 10);
  } else {
    fill(200);
    strokeWeight(0);
    rect(0, 205+415, 15, 15);
    if (mouseX>0 && mouseX<15 && mouseY>205+415 && mouseY<220+415 && toggleTourism==false) {
      fill(0,158,255);
      rect(0,205+415,15,15);
    }
  }
  if (toggleSport){
    fill(238,57,127);
    strokeWeight(0);
    rect(0, 265+415, 15, 15);
    fill(0);
      text(sport[proxInt] + "/ 37", 20, 277+415); 
      fill(238, 57, 127);
      stroke(255);
      strokeWeight(1);
          ellipse(130.876591, 329.741953, 10, 10);
    ellipse(625.408893, 295.538101, 10, 10);
    ellipse(574.552958, 482.831289, 10, 10);
    ellipse(549.098614, 462.287429, 10, 10);
    ellipse(526.069027, 520.53752, 10, 10);
    ellipse(474.802265, 492.107615, 10, 10);
    ellipse(444.07154, 425.844979, 10, 10);
    ellipse(477.442786, 380.7487, 10, 10);
    ellipse(496.62092, 317.279283, 10, 10);
    ellipse(514.39217, 285.943766, 10, 10);
    ellipse(515.181953, 246.322614, 10, 10);
    ellipse(537.145376, 237.180623, 10, 10);
    ellipse(569.43668, 210.83475, 10, 10);
    ellipse(488.46403, 189.781723, 10, 10);
    ellipse(554.197208, 23.304624, 10, 10);
    ellipse(420.038749, 267.865768, 10, 10);
    ellipse(393.642172, 326.166818, 10, 10);
    ellipse(353.286582, 424.298639, 10, 10);
    ellipse(311.345187, 392.873523, 10, 10);
    ellipse(411.487738, 503.569575, 10, 10);
    ellipse(183.952919, 536.290118, 10, 10);
    ellipse(64.615243, 478.39995, 10, 10);
    ellipse(15.027782, 90.536093, 10, 10);
    ellipse(123.593786, 201.215912, 10, 10);
    ellipse(366.176369, 27.977251, 10, 10);
    ellipse(296.631069, 147.089067, 10, 10);
    ellipse(302.348762, 34.830563, 10, 10);
    ellipse(234.868068, 377.381265, 10, 10);
    ellipse(202.599175, 368.963293, 10, 10);
    ellipse(190.473287, 366.558159, 10, 10);
    ellipse(45.18082, 322.254523, 10, 10);
    ellipse(563.010286, 130.463566, 10, 10);
    ellipse(451.225969, 402.700493, 10, 10);
    ellipse(70.654418, 337.952293, 10, 10);
    ellipse(309.60001, 149.957197, 10, 10);
    ellipse(565.104321, 17.768011, 10, 10);
    ellipse(196.789255, 351.991896, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(0, 265+415, 15, 15);
    if (mouseX>0 && mouseX<15 && mouseY>265+415 && mouseY<280+415 && toggleSport==false) {
      fill(0,158,255);
      rect(0,265+415,15,15);
    }
  }
  if (toggleShops){
    fill(146, 200, 74);
    strokeWeight(0);
    rect(0, 325+415, 15, 15);
    fill(0);
      text(shops[proxInt] + "/ 61", 20, 337+415); 
      fill(146, 200, 74);
      stroke(255);
      strokeWeight(1);
          ellipse(228.832595, 376.334919, 10, 10);
    ellipse(454.906391, 107.367105, 10, 10);
    ellipse(51.886223, 134.656686, 10, 10);
    ellipse(109.679824, 135.171457, 10, 10);
    ellipse(233.760928, 80.544276, 10, 10);
    ellipse(585.406893, 266.179138, 10, 10);
    ellipse(580.40066, 261.066389, 10, 10);
    ellipse(586.969009, 143.262046, 10, 10);
    ellipse(109.699983, 91.618892, 10, 10);
    ellipse(103.492008, 334.387297, 10, 10);
    ellipse(318.775093, 76.988378, 10, 10);
    ellipse(584.249015, 62.422706, 10, 10);
    ellipse(116.740736, 105.255162, 10, 10);
    ellipse(349.781482, 393.454025, 10, 10);
    ellipse(184.884327, 345.691417, 10, 10);
    ellipse(119.29148, 335.068137, 10, 10);
    ellipse(120.46785, 93.927267, 10, 10);
    ellipse(117.692897, 316.83457, 10, 10);
    ellipse(22.655845, 295.890608, 10, 10);
    ellipse(219.700818, 82.850094, 10, 10);
    ellipse(43.166622, 285.695286, 10, 10);
    ellipse(109.423362, 117.821539, 10, 10);
    ellipse(124.774415, 325.668211, 10, 10);
    ellipse(78.29322, 296.625484, 10, 10);
    ellipse(208.884907, 363.793138, 10, 10);
    ellipse(303.696294, 83.252114, 10, 10);
    ellipse(336.740949, 88.123909, 10, 10);
    ellipse(29.878585, 307.914474, 10, 10);
    ellipse(221.04025, 88.458926, 10, 10);
    ellipse(112.675851, 327.604825, 10, 10);
    ellipse(274.078836, 81.309016, 10, 10);
    ellipse(308.478939, 83.154851, 10, 10);
    ellipse(229.123429, 136.329604, 10, 10);
    ellipse(341.760907, 385.627597, 10, 10);
    ellipse(118.365525, 63.749805, 10, 10);
    ellipse(106.494083, 63.436402, 10, 10);
    ellipse(60.879151, 283.689507, 10, 10);
    ellipse(265.700108, 79.512893, 10, 10);
    ellipse(37.102781, 271.946623, 10, 10);
    ellipse(432.19439, 16.201175, 10, 10);
    ellipse(317.017816, 206.659386, 10, 10);
    ellipse(50.93387, 306.455529, 10, 10);
    ellipse(215.429195, 351.032235, 10, 10);
    ellipse(101.594965, 321.34325, 10, 10);
    ellipse(119.985946, 318.766862, 10, 10);
    ellipse(306.858517, 83.213209, 10, 10);
    ellipse(111.910046, 316.114824, 10, 10);
    ellipse(71.657209, 295.250834, 10, 10);
    ellipse(215.972248, 345.613606, 10, 10);
    ellipse(222.845571, 95.446731, 10, 10);
    ellipse(253.736944, 82.244902, 10, 10);
    ellipse(117.574969, 317.8072, 10, 10);
    ellipse(581.686624, 84.028056, 10, 10);
    ellipse(224.837248, 370.510768, 10, 10);
    ellipse(206.389487, 344.429159, 10, 10);
    ellipse(44.980678, 296.709778, 10, 10);
    ellipse(71.584414, 376.770182, 10, 10);
    ellipse(223.376976, 88.506476, 10, 10);
    ellipse(369.501703, 83.256437, 10, 10);
    ellipse(17.812052, 298.544807, 10, 10);
    ellipse(495.265612, 79.056837, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(0, 325+415, 15, 15);
    if (mouseX>0 && mouseX<15 && mouseY>325+415 && mouseY<340+415 && toggleShops==false) {
      fill(0,158,255);
      rect(0,325+415,15,15);
    }
  }
  if (toggleSafety){
    fill(180,52,23);
    strokeWeight(0);
    rect(310, 385+415-180, 15, 15);
    fill(0);
      text(safety[proxInt] + "/ 5", 310+20, 397+415-180);
      fill(180, 52, 23);
      stroke(255);
      strokeWeight(1);
          ellipse(600.684716, 282.630421, 10, 10);
    ellipse(537.052972, 483.588712, 10, 10);
    ellipse(245.09033, 58.739681, 10, 10);
    ellipse(293.03762, 424.405268, 10, 10);
    ellipse(129.503191, 256.403998, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(310, 385+415-180, 15, 15);
    if (mouseX>310 && mouseX<310+15 && mouseY>385+415-180 && mouseY<400+415-180 && toggleSafety==false) {
      fill(0,158,255);
      rect(310,385+415-180,15,15);
    }
  }
  if (toggleEntertainment){
    fill(255,206,25);
    strokeWeight(0);
    rect(310, 445+415-180, 15, 15);
    fill(0);
      text(entertainment[proxInt] + "/ 5", 310+20, 457+415-180);
      fill(255, 206, 25);
      stroke(255);
      strokeWeight(1);
          ellipse(577.345118, 77.785934, 10, 10);
    ellipse(583.822435, 12.721322, 10, 10);
    ellipse(360.71969, 89.325647, 10, 10);
    ellipse(89.821069, 302.346709, 10, 10);
    ellipse(45.043282, 305.552064, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(310, 445+415-180, 15, 15);
    if (mouseX>310 && mouseX<310+15 && mouseY>445+415-180 && mouseY<460+415-180 && toggleEntertainment==false) {
      fill(0,158,255);
      rect(310,445+415-180,15,15);
    }
  }
  if (toggleBank){
    fill(255,192,89);
    strokeWeight(0);
    rect(310, 505+415-180, 15, 15);
    fill(0);
      text(bank[proxInt] + "/ 10", 310+20, 517+415-180);
      fill(255, 192, 89);
      stroke(255);
      strokeWeight(1);
        ellipse(214.101763, 316.080526, 10, 10);
    ellipse(345.39242, 90.141124, 10, 10);
    ellipse(110.186255, 343.875841, 10, 10);
    ellipse(603.030178, 82.683666, 10, 10);
    ellipse(88.571903, 331.564509, 10, 10);
    ellipse(107.542334, 342.403928, 10, 10);
    ellipse(223.148399, 80.442294, 10, 10);
    ellipse(299.793015, 88.724778, 10, 10);
    ellipse(601.53642, 83.254275, 10, 10);
    ellipse(295.814029, 80.606561, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(310, 505+415-180, 15, 15);
    if (mouseX>310 && mouseX<310+15 && mouseY>505+415-180 && mouseY<515+415-180 && toggleBank==false) {
      fill(0,158,255);
      rect(310,505+415-180,15,15);
    }
  }
  
  if (toggleRestaurant){
    fill(42,40,116);
    strokeWeight(0);
    rect(155, 205+415, 15, 15);
    fill(0);
      text(restaurant[proxInt] + "/ 72", 155+20, 217+415); 
      fill(42, 40, 116);
      stroke(255);
      strokeWeight(1);
          ellipse(436.889282, 93.043248, 10, 10);
    ellipse(380.811676, 82.093886, 10, 10);
    ellipse(310.176167, 104.882616, 10, 10);
    ellipse(245.952383, 80.62681, 10, 10);
    ellipse(221.322069, 105.840141, 10, 10);
    ellipse(98.30765, 387.369996, 10, 10);
    ellipse(491.79292, 362.223856, 10, 10);
    ellipse(491.679316, 253.888942, 10, 10);
    ellipse(612.809871, 92.792956, 10, 10);
    ellipse(279.844217, 81.607289, 10, 10);
    ellipse(277.70695, 81.533801, 10, 10);
    ellipse(302.543218, 83.252114, 10, 10);
    ellipse(288.055516, 82.914936, 10, 10);
    ellipse(279.620008, 371.304002, 10, 10);
    ellipse(72.827756, 287.283915, 10, 10);
    ellipse(284.257062, 88.454603, 10, 10);
    ellipse(309.217082, 386.059877, 10, 10);
    ellipse(115.073725, 140.423295, 10, 10);
    ellipse(13.94517, 276.152707, 10, 10);
    ellipse(56.620632, 289.574998, 10, 10);
    ellipse(204.940862, 357.427816, 10, 10);
    ellipse(307.94171, 88.385438, 10, 10);
    ellipse(305.687971, 83.310472, 10, 10);
    ellipse(123.697045, 349.908307, 10, 10);
    ellipse(305.267214, 88.268722, 10, 10);
    ellipse(159.988367, 481.327888, 10, 10);
    ellipse(552.175447, 515.136501, 10, 10);
    ellipse(616.766633, 12.291203, 10, 10);
    ellipse(108.746366, 312.81869, 10, 10);
    ellipse(119.948092, 333.760491, 10, 10);
    ellipse(117.209537, 126.37852, 10, 10);
    ellipse(57.55969, 280.799716, 10, 10);
    ellipse(53.497717, 280.644095, 10, 10);
    ellipse(583.668109, 24.224291, 10, 10);
    ellipse(108.267374, 131.494553, 10, 10);
    ellipse(110.805015, 134.384345, 10, 10);
    ellipse(266.730888, 89.792509, 10, 10);
    ellipse(111.372817, 324.369209, 10, 10);
    ellipse(122.701207, 325.880028, 10, 10);
    ellipse(234.235109, 72.931431, 10, 10);
    ellipse(116.411701, 154.986806, 10, 10);
    ellipse(70.220232, 371.68657, 10, 10);
    ellipse(221.657553, 341.355649, 10, 10);
    ellipse(118.187904, 323.78347, 10, 10);
    ellipse(226.46786, 241.444952, 10, 10);
    ellipse(361.495687, 83.159174, 10, 10);
    ellipse(221.899233, 337.40461, 10, 10);
    ellipse(225.218695, 119.924581, 10, 10);
    ellipse(356.769822, 83.098655, 10, 10);
    ellipse(257.552869, 89.061956, 10, 10);
    ellipse(340.329753, 88.350856, 10, 10);
    ellipse(352.33805, 88.078519, 10, 10);
    ellipse(118.528586, 328.244599, 10, 10);
    ellipse(117.106168, 311.016083, 10, 10);
    ellipse(75.014524, 296.007324, 10, 10);
    ellipse(102.64904, 304.875546, 10, 10);
    ellipse(231.007369, 75.235483, 10, 10);
    ellipse(242.276067, 25.285538, 10, 10);
    ellipse(116.969313, 306.708413, 10, 10);
    ellipse(255.765019, 18.075109, 10, 10);
    ellipse(522.562358, 320.867742, 10, 10);
    ellipse(465.520035, 516.86562, 10, 10);
    ellipse(112.122608, 331.759035, 10, 10);
    ellipse(222.678142, 306.235067, 10, 10);
    ellipse(79.698167, 297.686731, 10, 10);
    ellipse(76.457325, 296.865399, 10, 10);
    ellipse(315.489117, 291.005845, 10, 10);
    ellipse(109.143828, 108.183859, 10, 10);
    ellipse(245.20389, 19.35898, 10, 10);
    ellipse(335.66358, 88.15633, 10, 10);
    ellipse(213.002203, 355.37881, 10, 10);
    ellipse(102.536935, 302.956223, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(155, 205+415, 15, 15);
    if (mouseX>155 && mouseX<155+15 && mouseY>205+415 && mouseY<220+415 && toggleRestaurant==false) {
      fill(0,158,255);
      rect(155,205+415,15,15);
    }
  }
  if (toggleCafe){
    fill(241, 89, 41);
    strokeWeight(0);
    rect(155, 265+415, 15, 15);
    fill(0);
      text(cafe[proxInt] + "/ 34", 155+20, 277+415); 
      fill(241, 89, 41);
      stroke(255);
      strokeWeight(1);
          ellipse(337.519858, 371.762219, 10, 10);
    ellipse(304.613513, 83.36883, 10, 10);
    ellipse(66.346071, 284.940958, 10, 10);
    ellipse(112.285669, 328.815208, 10, 10);
    ellipse(310.539043, 88.46541, 10, 10);
    ellipse(106.970163, 311.020405, 10, 10);
    ellipse(302.825663, 88.443796, 10, 10);
    ellipse(38.299534, 282.742814, 10, 10);
    ellipse(108.461009, 335.876501, 10, 10);
    ellipse(286.293872, 82.953841, 10, 10);
    ellipse(363.713029, 213.867654, 10, 10);
    ellipse(440.689591, 107.159355, 10, 10);
    ellipse(112.841824, 335.986732, 10, 10);
    ellipse(110.921487, 334.743927, 10, 10);
    ellipse(110.723484, 135.82816, 10, 10);
    ellipse(112.193947, 325.501783, 10, 10);
    ellipse(92.403843, 318.256771, 10, 10);
    ellipse(466.419784, 525.770587, 10, 10);
    ellipse(461.318296, 506.359057, 10, 10);
    ellipse(111.553349, 307.810727, 10, 10);
    ellipse(122.932696, 339.563849, 10, 10);
    ellipse(359.211373, 83.178626, 10, 10);
    ellipse(222.322901, 82.320551, 10, 10);
    ellipse(473.575552, 84.918553, 10, 10);
    ellipse(527.435269, 230.966486, 10, 10);
    ellipse(51.571556, 135.633634, 10, 10);
    ellipse(339.01216, 88.340049, 10, 10);
    ellipse(211.482239, 364.301067, 10, 10);
    ellipse(68.765784, 293.227764, 10, 10);
    ellipse(230.304168, 56.338366, 10, 10);
    ellipse(111.706219, 308.72716, 10, 10);
    ellipse(530.437343, 230.890837, 10, 10);
    ellipse(145.123586, 345.151067, 10, 10);
    ellipse(114.61366, 138.184085, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(155, 265+415, 15, 15);
    if (mouseX>155 && mouseX<155+15 && mouseY>265+415 && mouseY<280+415 && toggleCafe==false) {
      fill(0,158,255);
      rect(155,265+415,15,15);
    }
  }
  if (toggleBar){
    fill(78, 196, 207);
    strokeWeight(0);
    rect(155, 325+415, 15, 15);
    fill(0);
      text(bar[proxInt] + "/ 16", 155+20, 337+415); 
      fill(78, 196, 207);
      stroke(255);
      strokeWeight(1);
          ellipse(108.663277, 405.023496, 10, 10);
    ellipse(90.917365, 331.341885, 10, 10);
    ellipse(100.979118, 314.039881, 10, 10);
    ellipse(301.684234, 83.193756, 10, 10);
    ellipse(69.352513, 284.940958, 10, 10);
    ellipse(51.42451, 298.114688, 10, 10);
    ellipse(300.63016, 83.113784, 10, 10);
    ellipse(215.9606, 340.996857, 10, 10);
    ellipse(53.164315, 288.325709, 10, 10);
    ellipse(353.470743, 88.059067, 10, 10);
    ellipse(196.22582, 349.348505, 10, 10);
    ellipse(364.873384, 88.078519, 10, 10);
    ellipse(23.032924, 268.32844, 10, 10);
    ellipse(370.828032, 83.256437, 10, 10);
    ellipse(72.903463, 281.36168, 10, 10);
    ellipse(226.697893, 368.64548, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(155, 325+415, 15, 15);
    if (mouseX>155 && mouseX<155+15 && mouseY>325+415 && mouseY<340+415 && toggleBar==false) {
      fill(0,158,255);
      rect(155,325+415,15,15);
    }
  }
  if (toggleEducation){
    fill(0, 87, 58);
    strokeWeight(0);
    rect(465, 385+415-180, 15, 15);
    fill(0);
      text(education[proxInt] + "/ 22", 465+20, 397+415-180); 
      fill(0, 87, 58);
      stroke(255);
      strokeWeight(1);
          ellipse(491.995017, 492.884955, 10, 10);
    ellipse(493.260173, 174.723248, 10, 10);
    ellipse(487.436432, 182.229402, 10, 10);
    ellipse(492.915062, 181.539181, 10, 10);
    ellipse(247.284487, 380.754165, 10, 10);
    ellipse(136.323518, 330.695573, 10, 10);
    ellipse(126.219065, 228.981346, 10, 10);
    ellipse(275.337687, 89.814129, 10, 10);
    ellipse(361.175388, 164.762816, 10, 10);
    ellipse(287.436757, 174.566925, 10, 10);
    ellipse(62.701943, 23.348924, 10, 10);
    ellipse(135.50006, 23.348924, 10, 10);
    ellipse(260.873786, 113.403639, 10, 10);
    ellipse(99.105369, 467.63326, 10, 10);
    ellipse(306.694, 29.681825, 10, 10);
    ellipse(242.159595, 342.987506, 10, 10);
    ellipse(494.818649, 167.525085, 10, 10);
    ellipse(390.290558, 23.346762, 10, 10);
    ellipse(104.652364, 469.805467, 10, 10);
    ellipse(597.424947, 521.272714, 10, 10);
    ellipse(382.418485, 41.64301, 10, 10);
    ellipse(621.204229, 223.593952, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(465, 385+415-180, 15, 15);
    if (mouseX>465 && mouseX<465+15 && mouseY>385+415-180 && mouseY<400+415-180 && toggleEducation==false) {
      fill(0,158,255);
      rect(465,385+415-180,15,15);
    }
  }
  if (toggleHealthcare){
    fill(199, 0, 22);
    strokeWeight(0);
    rect(465, 445+415-180, 15, 15);
    fill(0);
      text(healthcare[proxInt] + "/ 6", 465+20, 457+415-180);
      fill(199, 0, 22);
      stroke(255);
      strokeWeight(1);
          ellipse(229.659331, 180.697455, 10, 10);
    ellipse(291.806888, 91.474994, 10, 10);
    ellipse(258.195782, 12.702675, 10, 10);
    ellipse(230.890897, 88.688034, 10, 10);
    ellipse(578.98301, 141.460767, 10, 10);
    ellipse(310.164876, 377.226237, 10, 10);

  } else {
    fill(200);
    strokeWeight(0);
    rect(465, 445+415-180, 15, 15);
    if (mouseX>465 && mouseX<465+15 && mouseY>445+415-180 && mouseY<460+415-180 && toggleHealthcare==false) {
      fill(0,158,255);
      rect(465,445+415-180,15,15);
    }
  }
  if (toggleMarket){
    fill(0, 159, 133);
    strokeWeight(0);
    rect(465, 505+415-180, 15, 15);
    fill(0);
      text(market[proxInt] + "/ 4", 465+20, 517+415-180);
      fill(0, 159, 133);
      stroke(255);
      strokeWeight(1);
          ellipse(116.740736, 105.255162, 10, 10);
    ellipse(318.775093, 76.988378, 10, 10);
    ellipse(584.249015, 62.422706, 10, 10);
    ellipse(103.492008, 334.387297, 10, 10);


  } else {
    fill(200);
    strokeWeight(0);
    rect(465, 505+415-180, 15, 15);
    if (mouseX>465 && mouseX<465+15 && mouseY>505+415-180 && mouseY<520+415-180 && toggleMarket==false) {
      fill(0,158,255);
      rect(465,505+415-180,15,15);
    }
  }
  
  color foreground = color(((per1/1)*255), (255 - (255*per1)), 0, 75);
  tint(foreground);
  image(proxImages[proxInt], 0, 0, proxImages[proxInt].width, proxImages[proxInt].height);
  noTint();
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(320.22609, 393.855558, 10, 10);
  
  
}


void mouseClicked() {
  if (mouseX>0 && mouseX<15 && mouseY>205+415 && mouseY<220+415) {
    if (toggleTourism==false) {
      toggleTourism=true;
    } else {
      toggleTourism=false;
    }
  }
  if (mouseX>0 && mouseX<15 && mouseY>265+415 && mouseY<280+415) {
    if (toggleSport==false) {
      toggleSport=true;
    } else {
      toggleSport=false;
    }
  }
  if (mouseX>0 && mouseX<15 && mouseY>325+415 && mouseY<340+415) {
    if (toggleShops==false) {
      toggleShops=true;
    } else {
      toggleShops=false;
    }
  }
  if (mouseX>310 && mouseX<325 && mouseY>385+415-180 && mouseY<400+415-180) {
    if (toggleSafety==false) {
      toggleSafety=true;
    } else {
      toggleSafety=false;
    }
  }
  if (mouseX>310 && mouseX<325 && mouseY>445+415-180 && mouseY<460+415-180) {
    if (toggleEntertainment==false) {
      toggleEntertainment=true;
    } else {
      toggleEntertainment=false;
    }
  }
  if (mouseX>310 && mouseX<325 && mouseY>505+415-180 && mouseY<520+415-180) {
    if (toggleBank==false) {
      toggleBank=true;
    } else {
      toggleBank=false;
    }
  }
  if (mouseX>155 && mouseX<170 && mouseY>205+415 && mouseY<220+415) {
    if (toggleRestaurant==false) {
      toggleRestaurant=true;
    } else {
      toggleRestaurant=false;
    }
  }
  if (mouseX>155 && mouseX<170 && mouseY>265+415 && mouseY<280+415) {
    if (toggleCafe==false) {
      toggleCafe=true;
    } else {
      toggleCafe=false;
    }
  }
  if (mouseX>155 && mouseX<170 && mouseY>325+415 && mouseY<340+415) {
    if (toggleBar==false) {
      toggleBar=true;
    } else {
      toggleBar=false;
    }
  }
  if (mouseX>465 && mouseX<480 && mouseY>385+415-180 && mouseY<400+415-180) {
    if (toggleEducation==false) {
      toggleEducation=true;
    } else {
      toggleEducation=false;
    }
  }
  if (mouseX>465 && mouseX<480 && mouseY>445+415-180 && mouseY<460+415-180) {
    if (toggleHealthcare==false) {
      toggleHealthcare=true;
    } else {
      toggleHealthcare=false;
    }
  }
  if (mouseX>465 && mouseX<480 && mouseY>505+415-180 && mouseY<520+415-180) {
    if (toggleMarket==false) {
      toggleMarket=true;
    } else {
      toggleMarket=false;
    }
  }

}
  

  


class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = 1;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(200);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 158, 255);
    } else {
      fill(100, 100, 100);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
  
  


