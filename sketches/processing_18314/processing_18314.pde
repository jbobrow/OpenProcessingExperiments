
/*Project 1: Draw
by Sarah Scialli
*/


size(640,480);
smooth();


color back = color(238,210,247);
color wood = color(232,179,63);
color fabricFront = color(117, 122, 206);
color fabricBack = color(59,62,103);
background(back);

//front leg outer line
fill(wood);
beginShape();
vertex(125.68, 441.06);
vertex(120.24, 436.74);
vertex(120.36, 429.03);
vertex(124.34, 424.42);
vertex(128.33, 421.7);
vertex(170.05, 430.27);
vertex(175.04, 251.76);
vertex(178.49,238.82);
vertex(186.7,230.61);
vertex(197.22,226.88);
vertex(377.75,226.88);
vertex(386.9,230.61);
vertex(394.04,238.82);
vertex(399.39,247.67);
vertex(449.39,434.53);
vertex(348.45, 460.71);
vertex(220.89,461.82);
endShape(CLOSE);

//front leg left area
beginShape();
vertex(128.33,421.7);
vertex(140.43,413.55);
vertex(170.05,419.9);
vertex(170.05,430.27);
vertex(149.13,426.24);
endShape(CLOSE);

//front leg right area
beginShape();
vertex(449.39,434.53);
vertex(399.39,247.67);
vertex(394.04,238.82);
vertex(401.37,235.09);
vertex(407.41,231.4);
vertex(410.57,238.26);
vertex(413.04,248.67);
vertex(424.78, 294.21);
vertex(458.33,425.05);
endShape(CLOSE);

//front leg inner outline
fill(back);
beginShape();
vertex(191.68,435.53);
vertex(197.67,270.53);
vertex(201.11,258.64);
vertex(209.3,251.1);
vertex(219.79,247.67);
vertex(352.36,247.67);
vertex(363.1,247.67);
vertex(372.25,251.1);
vertex(379.4,259.61);
vertex(384.74,272.35);
vertex(424.78, 422.56);
vertex(383.6, 432.91);
vertex(342.42, 443.26);
vertex(282.96, 442.83);
vertex(224.86, 442.83);
endShape(CLOSE);

//front leg inner outline detail
fill(wood);
beginShape();
vertex(191.68,435.53);
vertex(192.68, 423.67);
vertex(220.97, 429.44);
vertex(339.57, 429.25);
vertex(339.57, 429.25);
vertex(421.92, 408.55);
vertex(424.78, 422.56);
vertex(342.42, 443.26);
vertex(224.86,442.77);
endShape(CLOSE);

//back leg outline
beginShape();
vertex(194.56,375.71);
vertex(194.68,362.12);
vertex(207.39, 366.84);
vertex(207.32, 352.63);
vertex(211.82, 250.1);
vertex(219.79, 247.67);
vertex(225.99, 248.1);
vertex(223, 372.4);
vertex(250.13, 377.71);
vertex(332.17, 377.71);
vertex(386.24, 366.84);
vertex(382.05, 352.63);
vertex(352.36, 247.67);
vertex(363.1, 247.67);
vertex(366.42, 249.56);
vertex(401.06, 372.44);
vertex(331.47, 388.71);
vertex(247.85, 389.85);
vertex(205.02, 380.51);
endShape(CLOSE);

//back leg left area
beginShape();
vertex(194.68, 362.12);
vertex(195.18, 348.63);
vertex(207.32, 352.63);
vertex(207.39, 366.84);
endShape(CLOSE);

//back leg right area
beginShape();
vertex(366.42, 249.56);
vertex(372.68, 252.56);
vertex(407.32, 366.1);
vertex(401.06, 372.44);
endShape(CLOSE);

//back leg detail
beginShape();
vertex(223, 372.4);
vertex(223.32, 356.63);
vertex(248.73, 364.12);
vertex(329.55, 364.12);
vertex(382.05, 352.63);
vertex(386, 366.55);
vertex(332.24, 377.92);
vertex(250.13, 377.71);
endShape(CLOSE);

//chair backrest back
fill(fabricFront);
beginShape();
vertex(400.94, 166.72);
vertex(356.24, 159);
vertex(339.24, 150.79);
vertex(331.63, 141.63);
vertex(329.55, 127.9);
vertex(328.75, 106.25);
vertex(327.75, 95.06);
vertex(328.75, 77.9);
vertex(328.75, 66.7);
vertex(328.75, 55.51);
vertex(328.75, 45.05);
vertex(328.75, 36.1);
vertex(330.66, 20.43);
vertex(334.03, 11.47);
vertex(338.32, 7.23 );
vertex(350.74, 6);
vertex(367.81, 8.47);
vertex(407.41, 13.47);
vertex(415.59, 13.74);
vertex(420.78, 19.97);
vertex(419.42, 59.51);
vertex(407.41, 57.65);
vertex(401.61, 61.38);
endShape(CLOSE);

fill(fabricBack);
beginShape();
vertex(400.94, 166.72);
vertex(393.12,162.72);
vertex(382.87, 149);
vertex(376.34, 118.45);
vertex(373.85, 80.93);
vertex(378, 51.05);
vertex(387.02,30.63);
vertex(393.23, 21.97);
vertex(398.23, 18.69);
vertex(407.41, 13.47);
vertex(415.59, 13.74);
vertex(420.78, 19.97);
vertex(419.42, 59.51);
vertex(407.41, 57.65);
vertex(401.61, 61.38);
endShape(CLOSE);

fill(wood);
beginShape();
vertex(178.49, 240);
vertex(152.36,240);
vertex(156.84, 228.06);
vertex(165.43, 220.02);
vertex(176.69, 216.29);
vertex(194.01, 216.29);
vertex(368.79, 212.62);
vertex(393.73, 213.29);
vertex(401.12, 201.51);
vertex(400.94,166.72);
vertex(401.61, 61.38);
vertex(407.41, 57.65);
vertex(417.28, 57.65);
vertex(423.42, 63.51);
vertex(420.77,214.19);
vertex(412.57,226.88);
vertex(401.37, 235.09);
vertex(394.04, 238.82);
vertex(386.9,230.61);
vertex(377.75,226.88);
vertex(197.22,226.88);
vertex(186.7, 230.61);
endShape(CLOSE);

fill(fabricFront);
beginShape();
vertex(152.36,240);
vertex(156.84, 228.06);
vertex(165.43, 220.02);
vertex(176.69, 216.29);
vertex(194.01, 216.29);
vertex(368.79, 212.62);
vertex(393.73, 213.29);
vertex(394.8,199.92);
vertex(392.29, 196.99);
vertex(380.71, 194.71);
vertex(353.7, 195.71);
vertex(310.27, 195.71);
vertex(272.02, 195.71);
vertex(230.71, 195.71);
vertex(203.93, 195.71);
vertex(180.22, 198.99);
vertex(161.86, 207.65);
vertex(149.43, 216.29);
vertex(141.73, 227.13);
vertex(142.67, 238.82);
endShape(CLOSE);

