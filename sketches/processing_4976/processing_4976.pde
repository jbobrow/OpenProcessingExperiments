
size(480,320);
background(255);

// color settings
color polar = color(247, 245, 242);

// Line settings
strokeWeight(3);
strokeCap(ROUND);
smooth();

// hand in
fill(polar);
ellipse(130.361, 236.171, 46.294, 38.892);

// arm in

fill(255);
beginShape();
vertex(147.725, 245.998);
bezierVertex(147.725, 245.998, 204.248, 172.406, 182, 161);
bezierVertex(159.493, 147.476, 107.604, 231.536, 107.604, 231.536);
endShape();

// sleeve in

fill(255);
beginShape();
vertex(109.243, 229.203);
vertex(113.1, 216.162);
vertex(154.731, 236.379);
vertex(149.359, 243.666);
endShape();

// body
beginShape();
vertex(222, 160);
bezierVertex(181.804, 159.029, 148.953, 195.945, 148.953, 229.143);
bezierVertex(148.953, 247.537, 147.9, 270.994, 163.792, 279.283);
bezierVertex(176.579, 285.945, 204.261, 279.242, 222.328, 279.242);
bezierVertex(239.262, 279.242, 266.765, 285.799, 279.092, 279.643);
bezierVertex(296.267, 270.109, 295.264, 245.037, 295.264, 225.711);
bezierVertex(295.264, 192.516, 262.852, 159.029, 222.328, 159.029);
endShape();

// face
fill(polar);
ellipse(222.107, 103.107, 159.398, 130.685);

// ears 1
fill(polar);
beginShape();
vertex(143.876, 90.093);
bezierVertex(148.21, 71.181, 163.151, 54.885, 183.781, 45.496);
bezierVertex(158, 33, 111, 60, 143.876, 90.093);
endShape();

// ears 2
fill(polar);
beginShape();
vertex(300.874, 87.339);
bezierVertex(326.956, 66.198, 298.956, 29.198, 258.896, 44.687);
bezierVertex(279.95, 53.085, 295.648, 68.653, 300.874, 87.339);
endShape();


// nose 1
fill(polar);
beginShape();
vertex(182.929, 122.574);
bezierVertex(183, 160, 261.357, 160, 261.357, 123.371);
endShape();
beginShape();
vertex(182.929, 122.574);
bezierVertex(183, 78, 261.357, 81, 261.357, 123.371);
endShape();

//nose 2
fill(0);
beginShape();
vertex(222, 116);
bezierVertex(225.79, 116.039, 233.538, 107.725, 231.992, 104.303);
bezierVertex(229.948, 99.777, 213.601, 99.559, 212.134, 104.303);
bezierVertex(211.025, 107.891, 218.337, 115.107, 222.063, 115.572);
endShape();

// eyes
fill(0);
ellipse(184.721, 101.451, 18.3, 16.32);
ellipse(259.676, 101.451, 18.3, 16.32);

// hand out
fill(polar);
ellipse(319, 237, 46.293, 38.893);

// arm out

fill(255);
beginShape();
vertex(340.514, 227.867);
bezierVertex(340.514, 227.867, 288.626, 143.807, 265.438, 156.724);
bezierVertex(243.871, 168.737, 300.395, 242.329, 300.395, 242.329);
endShape();

// sleeves
fill(255);
beginShape();
vertex(338.876, 225.533);
vertex(335.02, 212.49);
vertex(293.390, 232.707);
vertex(298.761, 239.994);
endShape();
line(107.604, 231.536, 147.725, 245.998);
line(300.395, 242.329, 340.514, 227.867);

// neck
beginShape();
fill(polar);
vertex(193.87, 163.719);
bezierVertex(193.87, 163.719, 219.726, 217.13, 251, 163.696);
endShape();

// leg line
noFill();
beginShape();
vertex(156.139, 272.637);
bezierVertex(165.015, 271.598, 286.906, 272.637, 286.906, 272.637);
endShape();
line(222.106, 272.176, 222.328, 279.242);

