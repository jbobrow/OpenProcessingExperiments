
PShape bond;
PShape blond;
PShape oldFrontTire;
PShape oldBackTire;
PShape newFrontTire;
PShape newBackTire;

void setup(){
  size(640,480);
  smooth();
  bond = loadShape("jamesbond.svg");
  blond = loadShape("blond.svg");
  oldFrontTire = loadShape("old_front_tire.svg");
  oldBackTire = loadShape("back_front_tire.svg");
  newFrontTire = loadShape("new_front_tire.svg");
  newBackTire = loadShape("new_back_tire.svg");
}

void draw(){
  background(255);
  
  int y = height;
  
  fill(0);
  beginShape();
  vertex(583.75-mouseX/31.81,290.5+mouseX/123.79);//563.63,295.67
  vertex(581-mouseX/24.93,296.5-mouseX/771.08);//555.33,295.67
  vertex(507-mouseX/19.05,302.5+mouseX/1280);//473.4,303
  vertex(433.5-mouseX/3.74,306.5-mouseX/182.86);//262.47,303
  vertex(239.5+mouseX/45.17,309-mouseX/106.67);//253.67,303
  vertex(160+mouseX/25.6,299+mouseX/76.83);//185,307.33
  vertex(149.5+mouseX/30.23,299.25+mouseX/61.42);//170.67,309.67
  vertex(151+mouseX/34.59,241.87-mouseX/342.25);//169.5,240
  vertex(553+mouseX/19.20,241.87-mouseX/43.04);//586.33,227
  endShape(CLOSE);
  
    //WHEELS
  fill(10);
  ellipse(195.5+mouseX/29.1,286.5+mouseX/256,75+mouseX/213.33,75+mouseX/213.33);//217.5,289,78,78
  ellipse(474.5+mouseX/14.38, 287+mouseX/1280,75+mouseX/256,75+mouseX/256);//519, 286.5,78,78
  
  shape(oldFrontTire,0+mouseX/7,0-mouseX/15);
  shape(oldBackTire,0-mouseX/8,0-mouseX/15);
  shape(newFrontTire,0-mouseX/6.53,0+mouseX/23);
  shape(newBackTire,0+mouseX/4.95,0+mouseX/23.55);
  
  strokeWeight(1);
  stroke(0);
  fill(220-mouseX/7);
  beginShape();
  vertex(427.5+mouseX/13.96,298+mouseX/83.44);//473.33,305.67
  vertex(254.5+mouseX/3.32,302.5+mouseX/426.67);//447.33,304
  vertex(250.75+mouseX/53.7,298.25+mouseX/70.48);//262.67,307.33
  vertex(246+mouseX/40,290.25+mouseX/307.69);//262,292.33
  vertex(242+mouseX/34.28,282.25-mouseX/1103.45);//260.67,281.67
  vertex(235.75+mouseX/34.45,268-mouseX/481.2);//254.33,266.67
  vertex(229+mouseX/37.65,259-mouseX/192.19);//246,255.67
  vertex(219.5+mouseX/46.28,251-mouseX/174.39);//233.33,247.33
  vertex(204.5+mouseX/43.16,246.25-mouseX/333.3);//219.33,244.33
  vertex(190.5+mouseX/52.42,245.5+mouseX/1103.45);//202.71,246.08
  vertex(176+mouseX/53.33,248.75+mouseX/130.08);//188,253.67
  vertex(167.5+mouseX/57.3,252.75+mouseX/48.3);//178.67,266
  vertex(158.5+mouseX/42.19,261.75+mouseX/36.41);//173.67,279.33
  vertex(155.25+mouseX/36.74,268.5+mouseX/24.15);//172.67,295
  vertex(153.5+mouseX/32.82,284+mouseX/27.43);//173,307.33
  vertex(151.25+mouseX/125.98,295+mouseX/68.6);//156.33,304.33
  vertex(149.5-mouseX/71.1,299.25-mouseX/853.3);//140.5,298.5
  vertex(139.25+mouseX/512,296.25-mouseX/134.74);//140.5,291.5
  vertex(132.75+mouseX/134.74,296-mouseX/44.14);//137.5,281.5
  vertex(130.25+mouseX/88.28,291-mouseX/20);//137.5,259
  vertex(124+mouseX/40,281.5-mouseX/22.1);//140.5,252.5
  vertex(120.5+mouseX/18.55,273.75-mouseX/21.51);//155,244
  vertex(120.5+mouseX/12.55,261.75-mouseX/25.35);//171.5,236.5
  vertex(123.5+mouseX/10.16,252.5-mouseX/29.77);//186.5,231
  vertex(130+mouseX/8.15,244.75-mouseX/32.41);//208.5,225
  vertex(138+mouseX/6.63,237.75-mouseX/38.21);//234.5,221
  vertex(146.5+mouseX/5.42,234.5-mouseX/40);//264.5,218.5
  vertex(158.5+mouseX/5.45,231-mouseX/41.29);//276,215.5
  vertex(185+mouseX/5.71,228-mouseX/40);//297,212
  vertex(220+mouseX/6.15,226-mouseX/25.1);//324,200.5
  vertex(272.5+mouseX/7.9,223.5-mouseX/18.29);//353.5,188.5
  vertex(294+mouseX/7.57,217.75-mouseX/17.66);//378.5, 181.5
  vertex(301+mouseX/6.6,210.25-mouseX/20.16);//398,178.5
  vertex(313.25+mouseX/5.46,198.75-mouseX/32);//430.5,178.5
  vertex(323+mouseX/4.89,190.75-mouseX/65.64);//454,181
  vertex(325+mouseX/4.09,186.75-mouseX/512);//481.5,185.5
  vertex(339.5+mouseX/3.59,182.75+mouseX/56.89);//518,194
  vertex(355.35+mouseX/3.23, 181.25+mouseX/28.76);//553.5,203.5
  vertex(383+mouseX/3.43,181.25+mouseX/24.38);//569.5,207.5
  vertex(419.25+mouseX/3.99,183.25+mouseX/26.39);//579.5,207.5
  vertex(444.75+mouseX/4.51,186.75+mouseX/32.41);//586.5,206.5
  vertex(465.5+mouseX/4.96,191.5+mouseX/35.56);//594.5,209.5
  vertex(521.75+mouseX/8.8,212.75+mouseX/512);//594.5,214
  vertex(553.75+mouseX/16.59,227.75-mouseX/72.48);//592.33,218.67
  vertex(596.75-mouseX/853.33,230.75-mouseX/232.73);//596,228
  vertex(593.25+mouseX/134.74,259.75-mouseX/27.73);//598,236.67
  vertex(592+mouseX/56.61,268.75-mouseX/22.26);//602.67,240
  vertex(592+mouseX/51.91,282.25-mouseX/20.48);//604.33,251
  vertex(583.75+mouseX/31.1,290.5-mouseX/21.45);//604.33,260.67
  vertex(556.5+mouseX/14.38,292.5-mouseX/24.78);//601,266.67
  vertex(524+mouseX/8.31,292.5-mouseX/34.59);//601,274
  vertex(519.25+mouseX/8.16,281.25+mouseX/592.59);//597.67,282.33
  vertex(513+mouseX/8.1,266.75+mouseX/31.1);//592,287.33
  vertex(503.75+mouseX/10.68,255.75+mouseX/15.64);//563.67,296.67
  vertex(490.25+mouseX/8.8,250+mouseX/23.7);//563,277
  vertex(476.5+mouseX/7.66,248.25+mouseX/34.13);//560,267
  vertex(461.5+mouseX/6.94,248.25+mouseX/79.21);//553.67,256.33
  vertex(449+mouseX/6.78,251.25-mouseX/219.18);//543.33,248.33
  vertex(439.5+mouseX/6.82,257.5-mouseX/44.14);//533.33,243
  vertex(434.25+mouseX/7.24,265.25-mouseX/26.76);//522.67,241.33
  vertex(431.75+mouseX/8.14,272.25-mouseX/21.39);//510.33,242.33
  vertex(429.25+mouseX/9,285.5-mouseX/16.34);//500.33,246.33
  vertex(429.25+mouseX/10.71,285.5-mouseX/20.32);//489,254
  vertex(429.25+mouseX/12.37,285.5-mouseX/30.23);//481,264.33
  vertex(429.25+mouseX/13.69,285.5-mouseX/75.29);//476,277
  vertex(429.25+mouseX/14.41,285.5+mouseX/85.33);//473.67,293
  endShape(CLOSE);
  endShape();
  

  
  //SIDE WINDOWS
  fill(0);
  beginShape();
  vertex(321-mouseX/69.19,223.5-mouseX/640);//311.75,222.5
  vertex(340.5+mouseX/116.36,195.25+mouseX/75.29);//346,203.75
  vertex(344+mouseX/26.39,191.5+mouseX/182.86);//368.25,195
  vertex(350.5+mouseX/15.06, 189.5-mouseX/853.33);//393,188.75
  vertex(427.75-mouseX/32.82,191.25-mouseX/170.67);//408.25, 187.5
  vertex(440.25-mouseX/67.37,194-mouseX/121.9);//430.75,188.75
  vertex(457.75-mouseX/131.74,198-mouseX/98.46);//453,191.5
  vertex( 474.5-mouseX/102.4,203.25-mouseX/71.11);//468.25,194.25
  vertex(488.5-mouseX/2560,211.25-mouseX/56.89);//488.25, 200
  vertex(500-mouseX/54.47,220.25-mouseX/34.59);//488.25,201.75
  vertex(500-mouseX/36.57,223.5-mouseX/45.71);//482.5,209.5
  vertex(426+mouseX/29.43,223.5-mouseX/73.14);//447.75,214.75
  vertex(423.75-mouseX/26.95,225-mouseX/102.4);//400,218.75
  vertex(423.75-mouseX/9.52,225-mouseX/170.67);//356.5,221.25
  endShape(CLOSE);
  
    //FRONT WINDOW
  beginShape();
  fill(240-mouseX/6);
  vertex(295.99+mouseX/231.88,223.85-mouseX/177.78);//298.75,220.25
  vertex(293.67+mouseX/248.06,221.33-mouseX/274.68);//296.25,219
  vertex(294-mouseX/1280,217.75-mouseX/512);//293.5,216.5
  vertex(301-mouseX/160,210.25+mouseX/365.71);//297,212
  vertex(313.25+mouseX/59.53,198.75+mouseX/365.71);//324,200.5
  vertex(323+mouseX/20.98,190.75-mouseX/284.44);//353.5,188.5
  vertex(327.67+mouseX/17.54,189.5-mouseX/160.8);//364.15,185.52
  vertex(333.24+mouseX/18.28,190.12-mouseX/1032.26);//368.25,189.5
  vertex(335.67-mouseX/86.25, 195+mouseX/56.89);//328.25,206.25
  vertex(317+mouseX/56.89,223.6-mouseX/36.89);//328.25,206.25
  endShape(CLOSE);
  
  //DOOR FRAME
  noFill();
  beginShape();
  vertex(301.33+mouseX/61.42,226.17-mouseX/174.39);//311.75,222.5
  vertex(296.83+mouseX/78.34,229.83-mouseX/226.15);//305,227
  vertex(294.67+mouseX/87.31,235.17+mouseX/132.51);//302,240
  vertex(294.67+mouseX/87.31,289.33-mouseX/26.3);//302,265
  vertex(413.67-mouseX/5.8,286.83-mouseX/274.68);//303.25,284.5
  vertex(422.17-mouseX/5.42,250.17+mouseX/15.97);//304,290.25
  vertex(424.33-mouseX/26.3,240+mouseX/13.4);//400,287.75
  vertex(425.17-mouseX/76,235.17+mouseX/12.91);//416.75,284.75
  vertex(425.17-mouseX/333.33,226.17+mouseX/11.36);//423.25,282.5
  vertex(423.75+mouseX/232.73,225+mouseX/12.31);//429.5,277
  vertex(423.75+mouseX/38.21,225+mouseX/22.07);//440.5,254
  vertex(423.75+mouseX/29.43,225+mouseX/42.67);//445.5,240
  vertex(423.75+mouseX/27.83,225+mouseX/77.58);//446.75,233.25
  vertex(423.75+mouseX/27.83,225+mouseX/160);//446.75,229
  vertex(423.75+mouseX/27.83,225-mouseX/640);//446.75,224
  vertex(423.75+mouseX/29.47,225-mouseX/63.62);//445.47,214.94
  endShape();
  
  
  //REAR HEADLIGHT
  fill(152,28,28);
  beginShape();
  vertex(596.02-mouseX/173.44,239.79-mouseX/30.3);//592.33,218.67
  vertex(598.25-mouseX/56.89,241.87-mouseX/34.22);//587,223.17
  vertex(599.75-mouseX/34.45,244.5-mouseX/33.11);//581.17,225.17
  vertex(599.75-mouseX/23.63,247.25-mouseX/33.54);//572.67,228.17
  vertex(596.75-mouseX/25.02,249.5-mouseX/32.82);//571.17,230
  vertex(599.75-mouseX/22.39,252.25-mouseX/33.25);//571.17, 233
  vertex(599.75-mouseX/28.76,257.17-mouseX/34.28);//577.5,238.5
  vertex(597.88+mouseX/5333.33,258.25-mouseX/29.66);//598,236.67
  vertex(593.08+mouseX/219.18,260.98-mouseX/19.41);//596,228
  endShape(CLOSE);
  
  //FRONT HEADLIGHT
  fill(220);
  beginShape();
  vertex(138+mouseX/20.26,237.75+mouseX/86.25);//169.59,245.17
  vertex(138+mouseX/24.31,237.75+mouseX/74.59);//164.33,246.33
  vertex(130+mouseX/25.6,244.75+mouseX/144.8);//155,249.17
  vertex(130+mouseX/36.93,244.75+mouseX/77.58);//147.33,253
  vertex(124+mouseX/36.57,251.9+mouseX/90.14);//141.5,259
  vertex(124+mouseX/28.44,251.9+mouseX/90.14);//146.5,259
  vertex(126+mouseX/23.85,251.9+mouseX/121.44);//152.83,257.17
  vertex(126+mouseX/17.86,251.9+mouseX/331.61);//161.83,253.83
  vertex(137.75+mouseX/20.93,240.5+mouseX/72.48);//168.33,249.33
  endShape(CLOSE);
  
  //Yellow Reflector
  fill(242,167,2);
  beginShape();
  vertex(120.5+mouseX/20.16, 273.75+mouseX/512);//152.25, 275
  vertex(120.5+mouseX/20.16, 273.75+mouseX/170.67);//152.25, 277.5
  vertex(120.5+mouseX/13.4, 273.75+mouseX/170.67);//168.25, 277.5
  vertex(120.5+mouseX/13.4, 273.75+mouseX/512);//168.25,205
  endShape(CLOSE);
  
  //RED REFLECTOR
  fill(152,28,28);
  beginShape();
  vertex(592-mouseX/32.82,268.75-mouseX/73.14);//572.5,260
  vertex(592-mouseX/232.73,268.75-mouseX/73.14);//589.25,260
  vertex(592-mouseX/232.73,268.75-mouseX/116.36);//589.25,263.25
  vertex(592-mouseX/32.82,268.75-mouseX/116.36);//572.5,263.25
  endShape(CLOSE);
  
  noFill();
  beginShape();
  vertex(513+mouseX/24.71,266.75-mouseX/30.8);//538.9, 245.97
  vertex(513+mouseX/11.48,266.75-mouseX/28.76);//568.75, 244.5
  vertex(513+mouseX/10.58,266.75-mouseX/26.86);//573.5, 242.92
  vertex(513+mouseX/9.92,266.75-mouseX/22.65);//577.5, 238.5
  endShape();
  
  //VENT BLACK
  fill(0);
  beginShape();
  vertex(248.5+mouseX/67.37, 243.83-mouseX/703.3);//258,242.92
  vertex(247.5+mouseX/48.3, 246+mouseX/182.86);//260.75,249.5
  vertex(248.5+mouseX/32.82, 249.5+mouseX/206.45);//268,252.6
  vertex(251.33+mouseX/14.74, 252.33+mouseX/2370.37);//294.75, 252.6
  vertex(279.83+mouseX/33.83, 252.33-mouseX/139.74);//298.75, 247.75
  vertex(281.83+mouseX/37.83, 249.67-mouseX/137.04);//298.75, 245
  vertex(281.83+mouseX/45.17, 247.17-mouseX/112.875);//296, 241.5
  vertex(280.5+mouseX/41.29, 245-mouseX/182.86);//296, 241.5
  vertex(277.67+mouseX/34.92, 243.83-mouseX/274.68);//296, 241.5
  endShape(CLOSE);
  
  //VENT SLIVER
  noStroke();
  fill(220-mouseX/7);
  beginShape();
  vertex(248.5+mouseX/52.25,249.5);//260.75,249.5
  vertex(247.5+mouseX/53.5,247.17-mouseX/853.33);//259.46,246.42
  vertex(281.83+mouseX/37.83,247.17-mouseX/294.93);//298.75,245
  vertex(281.83+mouseX/37.83,249.67-mouseX/333.33);//298.75,247.75
  endShape();
  
  
  //Interior Windows
  fill(255);
  beginShape();
  vertex(333.24+mouseX/21.87,223.68-mouseX/60.89);//362.5,213.17
  vertex(333.24+mouseX/30.58,223.68-mouseX/42.87);//354.17,208.75
  vertex(346.25+mouseX/80.81,203.25+mouseX/232.73);//354.17,206
  vertex(346.25+mouseX/15.03,203.25-mouseX/69.19);//388.83,194
  vertex(349+mouseX/9.76,201.5-mouseX/68.6);//398.17,192.17
  vertex(420.75+mouseX/33.54,201.5-mouseX/75.29);//439.83,193
  vertex(415.99+mouseX/39.17,224.89-mouseX/39.65);//432.33,208.75
  endShape(CLOSE);
  
  //REAR INTERIOR WINDOWS
  beginShape();
  vertex(426+mouseX/19.2,223.5-mouseX/34.59);//459.33,205
  vertex(430.25+mouseX/22.92,203.5-mouseX/89.26);//458.17,196.33
  vertex(449.25+mouseX/36.41,207.25-mouseX/84.43);//466.83,199.67
  vertex(469.25-mouseX/264.46,214.75-mouseX/49.54);//466.83,201.83
  vertex(485.5-mouseX/34.28,223.5-mouseX/29.53);//466.83,201.83
  endShape(CLOSE);
  
  //FRONT BUMPER
  stroke(0,255-mouseX/(128/51));
  strokeWeight(1);
  fill(200, 255-mouseX/(128/51));
  beginShape();
  vertex(113.38,291.87);
  vertex(113.38,287.25);
  vertex(111,284);
  vertex(111.88,280.25);
  vertex(108.5,280.25);
  vertex(108.5,278);
  vertex(111.88,278);
  vertex(111.88,273.75);
  vertex(114.13,272.75);
  vertex(113.75,270);
  vertex(111.63,270);
  vertex(110.63,271.5);
  vertex(108.5,271.25);
  vertex(109.38,269.25);
  vertex(111,267.75);
  vertex(114.38,267.75);
  vertex(116.75,270.62);
  vertex(116.75,276.25);
  vertex(119.88,277.12);
  vertex(119.75,278.87);
  vertex(122.63,278.46);
  vertex(123.75, 276.12);
  vertex(146.75,277.62);
  vertex(148.88, 279.25);
  vertex(148.88,286.5);
  vertex(148,287.25);
  vertex(132,290.37);
  vertex(127.5,291.87);
  endShape(CLOSE);
  
  //BACK BUMPER
  beginShape();
 vertex( 547.75,y-202);
 vertex( 547.75,y-206.5);
 vertex( 550.25,y-208.25);
 vertex( 592,y-211.25);
 vertex( 605.25,y-211.25);
 vertex( 605.25,y-216);
 vertex( 607.75,y-219.02);
 vertex( 611,y-218);
 vertex( 608.25,y-210.5);
 vertex( 611,y-209.5);
 vertex( 613.75,y-212.76);
 vertex( 613.75,y-219.02);
 vertex( 616.25,y-221.5);
 vertex( 621,y-219.02);
 vertex( 621,y-203);
 vertex( 616.5,y-197);
 vertex( 609,y-197);
 vertex( 607.75,y-193.5);
 vertex( 603.25,y-188.5);
  vertex(584.38,y-190.13);
  vertex(592,y-197.75);
  vertex(592,y-199.5);
  vertex(547.75,y-202);
  endShape(CLOSE);
  
  //SIDE LINE
  stroke(0);
  noFill();
  beginShape();
  vertex(281.83+mouseX/37.83,249.67-mouseX/333.33);//298.75,247.75
  vertex(281.83+mouseX/5.42,249.67-mouseX/94.81);//400,242.92
  vertex(281.83+mouseX/3.57,249.67-mouseX/67.58);//461,240
  endShape();
  
  //SMALL SIDE LINE
  strokeWeight(.5);
  beginShape();
  vertex(281.83+mouseX/37.83,247.17-mouseX/294.93);//298.75,245
  vertex(281.83+mouseX/6.03,247.17-mouseX/150.59);//388,242.92
  endShape();
  
  //LINE
 // 137.75,240.5
 // 138,237.75
  
  
    //SIDE WINDOWS
  fill(201,203,234,80);
  strokeWeight(2);
  stroke(0);
  beginShape();
  vertex(321-mouseX/69.19,223.5-mouseX/640);//311.75,222.5
  vertex(340.5+mouseX/116.36,195.25+mouseX/75.29);//346,203.75
  vertex(344+mouseX/26.39,191.5+mouseX/182.86);//368.25,195
  vertex(350.5+mouseX/15.06, 189.5-mouseX/853.33);//393,188.75
  vertex(427.75-mouseX/32.82,191.25-mouseX/170.67);//408.25, 187.5
  vertex(440.25-mouseX/67.37,194-mouseX/121.9);//430.75,188.75
  vertex(457.75-mouseX/131.74,198-mouseX/98.46);//453,191.5
  vertex( 474.5-mouseX/102.4,203.25-mouseX/71.11);//468.25,194.25
  vertex(488.5-mouseX/2560,211.25-mouseX/56.89);//488.25, 200
  vertex(500-mouseX/54.47,220.25-mouseX/34.59);//488.25,201.75
  vertex(500-mouseX/36.57,223.5-mouseX/45.71);//482.5,209.5
  vertex(426+mouseX/29.43,223.5-mouseX/73.14);//447.75,214.75
  vertex(423.75-mouseX/26.95,225-mouseX/102.4);//400,218.75
  vertex(423.75-mouseX/9.52,225-mouseX/170.67);//356.5,221.25
  endShape(CLOSE);
  
  //FRONT WINDOW
  beginShape();
  vertex(295.99+mouseX/231.88,223.85-mouseX/177.78);//298.75,220.25
  vertex(293.67+mouseX/248.06,221.33-mouseX/274.68);//296.25,219
  vertex(294-mouseX/1280,217.75-mouseX/512);//293.5,216.5
  vertex(301-mouseX/160,210.25+mouseX/365.71);//297,212
  vertex(313.25+mouseX/59.53,198.75+mouseX/365.71);//324,200.5
  vertex(323+mouseX/20.98,190.75-mouseX/284.44);//353.5,188.5
  vertex(327.67+mouseX/17.54,189.5-mouseX/160.8);//364.15,185.52
  vertex(333.24+mouseX/18.28,190.12-mouseX/1032.26);//368.25,189.5
  vertex(335.67-mouseX/86.25, 195+mouseX/56.89);//328.25,206.25
  vertex(317+mouseX/56.89,223.6-mouseX/36.89);//328.25,206.25
  endShape(CLOSE);
  
  
  //REAR VIEW MIRRORS
  fill(200-mouseX/8);
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(242+mouseX/6.48,225-mouseX/134.74);//340.75,220.25
  vertex(241.83+mouseX/6.57,221.83-mouseX/167.1);//339.25,218
  vertex(237.33+mouseX/6.28,218.4-mouseX/130.61);//339.25,213.5
  vertex(245.33+mouseX/6.6,213.5-mouseX/196.92);//342.25,210.25
  vertex(252.01+mouseX/6.81,212.33-mouseX/178.77);//346,208.75
  vertex(252.01+mouseX/6.14,224.48-mouseX/40.69);//356.25,208.75
  vertex(261.84+mouseX/6.66,219.67-mouseX/74.85);//358,211.12
  vertex(261.84+mouseX/6.66,224.01-mouseX/116.15);//358,218.5
  vertex(261.84+mouseX/6.89,224.01-mouseX/170.21);//354.75,220.25
  endShape(CLOSE);
  
  

  shape(bond,0,0);
  blond.disableStyle();
  noStroke();
  fill(222,212,103,mouseX/2.6);
  shape(blond,0,0);
 
}


