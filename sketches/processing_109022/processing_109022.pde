
void setup()
{
  size(600, 600);
  background(#F5E979);
  smooth();
}
void draw()
{
  noStroke();
  //
  fill(232, 83, 3); 
  quad(295, 136, 439, 139, 396, 282, 277, 287);



  //land

  fill(119, 20, 0);
  quad(00, 564, 80, 563, 246, 600, 0, 600);
  quad(127, 578, 505, 588, 600, 600, 127, 600);

  //inner space!!
  noStroke();




  fill(233, 150, 22);
  triangle(208, 423, 206, 467, 126, 438); 

  noStroke();

  arc(206, 466, 165, 140, radians(22), radians(90));
  fill(182, 45, 0);

  arc(206, 466, 165, 140, radians(40), radians(90));

  fill(233, 150, 22);

  noStroke();
  quad(94, 404, 124, 390, 125, 436, 85, 448);
  quad(208, 424, 264, 416, 233, 439, 207, 434);



  stroke(103, 46, 1);
  strokeWeight(0.5);
  triangle(206, 466, 264, 487, 206, 497);


  // 

  //now bone
  stroke(103, 46, 1);
  strokeWeight(3);
  line(195, 424, 195, 426);
  line(195, 428, 207, 426);
  line(207, 426, 205, 542);

  stroke(175, 125, 14);
  line(205, 542, 216, 558);
  stroke(103, 46, 1);
  line(203, 558, 216, 558);

  stroke(131, 56, 0);
  strokeWeight(1);
  line(94, 406, 86, 446);
  line(86, 446, 125, 436);
  line(125, 436, 123, 365);




  stroke(131, 56, 0);
  line(125, 436, 269, 416);
  line(125, 436, 290, 495);
  //

  fill(226, 142, 3);
  quad(265, 416, 270, 415, 233, 442, 229, 442);



  //
  stroke(103, 46, 1);
  strokeWeight(3);
  line(290, 495, 313, 504);



  //man
noStroke();
  fill(170, 122, 29);
  ellipse(194, 400, 50, 50);
  fill(#F5BD23);
  ellipse(182, 395, 10, 10);
  ellipse(203, 393, 8, 8);

  quad(196, 390, 198, 390, 206, 408, 204, 410);





  //rectbig
noStroke();
  fill(94, 38, 25);
  quad(160, 72, 362, 8, 424, 148, 223, 279);
  fill(128, 106, 160);
  quad(221, 153, 423, 148, 379, 262, 223, 278);
  fill(251, 190, 33);
  quad(354, 157, 423, 148, 379, 262, 311, 262);
  //ellipse
  fill(247, 68, 12);
  arc(291, 110, 63, 63, radians(220), radians(400));
  fill(253, 142, 30);
  ellipse(286, 208, 52, 52);

  //line
  strokeWeight(3);
  stroke(162, 36, 9);
  line(160, 72, 297, 518);
  //TRI
  fill(57, 55, 73);
  noStroke();
  triangle(119, 305, 122, 338, 25, 321);

  stroke(162, 36, 9);
  strokeWeight(6);
  strokeCap(SQUARE);
  line(40, 321, 307, 321);


  //leg
  strokeWeight(2);
  stroke(175, 125, 14);
  line(313, 505, 338, 473);
  stroke(103, 46, 1);
  line(338, 473, 348, 474);
}



