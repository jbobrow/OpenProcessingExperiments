
  size(187, 175);
background(255);
smooth();
strokeWeight(1);
stroke(0);


              //Eye in the upper left-hand corner


//Circle around the eye in the upper left-hand corner
bezier(0, 2.8, 1.8, 1.3, 6, 0, 9.3, 0);
bezier(0, 73.5, 7.5, 79.7, 21.2, 83.2, 37, 83.5);
bezier(37, 83.5, 52.8, 83.8, 74.5, 81.2, 95.8, 66.3);
bezier(95.8, 66.3, 117.2, 51.5, 124.7, 36.8, 125.5, 26.2);
bezier(125.5, 26.2, 126.3, 15.5, 115.8, 2.2, 114.2, 0);


//Green part of the eye
fill(132, 199, 117);
beginShape();
curveVertex(0, 32);
curveVertex(0, 32);
  curveVertex(9.3, 35.5);
  curveVertex(20.8, 40.8);
  curveVertex(36.2, 47);
  curveVertex(53.5, 49.5);
  curveVertex(69.7, 46);
  curveVertex(84.3, 39);
  curveVertex(100.5, 33.4);
curveVertex(118.2, 27.5);
  curveVertex(102.7, 24.5);
  curveVertex(85, 20);
  curveVertex(85.6, 20.5);
  curveVertex(64.2, 16);
  curveVertex(44.8, 14);
  curveVertex(21.5, 19.7);
curveVertex(0, 30);
curveVertex(0, 30);
endShape(CLOSE);


    //Pupil part of the eye

//Outer red circle
fill(242, 99, 76);
beginShape();
curveVertex(28.7, 17);
curveVertex(28.7, 17);
  curveVertex(26.2, 24.2);
  curveVertex(27, 34.3);
  curveVertex(32, 42);
  curveVertex(40, 44.4);
  curveVertex(47.5, 44.5);
  curveVertex(62.8, 40);
  curveVertex(70.8, 30);
  curveVertex(71.5, 17.3);
  curveVertex(58.7, 12);
curveVertex(40, 11.5);
curveVertex(40, 11.5);
endShape(CLOSE);

//White part
fill(255);
beginShape();
curveVertex(32.5, 14.8);
curveVertex(32.5, 14.8);
  curveVertex(29.2, 23.6);
  curveVertex(29.8, 33.8);
  curveVertex(36.8, 41.2);
  curveVertex(47.3, 42.2);
  curveVertex(56.7, 40.5);
  curveVertex(63.8, 34.8);
  curveVertex(67.8, 27.3);
  curveVertex(68.5, 20.2);
  curveVertex(67.7, 14.3);
  curveVertex(56.6, 11.8);
curveVertex(43.8, 11.3);
curveVertex(43.8, 11.3);
endShape(CLOSE);

//Outer black circle
fill(0);
beginShape();
curveVertex(48.7, 16.5);
curveVertex(48.7, 16.5);
  curveVertex(38.8, 20.3);
  curveVertex(35.3, 28.3);
  curveVertex(38.3, 35.8);
  curveVertex(44.7, 38.8);
  curveVertex(52.3, 38.7);
  curveVertex(59.3, 32.5);
  curveVertex(60.2, 24.2);
  curveVertex(55.7, 18.2);
curveVertex(48.7, 16.5);
curveVertex(48.7, 16.5);
endShape();

//Inner red circle
fill(242, 99, 76);
beginShape();
curveVertex(48.8, 19.5);
curveVertex(48.8, 19.5);
  curveVertex(42.3, 21.5);
  curveVertex(39.7, 26.3);
  curveVertex(40.2, 31.3);
  curveVertex(43, 34.5);
  curveVertex(48.8, 35.3);
  curveVertex(53.8, 33.5);
  curveVertex(56.7, 29);
  curveVertex(56.2, 23.7);
  curveVertex(52.7, 20.2);
curveVertex(48.8, 19.5);
curveVertex(48.8, 19.5);
endShape();

//Innermost black circle
fill(0);
ellipseMode(CORNER);
ellipse(45.5, 24, 6.2, 6.2);


      //Eyelids

//Top lid of the eye
fill(0);
beginShape();
curveVertex(0, 27);
curveVertex(0, 27);
  curveVertex(13.3, 13.8);
  curveVertex(30, 5.3);
  curveVertex(46, 4.3);
  curveVertex(59.5, 6.6);
   curveVertex(76.8, 10.8);
  curveVertex(91.2, 15.2);
  curveVertex(103.3, 20);
curveVertex(118.2, 27.5);
  curveVertex(102.7, 24.5);
  curveVertex(85, 20);
  curveVertex(85.6, 20.5);
  curveVertex(64.2, 16);
  curveVertex(44.8, 14);
  curveVertex(21.5, 19.7);
curveVertex(0, 30);
curveVertex(0, 30);
endShape(CLOSE);


//Bottom lid of the eye
fill(0);
beginShape();
curveVertex(0, 32);
curveVertex(0, 32);
  curveVertex(9.3, 35.5);
  curveVertex(20.8, 40.8);
  curveVertex(36.2, 47);
  curveVertex(53.5, 49.5);
  curveVertex(69.7, 46);
  curveVertex(84.3, 39);
  curveVertex(100.5, 33.4);
curveVertex(118.2, 27.5);
  curveVertex(103.4, 38);
  curveVertex(86.7, 49);
  curveVertex(68.2, 57);
  curveVertex(47.3, 58.3);
  curveVertex(23, 51.8);
  curveVertex(11.2, 44.5);
curveVertex(0, 34.8);
curveVertex(0, 34.8);
endShape(CLOSE);

//Eyelashes
noFill();
bezier(11.2, 44.5, 5.2, 47.5, 3.7, 53.5, 4.2, 58.7);
bezier(27.8, 53.8, 23.3, 57, 23.3, 63.5, 26.8, 65.7);
bezier(46.3, 58.3, 41.8, 62.2, 42.8, 68.3, 46.7, 70.7);

//Eyebrow
fill(0);
beginShape();
curveVertex(73.3, 0);
curveVertex(73.3, 0);
  curveVertex(85.5, 5);
  curveVertex(94.3, 6);
  curveVertex(111.2, 3.3);
curveVertex(102.5, 0);
curveVertex(102.5, 0);
endShape(CLOSE);


              //Eye in the bottom right-hand corner

//Yellow part of the eye
fill(244, 233, 24);
beginShape();
curveVertex(187, 145);
curveVertex(187, 145);
  curveVertex(177.5, 140.8);
  curveVertex(171, 140.6);
  curveVertex(170.4, 140.6);
  curveVertex(164.7, 141.2);
  curveVertex(152.7, 144.8);
  curveVertex(143.8, 148.7);
curveVertex(133.8, 150);
  curveVertex(140.5, 152.3);
  curveVertex(149.7, 158);
  curveVertex(157.5, 163);
  curveVertex(170, 168);
  curveVertex(181.4, 168.3);
curveVertex(187, 167.3);
curveVertex(187, 167.3);
endShape(CLOSE);


      //Pupil of the eye in the bottom

//Outer red pupil
fill(242, 99, 76);
beginShape();
curveVertex(162.6, 141);
curveVertex(162.6, 141);
  curveVertex(156.9, 147.6);
  curveVertex(156.5, 155.8);
  curveVertex(163.6, 162);
  curveVertex(171.8, 163.5);
  curveVertex(179.9, 161.9);
  curveVertex(184.9, 154.8);
  curveVertex(185.6, 147.3);
  curveVertex(182.6, 141.8);
  curveVertex(176, 138.9);
curveVertex(169, 138.5);
curveVertex(169, 138.5);
endShape();

//Black part of the pupil
fill(0);
beginShape();
curveVertex(171.4, 143.3);
curveVertex(171.4, 143.3);
  curveVertex(166, 143.5);
  curveVertex(162, 146.5);
  curveVertex(160.5, 151.6);
  curveVertex(164, 157.8);
  curveVertex(171.6, 159.5);
  curveVertex(178.6, 156.6);
  curveVertex(180.5, 151.5);
  curveVertex(177.9, 145.5);
curveVertex(171.4, 143.3);
curveVertex(171.4, 143.3);
endShape();

//Blue part of the pupil
fill(116, 110, 177);
beginShape();
curveVertex(171, 145.1);
curveVertex(171, 145.1);
  curveVertex(164.6, 148);
  curveVertex(163.8, 152);
  curveVertex(165.9, 155.8);
  curveVertex(169.6, 157.8);
  curveVertex(175.4, 156.5);
  curveVertex(178.6, 152);
  curveVertex(176.5, 147);
curveVertex(171, 145.1);
curveVertex(171, 145.1);
endShape();

//Black center pupil
fill(0);
ellipseMode(CORNER);
ellipse(168.9, 148.6, 5.5, 5.5);


      //Eyelids

//Upper eye lid
fill(0);
beginShape();
curveVertex(187, 145);
curveVertex(187, 145);
  curveVertex(177.5, 140.8);
  curveVertex(171, 140.6);
  curveVertex(170.4, 140.6);
  curveVertex(164.7, 141.2);
  curveVertex(152.7, 144.8);
  curveVertex(143.8, 148.7);
curveVertex(133.8, 150);
  curveVertex(140.7, 146.8);
  curveVertex(149, 141);
  curveVertex(158, 135);
  curveVertex(167.2, 132.7);
  curveVertex(177.5, 133.2);
curveVertex(187, 137.7);
curveVertex(187, 137.7);
endShape(CLOSE);

//Bottom eyelid
beginShape();
curveVertex(187, 171.6);
curveVertex(187, 171.6);
  curveVertex(180.6, 173);
  curveVertex(172.5, 173.8);
  curveVertex(161.8, 171.9);
  curveVertex(151.5, 164.8);
  curveVertex(142.4, 157.3);
curveVertex(133.8, 150);
  curveVertex(140.5, 152.3);
  curveVertex(149.7, 158);
  curveVertex(157.5, 163);
  curveVertex(170, 168);
  curveVertex(181.4, 168.3);
curveVertex(187, 167.3);
curveVertex(187, 167.3);
endShape(CLOSE);

//Eyelashes for the eye in the bottom
noFill();
line(182.4, 173, 184.3, 175);
line(162.9, 172.4, 160.2, 175);
bezier(153.3, 166, 149, 166.4, 144.5, 171.9, 143.6, 175);
bezier(172.8, 117.4, 169, 121.3, 170.3, 130.3, 173.6, 132.9);
line(187, 133.5, 184, 135.6);


              //Blobs

//The biggest blob below the green eye
noFill();
beginShape();
curveVertex(75.7, 63.3);
curveVertex(75.7, 63.3);
  curveVertex(71.2, 75.5);
  curveVertex(67.8, 95.2);
  curveVertex(59.5, 116.3);
  curveVertex(53, 139);
  curveVertex(57.2, 160);
  curveVertex(75.5, 175);
  curveVertex(89.8, 168.5);
  curveVertex(91., 154.8);
  curveVertex(91.5, 138.7);
  curveVertex(91, 126.5);
  curveVertex(91.8, 116.5);
  curveVertex(92.5, 109.5);
  curveVertex(93.3, 102.5);
  curveVertex(95.5, 87.3);
  curveVertex(97.1, 74.5);
  curveVertex(95.8, 66.3);
  curveVertex(90.3, 62);
  curveVertex(83.3, 61.3);
curveVertex(75.7, 63.3);
curveVertex(75.7, 63.3);
endShape();


              //Lines

//Line across horizontal
bezier(0, 164.5, 17, 157, 37.8, 150.3, 49.5, 146.8);
bezier(49.5, 146.8, 61.3, 143.3, 144.5, 128.5, 187, 109.5);

//Curved Line below the horizontal line
bezier(39.7, 175, 55.8, 162.8, 89.8, 161.8, 101, 175);


              //Asterics(from left-right, bottom-top)

line(0, 123.5, 2.3, 120.8);
line(0, 128.3, 6.8, 128.5);
line(0, 134.5, 4, 138.5);

line(13.3, 98.8, 34, 98.5);
line(16.5, 91.5, 29.5, 105.3);
line(23.8, 89.5, 21.8, 108.5);
line(29.3, 93, 15.3, 105.3); 

line(106, 100, 130, 98.5);
line(109, 91.5, 124.8, 107.8);
line(116.5, 85.3, 115.3, 110.5);
line(123.5, 91, 108.8, 107.8);

line(141.5, 62.3, 165.8, 65.3);
line(141.3, 51.5, 164., 78.8);
line(155.8, 49.3, 152.8, 78.5);
line(171.8, 52.5, 142.3, 76.8);


              //Dot-line-dots
              
//the one on the right side
fill(0);
ellipseMode(CORNER);
ellipse(123.5, 70.8, 10.3, 9);
line(128.7, 70.8, 129.4, 59);
beginShape();
curveVertex(129, 51.5);
curveVertex(129, 51.5);
  curveVertex(126.3, 52.4);
  curveVertex(124.7, 54.7);
  curveVertex(125.5, 58.7);
  curveVertex(130.7, 58.8);
  curveVertex(133.7, 54.7);
  curveVertex(132.1, 52.6);
curveVertex(129, 51.5);
curveVertex(129, 51.5);
endShape(CLOSE);

//the one on the left side
ellipse(11, 126, 8.3, 8.3);
line(19.5, 129.5, 33, 127.9);
ellipse(33, 124.3, 7.7, 7.7);


              //random blobs and shapes
              
//drawing next to green eye
fill(242, 99, 76);
beginShape();
curveVertex(114.2, 0);
curveVertex(114.2, 0);
  curveVertex(119.8, 7.8);
  curveVertex(122.2, 6.4);
  curveVertex(127.5, 4.8);
  curveVertex(135.3, 4);
curveVertex(137.3, 4);
  curveVertex(136.8, 2);
curveVertex(136.2, 0);
curveVertex(136.2, 0);
endShape(CLOSE);

fill(0);
beginShape();
curveVertex(147.2, 0);
curveVertex(147.2, 0);
  curveVertex(146.8, 2.2);
  curveVertex(146.4, 4);
  curveVertex(145.5, 4);
  curveVertex(142, 4);
curveVertex(137.3, 4);
  curveVertex(137, 2.6);
curveVertex(136.2, 0);
curveVertex(136.2, 0);
endShape(CLOSE);

beginShape();
curveVertex(129, 7.7);
curveVertex(129, 7.7);
  curveVertex(121.3, 6.9);
  curveVertex(134.7, 4.1);
curveVertex(137.4, 4);
  curveVertex(137.8, 5.4);
  curveVertex(140, 12.8);
curveVertex(140.5, 15.3);
  curveVertex(138.8, 15.2);
  curveVertex(125.2, 15.6);
curveVertex(123.3, 16);
  curveVertex(123.2, 14.8);
  curveVertex(120.3, 9);
curveVertex(129, 7.7);
curveVertex(129, 7.7);
endShape();

fill(242, 99, 76);
beginShape();
curveVertex(137.4, 4.2);
curveVertex(137.4, 4.2);
  curveVertex(137.9, 5.6);
  curveVertex(139.3, 10.5);
curveVertex(140.5, 15.1);
  curveVertex(141.7, 15.3);
  curveVertex(143.7, 15.5);
curveVertex(144.9, 15.5);
  curveVertex(145, 14.4);
  curveVertex(145.8, 9.2);
  curveVertex(146.3, 5.6);
curveVertex(146.5, 4.5);
  curveVertex(145.5, 4.2);
  curveVertex(142, 4);
  curveVertex(138.7, 4);
curveVertex(137.4, 4.2);
curveVertex(137.4, 4.2);
endShape();

fill(0);
beginShape();
curveVertex(140.5, 15.1);
curveVertex(140.5, 15.1);
  curveVertex(141.7, 15.3);
  curveVertex(143.7, 15.5);
curveVertex(144.8, 16);
  line(144.8, 16, 142.7, 30.7);
curveVertex(142.7, 30.7);
  curveVertex(142.4, 28);
  curveVertex(140.9, 17.4);
curveVertex(140.5, 15.1);
curveVertex(140.5, 15.1);
endShape(); 


              //Blobs and lines connected

//Top-right
fill(242, 99, 76);
beginShape();
curveVertex(163.5, 0);
curveVertex(163.5, 0);
  curveVertex(163.3, 6.3);
  curveVertex(172.8, 10.5);
  curveVertex(179.7, 10.8);
  curveVertex(187, 6.7);
curveVertex(187, 0);
curveVertex(187, 0);
endShape(CLOSE);

fill(0);
beginShape();
curveVertex(175.3, 0);
curveVertex(175.3, 0);
  curveVertex(182.7, 8.3);
  curveVertex(182.7, 5.8);
curveVertex(182.7, 0);
curveVertex(182.7, 0);
endShape(CLOSE);

line(178.5, 10.8, 179.5, 28.7);

fill(242, 99, 76);
beginShape();
curveVertex(187, 29.8);
curveVertex(187, 29.8);
  curveVertex(176, 28.2);
  curveVertex(167.8, 31.7);
  curveVertex(165.8, 40.3);
  curveVertex(175.7, 46);
curveVertex(187, 46.3);
curveVertex(187, 46.3);
endShape(CLOSE);

noFill();
bezier(187, 43.7, 180.2, 62.2, 181.5, 93.7, 187, 105.3);

fill(0);
beginShape();
curveVertex(187, 55.2);
curveVertex(187, 55.2);
  curveVertex(184, 54.2);
  curveVertex(183.9, 55.2);
  curveVertex(183, 62.5);
  curveVertex(183.8, 62.2);
curveVertex(187, 60.3);
curveVertex(187, 60.3);
endShape(CLOSE);

fill(242, 99, 76);
beginShape();
curveVertex(184, 54.2);
curveVertex(184, 54.2);
  curveVertex(179, 55.5);
  curveVertex(178.5, 60.2);
curveVertex(183, 62.5);
curveVertex(183, 62.5);
endShape(CLOSE);

beginShape();
curveVertex(187, 80.8);
curveVertex(187, 80.8);
  curveVertex(183.6, 79.4);
  curveVertex(182.2, 79.2);
  curveVertex(182.3, 80.3);
  curveVertex(182.8, 85.7);
  curveVertex(183, 87);
curveVertex(187, 84.7);
curveVertex(187, 84.7);
endShape(CLOSE);

fill(0);
beginShape();
curveVertex(182.2, 79.2);
curveVertex(182.2, 79.2);
  curveVertex(180.5, 79.2);
  curveVertex(177.8, 80.3);
  curveVertex(177.8, 83);
  curveVertex(178.8, 85.3);
curveVertex(183, 87);
curveVertex(183, 87);
endShape();

fill(242, 99, 76);
ellipse(155.3, 112.7, 10.5, 10.5);

fill(0);
beginShape();
curveVertex(165.8, 117.5);
curveVertex(165.8, 117.5);
  curveVertex(165.1, 120.6);
  curveVertex(161.7, 123);
  curveVertex(157.5, 122.2);
curveVertex(156, 120.7);
curveVertex(156, 120.7);
endShape(CLOSE);

fill(252, 99, 76);
ellipse(119.8, 124.8, 8.8, 9.8);

fill(0);
beginShape();
curveVertex(128.5, 128.3);
curveVertex(128.5, 128.3);
  curveVertex(127, 126);
  curveVertex(123.8, 124.8);
  curveVertex(120.7, 126.8);
curveVertex(119.9, 130.5);
curveVertex(119.9, 130.5);
endShape(CLOSE);

fill(252, 99, 76);
ellipse(37, 146.5, 8.5, 7.8);

fill(0);
beginShape();
curveVertex(44.7, 148.1);
curveVertex(44.7, 148.1);
  curveVertex(40, 146.3);
curveVertex(36.5, 150.3);
curveVertex(36.5, 150.3);
endShape(CLOSE);

ellipse(6, 153.8, 11.5, 10.5);

fill(252, 99, 76);
beginShape();
curveVertex(17.2, 157.5);
curveVertex(17.2, 157.5);
  curveVertex(16.3, 155);
  curveVertex(13.2, 153.5);
  curveVertex(7.1, 156);
  curveVertex(6, 159);
curveVertex(6.6, 161.4);
curveVertex(6.6, 161.4);
endShape(CLOSE);

beginShape();
curveVertex(63.8, 106);
curveVertex(63.8, 106);
  curveVertex(66, 106.2);
  curveVertex(68.5, 107.3 );
  curveVertex(69.8, 108.7);
  curveVertex(72.5, 112.7);
  curveVertex(71.2, 119.7);
  curveVertex(65.3, 124.2);
curveVertex(56.3, 124.2);
  curveVertex(56.9, 122.9);
  curveVertex(59.3, 116.8);
  curveVertex(63.5, 107.4);
curveVertex(63.8, 106);
curveVertex(63.8, 106);
endShape();

fill(0);
beginShape();
curveVertex(56.3, 124.2);
curveVertex(56.3, 124.2);
  curveVertex(56.9, 122.9);
  curveVertex(59.3, 116.8);
  curveVertex(63.5, 107.4);
curveVertex(63.8, 106);
  curveVertex(62.5, 106);
  curveVertex(55.2, 107.7);
  curveVertex(49.8, 114);
  curveVertex(50.5, 120.3);
curveVertex(56.3, 124.2);
curveVertex(56.3, 124.2);
endShape();

fill(0);
ellipse(88, 111.5, 10.2, 10.2);

fill(242, 99, 76);
beginShape();
curveVertex(92.3, 111.3);
curveVertex(92.3, 111.3);
  curveVertex(90.7, 112);
  curveVertex(88.3, 113.7);
  curveVertex(87.3, 116.5);
  curveVertex(88, 119);
  curveVertex(90.3, 120.8);
curveVertex(91.5, 121.4);
curveVertex(91.5, 121.4);
endShape(CLOSE);

fill(0);
beginShape();
curveVertex(70.7, 78.7);
curveVertex(70.7, 78.7);
  curveVertex(73, 78);
  curveVertex(83.5, 73.6);
  curveVertex(94.5, 67.2);
curveVertex(95.8, 66.3);
  curveVertex(95, 65.2);
  curveVertex(89.8, 62);
  curveVertex(84.5, 61.3);
  curveVertex(76.2, 63);
  curveVertex(72.7, 68.8);
  curveVertex(71, 76.5);
curveVertex(70.7, 78.7);
curveVertex(70.7, 78.7);
endShape();

beginShape();
curveVertex(62.3, 166.2);
curveVertex(62.3, 166.2);
  curveVertex(64.3, 166);
  curveVertex(75.2, 165.2);
  curveVertex(88., 167.6);
curveVertex(90, 168);
  curveVertex(89, 170);
  curveVertex(81.2, 174.5);
  curveVertex(72.7, 174.3);
  curveVertex(66, 170);
curveVertex(62.3, 166.2);
curveVertex(62.3, 166.2);
endShape();

fill(242, 99, 76);
beginShape();
curveVertex(62.3, 166.2);
curveVertex(62.3, 166.2);
  curveVertex(64.3, 166);
  curveVertex(75.2, 165.2);
  curveVertex(88., 167.6);
curveVertex(90, 168);
  curveVertex(90.6, 166.5);
  curveVertex(91.8, 156.3);
  curveVertex(91.6, 140.6);
curveVertex(91.4, 137.5);
  curveVertex(90.2, 137.7);
  curveVertex(89.2, 137.9);
  curveVertex(57, 145);
curveVertex(53.2, 145.8);
  curveVertex(53.4, 147.5);
  curveVertex(55.6, 156.8);
  curveVertex(60.6, 164.6);
curveVertex(62.3, 166.2);
curveVertex(62.3, 166.2);
endShape();

