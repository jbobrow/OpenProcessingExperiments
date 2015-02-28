
//DOCUMENT
size(640, 360);
background (200, 150, 150);
smooth();

//BACKGROUND LINES PERSPECTIVE
noFill ();
stroke (204, 255, 51, 70);
for (int e = 5; e < 1500; e += 5) {
  for (int d = 5; d < 1000; d += 200) {
  ellipse (d, d, e, e);
  }
}

noFill ();
stroke (235, 0, 139, 15);
for (int e = 5; e < 1500; e += 20) {
  for (int d = 0; d < 500; d += 150) {
  ellipse (d, d, e, e);
  }
}

noFill ();
stroke (235, 0, 139, 15);
for (int e = 5; e < 1500; e += 20) {
  for (int d = 200; d < 500; d += 150) {
  ellipse (d, 320, e, e);
  }
}

//GENERAL DRAWING SETTINGS
strokeWeight (2);
strokeJoin(ROUND);
stroke (255, 255, 255, 50);

//START TESSERACT
fill (14, 117, 143, 50);
quad (109.815, 233.224, 185.253, 253.896, 185.253, 145.454, 109.815, 124.781);

//START INSIDE CUBE
fill (139, 232, 255, 50);
quad (34.195, 253.896, 109.634, 233.224, 109.634, 124.781, 34.195, 145.454);
fill (116, 132, 161, 50);
quad (73.624, 242.761, 125.442, 264.943, 174.089, 203.785, 122.27, 181.604);
fill (116, 227, 255, 50);
quad (73.522, 242.68, 122.168, 181.521, 88.896, 136.022, 40.251, 197.18);
fill (0, 184, 230, 50);
quad (122.168, 181.521, 174.331, 203.478, 140.958, 157.897, 88.896, 136.022);
fill (139, 232, 255, 50);
quad (73.522, 242.372, 125.687, 264.635, 92.313, 219.055, 40.251, 196.873);
fill (185, 241, 255, 50);
quad (40.495, 196.873, 92.313, 219.055, 140.958, 157.897, 89.14, 135.715);
fill (23, 209, 255, 50);
quad (92.416, 219.136, 125.687, 264.635, 174.331, 203.478, 141.062, 157.979);
//END OF INSIDE CUBE


//START DIVISIONS REFLECTIONS
fill (162, 255, 232, 50);
triangle (34.195, 253.896, 108.642, 274.842, 73.624, 243.092);
fill (162, 236, 255, 50);
quad (34.195, 254.441, 109.634, 275.114, 109.634, 166.671, 34.195, 145.998);
fill (14, 117, 143, 50);
quad (34.195, 254.441, 109.634, 274.842, 185.253, 254.168, 109.634, 232.952);
fill (16, 132, 161, 50);
quad (109.815, 275.114, 185.253, 254.441, 185.253, 145.998, 109.815, 166.671);
fill (125, 255, 223, 50);
triangle (125.687, 264.635, 184.758, 253.896, 143.642, 242.286);
fill (51, 255, 204, 50);
quad (143.642, 242.286, 184.758, 253.896, 185.302, 145.998, 174.105, 203.565);
fill (61, 192, 160, 50);
triangle (110.312, 124.96, 140.977, 158.343, 184.758, 145.906);
fill (181, 255, 236, 50);
quad (34.195, 253.896, 40.495, 196.873, 72.592, 156.52, 34.195, 145.998);
fill (61, 192, 160, 50);
triangle (34.195, 145.454, 72.592, 156.52, 88.896, 136.022);
line (109.815, 124.781, 141.062, 157.979);
fill (116, 227, 255, 50);
quad (34.195, 145.998, 109.634, 166.671, 185.253, 145.998, 109.634, 124.781);
//FINISH TESSERACT


//START NEW TESSERACT
fill(215, 53, 136, 70);
quad(306.55, 247.825, 360.211, 232.102, 344.411, 178.189, 290.761, 193.911);
fill(236, 58, 148, 70);
quad(306.559, 247.825, 356.396, 275.485, 340.6, 221.574, 290.761, 193.911);
fill(158, 32,103, 70);
quad(333.188, 282.287, 360.211, 232.102, 344.411, 178.189, 317.389, 228.375);
fill(242, 144, 188, 70);
quad(333.188, 282.287, 360.211, 232.102, 344.411, 178.189, 317.389, 228.375);
fill(242, 144, 188, 70);
quad(279.535, 298.009, 306.559, 247.825, 290.761, 193.911, 263.736, 244.097);
fill(151, 52, 103, 70);
quad(360.211, 232.102, 410.049, 259.763, 394.25, 205.851, 344.411, 178.189);
fill(239, 108, 168, 70);
quad(279.535, 298.009, 333.188, 282.287, 317.389, 228.375, 263.736, 244.097);
fill(151, 52, 103, 70);
quad(356.396, 275.485, 410.049, 259.763, 394.25, 205.851, 340.6, 221.574);
fill(238, 86, 158, 70);
quad(333.188, 282.287, 383.022, 309.949, 367.227, 256.037, 317.389, 228.375);
fill(241, 128, 178, 70);
quad(329.371, 325.672, 356.396, 275.485, 340.6, 221.574, 313.574, 271.758);
fill(246, 179, 208, 70);
quad(279.535, 298.009, 329.371, 325.672, 313.574, 271.758, 263.736, 244.097);
fill(244, 162, 198, 70);
quad(329.371, 325.672, 383.022, 309.949, 367.227, 256.037, 313.574, 271.758);
fill(125, 77, 99, 70);
quad(383.022, 309.949, 410.049, 259.763, 394.25, 205.851, 367.227, 256.037);
//END OF FORM

//START PYRAMID
fill(138, 179, 18, 50);
quad(356.735, 216.991, 488.546, 273.186, 610.808, 215.881, 478.996, 159.686);
fill(232, 255, 162, 50);
triangle(356.735, 216.991, 478.996, 159.686, 478.063, 70.057);
fill(181, 206, 104, 50);
triangle(478.996, 159.686, 610.808, 215.881, 478.063, 70.057);
fill(143, 179, 36, 50);
triangle(488.546, 273.186, 610.808, 215.881, 478.063, 70.057);
fill(204, 255, 51, 50);
triangle(356.735, 216.991, 488.546, 273.186, 478.063, 70.057);
//END PYRAMID

//START STAR SHAPE
fill(255, 0, 0, 50);
beginShape();
vertex(175.355, 129.923);
vertex(283.779, 127.713);
vertex(319.387, 25.277);
vertex (354.994, 127.713);
vertex(463.418, 129.923);
vertex(377, 195.441);
vertex(408.404, 299.242);
vertex(319.387, 237.299);
vertex(230.369, 299.242);
vertex(261.773, 195.441);
endShape();

//RECTANGLE FRAME
noFill();
strokeWeight (2);
stroke (255, 255, 255);
rect(5, 5, 630, 350);

//ARCS
noFill();
strokeWeight (2);
stroke (255, 255, 0, 80);
arc (5, 5, 700, 700, 0, radians (90));
arc (635, 355, 700, 700, radians (180), radians (270));
