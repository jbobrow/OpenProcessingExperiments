
int counter;
void setup()
{
  size(800, 800);
  strokeWeight(4);
  smooth();

  background(118, 16, 5);


}

void draw()
{


     int oneTenthWidth = width / 10;
   int oneTenthHeight = height / 10;
   for (int x = 0; x <= 9; x++) {
   for (int y = 0; y <= 9; y++) {

noStroke();

fill(255, 0, 0);
      ellipse(oneTenthWidth * x, oneTenthHeight * y, 10, 10);

   }



//int that clock will function by
  int s = second();
  int m = minute();
  int h = hour();

  strokeWeight(4);


   //outer ear
fill(57, 32, 17);
  ellipse(200, 200, 200, 200);
  ellipse(600, 200, 200, 200);


  fill(103, 47, 15);
  ellipse(400, 400, 150, 150);

  //eye shadows
  noStroke();
  fill(103, 47, 15);
  ellipse(200, 200, 160, 160);
  ellipse(600, 200, 160, 160);

  fill(106, 49, 18);
  ellipse(200, 200, 140, 140);
  ellipse(600, 200, 140, 140);

  fill(113, 53, 21);
  ellipse(200, 200, 120, 120);
  ellipse(600, 200, 120, 120);

  fill(124, 58, 22);
  ellipse(200, 200, 100, 100);
  ellipse(600, 200, 100, 100);

  fill(131, 62, 24);
  ellipse(200, 200, 80, 80);
  ellipse(600, 200, 80, 80);

  fill(142, 66, 26);
  ellipse(200, 200, 60, 60);
  ellipse(600, 200, 60, 60);
  //ear shadow

  ellipse(245, 350, 200, 200);
  ellipse(445, 350, 200, 200);




  //fill(142, 67, 23);
  //ellipse(400, 400, 320, 320);
  //head

  stroke(0);

  fill(77, 47, 30);
  ellipse(400, 400, 600, 600);

  noStroke();
  fill(77, 48, 30);
  ellipse(400, 400, 580, 580);

  fill(80, 49, 31);
  ellipse(400, 400, 570, 570);

  fill(82, 51, 32);
  ellipse(400, 400, 560, 560);

  fill(85, 52, 33);
  ellipse(400, 400, 550, 550);

  fill(90, 56, 36);
  ellipse(400, 400, 540, 540);

  fill(95, 59, 38);
  ellipse(400, 400, 530, 530);

  fill(100, 62, 40);
  ellipse(400, 400, 520, 520);

  fill(106, 65, 42);
  ellipse(400, 400, 510, 510);

  fill(113, 70, 45);
  ellipse(400, 400, 500, 500);

  fill(116, 71, 44);
  ellipse(400, 400, 490, 490);

  fill(121, 74, 46);
  ellipse(400, 400, 480, 480);

  fill(129, 79, 49);
  ellipse(400, 400, 470, 470);

  fill(134, 81, 50);
  ellipse(400, 400, 460, 460);

  fill(139, 84, 52);
  ellipse(400, 400, 450, 450);

  fill(147, 88, 53);
  ellipse(400, 400, 440, 440);

  fill(155, 92, 56);
  ellipse(400, 400, 430, 430);

  fill(157, 94, 57);
  ellipse(400, 400, 420, 420);

  fill(165, 97, 58);
  ellipse(400, 400, 410, 410);

    fill(173, 101, 59);
  ellipse(400, 400, 400, 400);

      fill(178, 104, 61);
  ellipse(400, 400, 390, 390);

        fill(183, 107, 63);
  ellipse(400, 400, 380, 380);

        fill(188, 109, 63);
  ellipse(400, 400, 370, 370);

       fill(193, 111, 62);
  ellipse(400, 400, 360, 360);

      fill(198, 113, 64);
  ellipse(400, 400, 350, 350);

      fill(198, 110, 58);
  ellipse(400, 400, 350, 350);

      fill(203, 111, 58);
  ellipse(400, 400, 340, 340);




  //nose shading

  noStroke();


  fill(139, 81, 52);
  ellipse(330, 550, 140, 100);
  ellipse(440, 550, 140, 100);

  fill(103, 47, 15);
  ellipse(245, 350, 200, 200);
  ellipse(540, 350, 200, 200);

  fill(103, 47, 15);
  ellipse(395, 490, 170, 170);

  fill(106, 49, 18);
  ellipse(395, 500, 140, 140);

  fill(113, 53, 21);
  ellipse(395, 500, 130, 130);

  fill(124, 58, 22);
  ellipse(395, 500, 110, 110);

  fill(131, 62, 24);
  ellipse(395, 500, 90, 90);

  fill(142, 66, 26);
  ellipse(395, 500, 50, 50);


 //eyes and eye fill. right eye = seconds. Left eye = minutes.

  stroke(0);
  fill(0);
  ellipse(245, 370, 200, 200);
  ellipse(540, 370, 200, 200);


   noStroke();

  //red eye dots
  

fill(162, 43, 43);

 ellipse(249, 390, 10, 12);
ellipse(548, 390, 10, 12);
ellipse(252, 343, 10, 12);
ellipse(543, 343, 10, 12);
ellipse(248, 329, 10, 12);
ellipse(530, 329, 10, 12);
 ellipse(222, 369, 10, 12);
ellipse(567, 363, 10, 12);
ellipse(259, 362, 10, 12);
ellipse(526, 386, 10, 12);
ellipse(246, 358, 10, 12);
ellipse(580, 318, 10, 12);

 ellipse(253, 343, 15, 17);
ellipse(541, 343, 15, 17);
ellipse(258, 396, 15, 17);
ellipse(550, 396, 15, 17);
ellipse(241, 320, 15, 17);
ellipse(538, 322, 15, 17);
 ellipse(234, 345, 15, 17);
ellipse(566, 396, 10, 12);
ellipse(256, 355, 10, 12);
ellipse(563, 319, 10, 12);
ellipse(252, 341, 10, 12);
ellipse(528, 391, 10, 12);

 ellipse(230, 420, 15, 17);
ellipse(562, 389, 15, 17);
ellipse(189, 407, 15, 17);
ellipse(543, 322, 15, 17);
ellipse(290, 366, 15, 17);
ellipse(542, 390, 15, 17);
 ellipse(340, 377, 15, 17);
ellipse(520, 364, 10, 12);
ellipse(210, 440, 10, 12);
ellipse(515, 345, 10, 12);
ellipse(220, 312, 10, 12);
ellipse(530, 440, 10, 12);



   fill(255, 31, 31);
 ellipse(245, 370, 10, 10);
ellipse(540, 370, 10, 10);
ellipse(247, 373, 10, 10);
ellipse(547, 373, 10, 10);
ellipse(238, 369, 10, 10);
ellipse(535, 369, 10, 10);
 ellipse(231, 362, 10, 10);
ellipse(563, 383, 10, 10);
ellipse(253, 382, 10, 10);
ellipse(530, 386, 10, 10);
ellipse(249, 328, 10, 10);
ellipse(580, 323, 10, 10);

 ellipse(249, 373, 15, 15);
ellipse(543, 373, 15, 15);
ellipse(250, 376, 15, 15);
ellipse(550, 376, 15, 1);
ellipse(241, 340, 15, 15);
ellipse(538, 372, 15, 15);
 ellipse(234, 365, 15, 15);
ellipse(566, 386, 10, 10);
ellipse(256, 335, 10, 10);
ellipse(563, 389, 10, 10);
ellipse(252, 331, 10, 10);
ellipse(528, 401, 10, 10);

 ellipse(230, 420, 15, 15);
ellipse(562, 389, 15, 15);
ellipse(189, 407, 15, 15);
ellipse(543, 322, 15, 15);
ellipse(290, 366, 15, 15);
ellipse(542, 390, 15, 15);
 ellipse(340, 377, 15, 15);
ellipse(520, 364, 10, 10);
ellipse(210, 440, 10, 10);
ellipse(515, 345, 10, 10);
ellipse(220, 312, 10, 10);
ellipse(530, 440, 10, 10);


   fill(234, 72, 54);
 ellipse(245, 370, 10, 6);
ellipse(540, 370, 10, 6);
ellipse(247, 373, 10, 6);
ellipse(547, 373, 10, 6);
ellipse(238, 369, 10, 6);
ellipse(535, 369, 10, 6);
 ellipse(231, 362, 10, 6);
ellipse(563, 383, 10, 6);
ellipse(253, 382, 10, 6);
ellipse(530, 386, 10, 6);
ellipse(249, 328, 10, 6);
ellipse(580, 323, 10, 6);

 ellipse(249, 373, 15, 11);
ellipse(543, 373, 15, 11);
ellipse(250, 376, 15, 11);
ellipse(550, 376, 15, 11);
ellipse(241, 340, 15, 11);
ellipse(538, 372, 15, 11);
 ellipse(234, 365, 15, 11);
ellipse(566, 386, 10, 6);
ellipse(256, 335, 10, 6);
ellipse(563, 389, 10, 6);
ellipse(252, 331, 10, 6);
ellipse(528, 401, 10, 6);

 ellipse(230, 420, 15, 11);
ellipse(562, 389, 15, 11);
ellipse(189, 407, 15, 11);
ellipse(543, 322, 15, 11);
ellipse(290, 366, 15, 11);
ellipse(542, 390, 15, 11);
 ellipse(340, 377, 15, 11);
ellipse(520, 364, 10, 6);
ellipse(210, 440, 10, 6);
ellipse(515, 345, 10, 6);
ellipse(220, 312, 10, 6);
ellipse(530, 440, 10, 6);







//eye fill
  fill(255, 240, 185);
  ellipse(245, 370, m*3.33, m*3.33);
  ellipse(540, 370, s*3.33, s*3.33);

  fill(255, 242, 196);
  ellipse(245, 370, m*3, m*3);
  ellipse(540, 370, s*3, s*3);

  fill(255, 244, 203);
  ellipse(245, 370, m*2.66,m*2.66);
  ellipse(540, 370, s*2.66, s*2.66);

  fill(255, 246, 211);
  ellipse(245, 370, m*2.33, m*2.33);
  ellipse(540, 370, s*2.33, s*2.33);

  fill(255, 247, 219);
  ellipse(245, 370, m*2, m*2);
  ellipse(540, 370, s*2, s*2);

  fill(255, 249, 227);
  ellipse(245, 370, m*1.66, m*1.66);
  ellipse(540, 370, s*1.66, s*1.66);

  fill(255, 251, 237);
  ellipse(245, 370, m*1.33, m*1.33);
  ellipse(540, 370, s*1.33, s*1.33);

  fill(255, 228, 224, 100);
  ellipse(245, 370, m*1, m*1);
  ellipse(540, 370, s*1, s*1);

  fill(255, 224, 219, 100);
  ellipse(245, 370, m*0.66, m*0.66);
  ellipse(540, 370, s*0.66, s*0.66);

  fill(0);
  ellipse(245, 370, m*0.33, m*0.33);
  ellipse(540, 370, s*0.33, s*0.33);

  rect(370, 450, 50, 50);
  ellipse(360, 475, 35, 50);
  ellipse(430, 475, 35, 50);


  fill(255, 3, 3);
  ellipse(385, 620, h*6, 20);

   }
}


                
                
