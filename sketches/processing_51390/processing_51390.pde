
/* Niki Sangani
Lab2
Lyonel Feininger - Gaberndorf II*/

void setup() {
  size(530, 700);
  background(0);
  noStroke();
  smooth();

  //big shapes
  fill(163, 51, 17, 75);
  //left shape
  beginShape();
  vertex(0, 0);
  vertex(20, 0);
  vertex(140, 240);
  vertex(160, 240);
  vertex(160, 280);
  vertex(190, 340);
  vertex(120, 340);
  vertex(120, 378);
  vertex(180, 440);
  vertex(30, 410);//point 10 
  vertex(40, 700);
  vertex(0, 700);
  endShape();

  //left dark house
  fill(36, 20, 3, 220);
  beginShape();
  vertex(120, 200);
  vertex(140, 240);
  vertex(160, 240);
  vertex(160, 280);
  vertex(190, 340);
  vertex(130, 340);
  vertex(130, 390);
  vertex(45, 300);
  endShape();

  //middle shape
  fill(109, 31, 7, 80);
  beginShape();
  vertex(380, 140);
  vertex(420, 195);
  vertex(380, 200);
  vertex(350, 300);
  vertex(365, 300);
  vertex(370, 360);
  vertex(350, 400);
  vertex(350, 490); //point 8
  vertex(220, 497);
  vertex(220, 430);
  vertex(260, 426);
  vertex(260, 360);
  vertex(310, 430);
  vertex(305, 469);
  vertex(340, 460);
  vertex(320, 400);
  endShape();

  //yellow shape
  fill(219, 204, 111);
  beginShape();
  vertex(380, 200);
  vertex(530, 300);
  vertex(530, 700);
  vertex(200, 700);
  vertex(160, 700);
  vertex(160, 500);
  vertex(350, 490);
  vertex(350, 400);
  vertex(370, 360);  
  vertex(365, 300);
  vertex(350, 300); 
  vertex(380, 200);
  endShape();

  //right shape
  fill(40, 25, 2);
  beginShape();
  vertex(520, 0);
  vertex(530, 0);
  vertex(530, 700);
  vertex(470, 700);
  vertex(500, 280);  
  vertex(470, 280);
  vertex(520, 40);
  vertex(480, 40);
  endShape();

  //transparent yellow shape 
  fill(161, 123, 26, 85);
  beginShape();
  vertex(380, 200);
  vertex(530, 180);
  vertex(530, 700);
  vertex(430, 700);
  vertex(410, 390);
  vertex(430, 390);
  vertex(405, 360);
  endShape();

  //transparent organe sauare right
  fill(217, 116, 8, 70);
  beginShape();
  vertex(380, 200);
  vertex(530, 180);
  vertex(530, 280);
  vertex(393, 280);
  endShape();

  //transparent bottom square right
  fill(91, 46, 4, 220);
  beginShape();
  vertex(530, 585);
  vertex(530, 700);
  vertex(240, 700);
  //vertex(207,600);
  vertex(240, 600);
  endShape();

  //blended rect bottom middle
  fill(181, 74, 20, 200);
  beginShape();
  vertex(240, 600);
  vertex(240, 700);
  vertex(190, 700);
  vertex(207, 600);
  endShape();

  fill(112, 41, 5, 150);
  beginShape();
  vertex(220, 600);
  vertex(240, 600);
  vertex(240, 700);
  vertex(220, 700);
  endShape();

  fill(112, 41, 5, 180);
  beginShape();
  vertex(240, 570);
  vertex(380, 560);
  vertex(380, 700);
  vertex(240, 700);
  endShape();


  //green sky shapes

  fill(84, 162, 119, 110);  //teal shape sky
  beginShape();
  vertex(20, 0);
  vertex(140, 240);
  vertex(160, 240);
  vertex(160, 280);
  vertex(190, 340);
  vertex(180, 340);//point 6
  vertex(200, 365);
  vertex(330, 350);
  vertex(380, 140);
  vertex(310, 40);
  vertex(260, 80);
  vertex(140, 0);
  endShape();

  //teal shapes by house
  //left
  beginShape();
  vertex(200, 365);
  vertex(270, 350);
  vertex(230, 405);
  endShape();

  //right
  fill(72, 146, 145, 100);
  beginShape();
  vertex(260, 357);
  vertex(330, 350);
  vertex(320, 400);
  vertex(340, 460);
  vertex(305, 469);
  vertex(310, 430);
  endShape();



  fill(100, 119, 53, 180); //green middle shape
  beginShape();
  vertex(280, 0);
  vertex(440, 0);
  vertex(350, 180);
  vertex(360, 220);
  vertex(330, 350);
  vertex(200, 365);
  vertex(180, 340);
  vertex(190, 340);
  vertex(160, 280);
  vertex(160, 150);
  vertex(200, 160);
  vertex(180, 80);
  vertex(280, 0);
  endShape();

  fill(82, 83, 39, 180); // dark olive green sky shapes
  beginShape();
  vertex(440, 0);
  vertex(520, 0);
  vertex(480, 40);
  vertex(520, 40);
  vertex(490, 186);//*
  vertex(420, 195);
  vertex(374, 132);//**
  endShape();

  beginShape();
  vertex(140, 0);
  vertex(280, 0);
  vertex(216, 52);
  endShape();

  //middle shape with lighter color and transparency
  fill(109, 31, 7, 40);
  beginShape();
  vertex(380, 140);
  vertex(420, 195);
  vertex(380, 200);
  vertex(350, 300);
  vertex(365, 300);
  vertex(370, 360);
  vertex(350, 400);
  vertex(350, 490); //point 8
  vertex(220, 497);
  vertex(220, 430);
  vertex(260, 426);
  vertex(260, 360);
  vertex(310, 430);
  vertex(305, 469);
  vertex(340, 460);
  vertex(320, 400);
  endShape();


  //green patch under yellow white left shape
  fill(139, 160, 40, 100);
  beginShape();
  vertex(160, 150);
  vertex(160, 240);
  vertex(140, 240);
  vertex(120, 200);
  vertex(47, 300);
  vertex(25, 280);
  vertex(20, 120);
  endShape();
 
  
  //green around door
  fill(139, 160, 40, 100);
  rect(260,445,40,20);

  //yellow white left
  fill(255, 241, 144, 215);
  beginShape();
  vertex(40, 180);
  vertex(235, 405);
  vertex(220, 430);
  vertex(220, 470);
  vertex(180, 450);
  vertex(180, 440);
  vertex(40, 290);
  endShape();

  fill(36, 20, 3, 80); //transparant dark left house overlay
  beginShape();
  vertex(120, 200);
  vertex(140, 240);
  vertex(160, 240);
  vertex(160, 280);
  vertex(190, 340);
  vertex(130, 340);
  vertex(130, 390);
  vertex(45, 300);
  endShape();

  fill(36, 20, 3);
  rect(50, 230, 20, 20);

  //green grass by bottom of house
  fill(100, 119, 53, 180);
  beginShape();
  vertex(180, 450);
  vertex(267, 495);
  vertex(350, 490);
  vertex(352, 500);
  vertex(192, 525);
  vertex(160, 500);
  vertex(180, 494);
  endShape();

  fill(100, 119, 53, 230); //darker green triangle at left bottom
  beginShape();
  vertex(160, 500);
  vertex(230, 560);
  vertex(160, 560);
  endShape();

  fill(41, 93, 7, 100);//green shape at right side
  beginShape();
  vertex(505, 280);
  vertex(530, 280);
  vertex(530, 390);
  vertex(418, 530);
  vertex(430, 700);
  vertex(470, 700);
  endShape();

  //green roof
  fill(100, 119, 53, 140);
  beginShape();
  vertex(220, 430);
  vertex(260, 357);
  vertex(260, 426);
  endShape();

  stroke(84, 62, 13, 120);
  strokeWeight(3);
  line(160, 500, 240, 570);
  noStroke();

  //red triangle roof left
  fill(123, 33, 1, 70);
  beginShape();
  vertex(0, 248);
  vertex(180, 440);
  vertex(0, 405);
  endShape();

  //red triangle bottom left
  fill(123, 33, 1, 150);
  beginShape();
  vertex(0, 660);
  vertex(160, 580);
  vertex(160, 700);
  vertex(0, 700);
  endShape();

  //green wall of bottom left
  fill(92, 78, 29, 150);
  beginShape();
  vertex(30, 410);
  vertex(180, 440);
  vertex(180, 498);
  vertex(160, 500);
  vertex(160, 580);
  vertex(38, 641);
  endShape();

  //brown window thing bottom left
  fill(78, 41, 22, 220);//plank board looking thing
  beginShape();
  vertex(45, 450);
  vertex(80, 450);
  vertex(80, 550);
  vertex(70, 550);
  vertex(45, 580);
  endShape();

  fill(82, 47, 17);//brown square right of the plank/board
  beginShape();
  vertex(80, 420);
  vertex(160, 435);
  vertex(160, 565);
  vertex(80, 565);
  endShape();

  fill(127, 112, 43, 100);
  beginShape();
  vertex(80, 420);
  vertex(100, 423);
  vertex(100, 560);
  vertex(115, 565);
  vertex(80, 565);
  endShape();

  //door on middle house
  fill(24,12,4);
  //fill(63, 41, 30, 150);
  rect(270, 450, 20, 45);
  
  //dark pannel above door on middle house
  fill(0,50);
  beginShape();
  vertex(220,430);
  vertex(310,430);
  vertex(305,440);
  vertex(220,440);
  endShape();
}


