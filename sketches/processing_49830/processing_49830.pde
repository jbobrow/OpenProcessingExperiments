
//processing assignment 1 shapes
//by katy law
//source img: http://www.flickr.com/photos/dareangel/2879784614/lightbox/



void setup() {
  size(336, 252);
  background(#ffffff); //white
}

void draw() {

  //everything below is smooth
  smooth(); 
  noStroke();

  fill(#8B8B8B);
  triangle(42, 114, 51, 82, 60, 77);
  //top big quad
  fill(#8B8B8B);
  quad(41, 84, 143, 15, 186, 10, 216, 72);
  fill(#9b9b9b);
  triangle(40, 114, 42, 73, 53, 81);
  fill(#c8c8c8);
  bezier(42, 72, 58, 88, 46, 89, 68, 72);
  fill(#7F7F7F);
  triangle(90, 57, 123, 48, 140, 18);
  fill(#ffffff);
  bezier(44, 69, 82, 63, 79, 68, 102, 45);
  bezier(140, 18, 157, 0, 184, 0, 192, 13);
  fill(210);
  bezier(140, 18, 165, 21, 170, 20, 191, 10);
  fill(#ffffff);
  bezier(43, 70, 75, 83, 52, 72, 96, 51);
  fill(#C9C9C9);
  bezier(140, 18, 169, 5, 164, 5, 192, 13);


  fill(#ffffff);
  bezier(40, 116, 93, 30, 170, 37, 222, 78);



  fill(#c8c8c8);
  bezier(50, 124, 56, 88, 48, 100, 66, 85);
  fill(#838383);
  bezier(56, 109, 56, 78, 84, 74, 93, 88);
  fill(#ffffff);
  bezier(70, 80, 94, 91, 99, 90, 156, 80);
  noFill();
  stroke(200);
  strokeWeight(.5);
  bezier(64, 83, 84, 82, 78, 76, 92, 62);




  fill(#6a6a6a);//left big grey area 
  beginShape();
  vertex(48, 120);
  vertex(51, 125);
  vertex(54, 117);
  vertex(75, 106);
  vertex(75, 151);
  vertex(108, 205);
  vertex(82, 182);
  vertex(69, 174);
  vertex(60, 165);
  vertex(51, 135);
  vertex(48, 120);
  endShape();
  strokeWeight(.25);
  fill(200);
  bezier(48, 129, 52, 147, 52, 121, 59, 164);
  bezier(60, 167, 79, 186, 78, 173, 108, 205);

  noStroke();
  fill(#cacaca);
  bezier(54, 109, 79, 88, 74, 89, 115, 86);
  bezier(54, 116, 60, 94, 74, 89, 115, 86);

  fill(#ACACAC);
  quad(156, 82, 96, 96, 82, 158, 108, 203);


  fill(#6a6a6a);
  beginShape();
  vertex(76, 105);
  bezierVertex(116, 86, 76, 105, 116, 86);
  bezierVertex(136, 81, 136, 81, 157, 81);
  bezierVertex(119, 98, 132, 86, 113, 107);
  bezierVertex(94, 124, 96, 114, 92, 145);
  bezierVertex(83, 161, 84, 144, 93, 177);
  bezierVertex(83, 185, 85, 180, 108, 203);
  bezierVertex(69, 153, 69, 153, 76, 105);
  endShape();



  fill(#515050);//deep grey line left
  beginShape();
  vertex(70, 109);
  bezierVertex(70, 170, 71, 163, 107, 204);
  bezierVertex(73, 149, 79, 164, 79, 104);
  endShape();

  fill(#DEDEDD);//1st grey away from center
  bezier(156, 82, 103, 117, 91, 123, 113, 170);

  fill(170);//bottom large grey shape
  beginShape();
  vertex(239, 178);
  bezierVertex(223, 202, 223, 197, 218, 225);
  bezierVertex(191, 240, 195, 238, 163, 243);
  bezierVertex(151, 210, 154, 213, 134, 188);
  bezierVertex(133, 167, 135, 178, 130, 157);
  bezierVertex(137, 179, 131, 143, 149, 126);
  bezierVertex(188, 220, 167, 186, 239, 178);
  endShape();

  fill(190);//bottom 2nd layer
  beginShape();
  vertex(149, 126);
  bezierVertex(130, 165, 133, 160, 142, 183);
  bezierVertex(148, 205, 122, 165, 139, 197);
  bezierVertex(202, 202, 138, 206, 215, 185);
  endShape();

  fill(#DFDFDE);//bottom 3rd layer
  beginShape();
  vertex(149, 126);
  bezierVertex(145, 137, 145, 137, 148, 143);
  bezierVertex(153, 169, 146, 158, 159, 165);
  bezierVertex(180, 184, 167, 182, 199, 176);
  endShape();

  fill(140);
  beginShape();
  vertex(133, 164);
  bezierVertex(137, 212, 121, 174, 146, 206);
  bezierVertex(190, 212, 139, 221, 190, 197);
  bezierVertex(152, 209, 173, 209, 142, 186);
  endShape();

  fill(230);//right grey area
  bezier(186, 6, 289, 59, 289, 59, 259, 175);

  fill(#ffffff);
  beginShape();
  vertex(149, 126);
  bezierVertex(170, 175, 137, 144, 226, 182);
  bezierVertex(240, 181, 237, 182, 249, 169);
  bezierVertex(267, 168, 261, 171, 266, 157);
  bezierVertex(278, 145, 289, 149, 265, 143);
  bezierVertex(246, 144, 257, 140, 239, 153);
  bezierVertex(296, 56, 304, 55, 178, 7);
  bezierVertex(237, 134, 243, 108, 204, 147);
  bezierVertex(173, 156, 180, 163, 168, 139);
  bezierVertex(208, 116, 217, 109, 160, 81);
  bezierVertex(115, 112, 113, 116, 114, 160);
  bezierVertex(105, 188, 106, 179, 108, 203);
  endShape();

  fill(245);//bottom right grey
  beginShape();
  vertex(216, 225);
  bezierVertex(253, 196, 243, 208, 269, 156);
  bezierVertex(259, 175, 267, 164, 249, 172);
  bezierVertex(216, 200, 224, 204, 218, 224);
  endShape();

  fill(240);
  beginShape();
  vertex(219, 227);
  bezierVertex(187, 252, 205, 247, 165, 246);
  bezierVertex(156, 233, 162, 256, 160, 237);
  bezierVertex(223, 240, 177, 247, 217, 226);
  endShape();

  fill(#E6E6E5);
  beginShape();
  vertex(156, 81);
  bezierVertex(177, 93, 171, 88, 183, 112);
  bezierVertex(166, 91, 174, 96, 147, 87);
  endShape();

  fill(#4E4E4E);//center
  triangle(188, 125, 176, 122, 176, 126);

  fill(#484848);
  beginShape();
  vertex(182, 63);
  bezierVertex(224, 75, 209, 60, 225, 104);
  bezierVertex(223, 151, 233, 125, 203, 147);
  bezierVertex(200, 134, 200, 134, 203, 124);
  bezierVertex(214, 106, 203, 124, 214, 106);
  bezierVertex(197, 71, 207, 84, 182, 63);
  endShape();

  fill(230);//grey next to center
  beginShape();
  vertex(168, 140);
  bezierVertex(187, 157, 190, 153, 206, 107);
  bezierVertex(198, 79, 208, 96, 176, 74);
  bezierVertex(209, 99, 205, 88, 197, 128);
  bezierVertex(188, 144, 205, 134, 168, 143);
  endShape();


  noFill();
  stroke(230);
  beginShape();
  curveVertex(207, 84);
  curveVertex(210, 106);
  curveVertex(185, 149);
  curveVertex(170, 100);
  endShape();

  stroke(190);
  beginShape();
  curveVertex(161, 78);
  curveVertex(182, 72);
  curveVertex(207, 81);
  curveVertex(209, 105);
  curveVertex(208, 112);
  endShape();

  fill(200);
  noStroke();
  beginShape();
  vertex(170, 154);
  bezierVertex(182, 162, 178, 163, 205, 160);
  bezierVertex(179, 161, 193, 162, 170, 154);
  endShape();

  fill(200);
  beginShape();
  vertex(199, 155);
  bezierVertex(231, 145, 225, 155, 237, 130);
  bezierVertex(249, 120, 247, 127, 246, 113);
  bezierVertex(225, 145, 234, 136, 199, 155);
  endShape();

  stroke(90);//near center line
  strokeWeight(.5);
  beginShape();
  curveVertex(178, 131);
  curveVertex(184, 112);
  curveVertex(173, 92);
  curveVertex(150, 76);
  curveVertex(132, 76);
  endShape();

  fill(200);
  noStroke();
  beginShape();
  vertex(179, 74);
  bezierVertex(220, 72, 206, 82, 207, 114);
  bezierVertex(199, 76, 189, 86, 179, 75);
  endShape();

  fill(80);
  beginShape();
  vertex(190, 76);
  bezierVertex(204, 81, 199, 75, 206, 91);
  bezierVertex(192, 79, 210, 80, 180, 75);
  endShape();



  noStroke();
  fill(240);
  beginShape();
  vertex(105, 58);
  bezierVertex(147, 69, 119, 73, 144, 60);
  endShape();
  beginShape();
  vertex(160, 57);
  bezierVertex(219, 72, 208, 44, 225, 109);
  bezierVertex(206, 58, 223, 78, 174, 62);
  endShape();

  fill(240);//right grey
  beginShape();
  vertex(267, 61);
  bezierVertex(281, 125, 275, 66, 268, 143);
  bezierVertex(278, 109, 275, 128, 285, 106);
  bezierVertex(300, 70, 299, 91, 266, 61);
  endShape();

  fill(250);
  beginShape();
  vertex(253, 48);
  bezierVertex(276, 77, 253, 58, 291, 80);
  bezierVertex(292, 49, 296, 73, 285, 52);
  endShape();

  fill(#cecece);//top right grey
  beginShape();
  vertex(192, 6);
  bezierVertex(241, 9, 232, 3, 278, 36);
  bezierVertex(249, 21, 269, 36, 247, 17);
  bezierVertex(224, 15, 240, 18, 226, 9);
  bezierVertex(191, 9, 214, 12, 192, 6);
  endShape();


  fill(#ffffff);
  quad(186, 6, 186, 20, 220, 20, 220, 15);
  beginShape();
  vertex(42, 67);
  bezierVertex(91, 63, 82, 69, 106, 41);
  bezierVertex(121, 21, 104, 43, 147, 12);
  endShape();

  fill(210);
  beginShape();
  vertex(47, 130);
  bezierVertex(48, 91, 48, 100, 66, 83);
  bezierVertex(53, 111, 59, 95, 47, 130);
  endShape();

  fill(90);
  beginShape();
  vertex(165, 19);
  bezierVertex(200, 58, 175, 20, 208, 69);
  bezierVertex(195, 34, 198, 41, 192, 32);
  bezierVertex(178, 11, 199, 46, 183, 14);
  endShape();



  fill(#ffffff);
  beginShape();
  vertex(265, 51);
  vertex(284, 50);
  vertex(261, 50);
  endShape();

  stroke(230);
  beginShape();
  vertex(199, 34);
  curveVertex(189, 33);
  curveVertex(200, 32);
  curveVertex(221, 42);
  curveVertex(230, 50);
  endShape();

  //editing to the right of center
  noStroke();
  fill(180);
  beginShape();
  vertex(188, 149);
  bezierVertex(208, 147, 180, 153, 201, 148);
  bezierVertex(214, 117, 204, 154, 210, 121);
  bezierVertex(189, 158, 216, 120, 187, 149);
  endShape();

  stroke(250);
  strokeWeight(4);
  beginShape();
  curveVertex(165, 158);
  curveVertex(185, 149);
  curveVertex(202, 125);
  curveVertex(206, 108);
  curveVertex(202, 81);
  endShape();

  stroke(240);//far right faint line
  strokeWeight(1.5);
  beginShape();
  curveVertex(302, 80);
  curveVertex(303, 103);
  curveVertex(304, 116);
  curveVertex(301, 128);
  curveVertex(298, 163);
  curveVertex(299, 185);
  endShape();

  stroke(#ffffff);
  strokeWeight(3);
  beginShape();
  curveVertex(43, 140);
  curveVertex(43, 112);
  curveVertex(57, 87);
  curveVertex(70, 78);
  curveVertex(77, 63);



  endShape();
}
                
