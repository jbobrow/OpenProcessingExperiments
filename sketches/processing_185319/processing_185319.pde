
size(316, 121);
background(107, 170, 207);



// red left
beginShape();
noStroke();
fill(200, 53, 40);

curveVertex(1, 49);
curveVertex(1, 49); //repeat first point 
curveVertex(18.36, 47.43);
curveVertex(33.96, 37.76);
curveVertex(51.93, 16.59);
curveVertex(63.51, 8.5);
curveVertex(60.53, 18.26);
curveVertex(58.79, 26.22);
curveVertex(58.33, 50.14);
curveVertex(73.15, 53.57);
curveVertex(80.13, 52.92);
curveVertex(86.64, 48.03);
curveVertex(97.09, 23.9);
curveVertex(96.38, 13.38);
curveVertex(98.22, 11.62);
curveVertex(100.88, 16.78);
curveVertex(111.52, 35.27);
curveVertex(110.34, 57.94);
curveVertex(91.14, 80.22);
curveVertex(89.11, 81.93);
curveVertex(98.95, 92.71);
curveVertex(109.66, 98.13);
curveVertex(122.8, 96.5);
curveVertex(142.85, 84.75);
curveVertex(151.3, 74.25);
curveVertex(153.86, 62.79);
curveVertex(154.55, 55.85);
curveVertex(164.03, 69.38);
curveVertex(166.11, 83.38);
curveVertex(162.69, 92);
curveVertex(152.51, 100.68);
curveVertex(132.82, 111.31);
curveVertex(104.18, 121.02);
curveVertex(102, 122);
curveVertex(1, 122);
curveVertex(1, 122);//repeat last point

endShape();



//circle on right 
beginShape();
curveVertex(207.39, 34.87);
curveVertex(207.39, 34.87); // repeat first point
curveVertex(225.11, 32.35);
curveVertex(247.73, 35.35);
curveVertex(265.27, 43.99);
curveVertex(275.75, 55.47);
curveVertex(280.5, 71.42);
curveVertex(277.43, 86.47);
curveVertex(268.18, 100.38);
curveVertex(257.9, 107.02);
curveVertex(245.69, 110.17);
curveVertex(223.67, 112.17);
curveVertex(202.76, 108.88);
curveVertex(190.98, 103.74);
curveVertex(181.55, 96.44);
curveVertex(174.58, 86.73);
curveVertex(171.98, 76.17);
curveVertex(172.93, 67.46);
curveVertex(175.58, 59.76);
curveVertex(181.06, 50.21);
curveVertex(188.52, 42.6);
curveVertex(197.13, 37.67);
curveVertex(207.39, 34.87);
curveVertex(207.39, 34.87);//repeat last point

endShape();



beginShape(); //triangle shade1
fill(0, 0, 0);

curveVertex(45.96, 23.07);
curveVertex(45.96, 23.07); //repeat first point
curveVertex(51.93, 16.59);
curveVertex(63.51, 8.5);
curveVertex(61.39, 15.49);
curveVertex(58.79, 26.22);
curveVertex(45.96, 23.07);
curveVertex(45.96, 23.07); //repeat end point


endShape();


beginShape(); // triangle shade two
fill(0, 0, 0);

curveVertex(97.09, 23.9);
curveVertex(97.09, 23.9); // repeat first point
curveVertex(96.38, 13.38);
curveVertex(98.22, 11.62);
curveVertex(100.88, 16.78);
curveVertex(103.61, 21.37);
curveVertex(97.09, 23.9);
curveVertex(97.09, 23.9); // repeat last point


endShape();

beginShape(); // circle shade
fill(0, 0, 0);


curveVertex(98.95, 92.71);
curveVertex(98.95, 92.71); //repeat first points
curveVertex(109.66, 98.13);
curveVertex(111.95, 98.41);
curveVertex(122.8, 96.5);
curveVertex(125.09, 95.51);
curveVertex(125.33, 100.67);
curveVertex(120, 105.67);
curveVertex(109.67, 108.33);
curveVertex(100, 105.33);
curveVertex(95.33, 97.67);
curveVertex(98.95, 92.71);
curveVertex(98.95, 92.71); // repreat last points

endShape();

