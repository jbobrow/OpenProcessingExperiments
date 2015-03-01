
/* @pjs preload="processingStar.png; spaceship.png; earth.png; meteor.png, text.png */
PImage star ;
PImage spaceship ;
PImage earth ;
PImage meteor ;
PImage text ;

void setup () {
  star=loadImage("processingStar.png");
  spaceship=loadImage("spaceship.png");
  earth=loadImage("earth.png");
  meteor=loadImage("meteor.png");
  text=loadImage("text.png");
  size(640, 600);
  noStroke();
}

void draw () {
  background(0);
  fill(#FFFFFF);

  for (int i = 0; i <30; i++) {
    for (int j = 0; j <30; j++) {

      image(star, 60*i, 80*j, 20, 19);

      image(earth, 300, 200, 400, 410); 
     //image(meteor, 5,10, 264, 241);
      image(spaceship, 20, 25, 139, 121);
      
    }
  }

  //planet shadow on earth//
fill(0,0, 0, 50);
  ellipse(330, 500, 800, 400);
  
  //planet//
  fill(#cb7110);
  ellipse(325, 525, 800, 400);

  //craters//
  //craters left side//

  fill(#ac6111);
  ellipse(170, 363, 70, 73);
  ellipse(112, 373, 40, 43);
  ellipse(55, 403, 70, 73);


  fill(#cb7110);
  ellipse(170, 360, 70, 70);
  ellipse(112, 370, 40, 40);
  ellipse(55, 400, 70, 70);

  fill(#ac6111);
  ellipse(170, 360, 61, 61);
  ellipse(112, 370, 31, 31);
  ellipse(55, 400, 61, 61);

  //middle left craters//
  fill(#ac6111);
  ellipse(142, 478, 87, 90); 
  ellipse(25, 528, 117, 120);

  fill(#cb7110);
  ellipse(142, 475, 85, 85); 
  ellipse(25, 525, 115, 115);

  fill(#ac6111);
  ellipse(142, 474, 78, 78); 
  ellipse(25, 524, 108, 108);

  //middle right craters//
  fill(#ac6111);
  ellipse(495, 480, 77, 77);
  ellipse(600, 530, 118, 118);

  fill(#cb7110);
  ellipse(495, 475, 76, 76);
  ellipse(600, 525, 115, 115);

  fill(#ac6111);
  ellipse(495, 474, 70, 70); 
  ellipse(600, 524, 108, 108);

 





  //craters right side//

  fill(#ac6111);
  ellipse(465, 363, 70, 73);
  ellipse(530, 367, 40, 43);
  ellipse(584, 403, 70, 73);

  fill(#cb7110);
  ellipse(465, 360, 70, 70);
  ellipse(530, 365, 40, 40);
  ellipse(584, 400, 70, 70);

  fill(#ac6111);
  ellipse(465, 360, 61, 61);
  ellipse(530, 365, 31, 31);
  ellipse(584, 400, 61, 61);
  
 

  //ears//
  noStroke();
  fill(#c4ff10);
  ellipse(257, 135, 50, 90);

  fill(#c4ff10);
  ellipse(385, 135, 50, 90);

  //ears shadows//
  fill(#aadf08);
  ellipse(382, 135, 30, 86);

  fill(#aadf08);
  ellipse(260, 135, 30, 86);



  //head//
  fill(#c4ff10);
  ellipse(325, 177, 300, 150);

  fill(#e7ff9f);  
  arc(325, 177, 290, 140, -PI, 0);


  //mouth//

  /*stroke (0);
   strokeWeight (3);
   arc(321, 190, 200, 80, 0, PI);*/

  //mouth - not smiling//
  fill (#91be0a);
  rect(272, 212, 85, 5);

  fill (#aadf08);
  rect(269, 208, 110, 5);
  //teeth//
  fill (#aadf08);  
  triangle(272, 212, 297, 212, 280, 237); 
  fill (255); 
  triangle(270, 210, 295, 210, 278, 235); 

  fill (#aadf08);  
  triangle(351, 212, 372, 210, 364, 237); 
  fill (255); 
  triangle(353, 210, 378, 210, 366, 235); 








  //eyelids//
  fill(#aadf08);
  ellipse(382, 160, 75, 50);

  fill(#aadf08);
  ellipse(260, 160, 75, 50);

  //eyes//
  fill(255);
  ellipse(382, 160, 75, 25);

  fill(255);
  ellipse(260, 160, 75, 25);

  //pupils//
  fill(0);
  ellipse(260, 160, 25, 25);

  fill(0);
  ellipse(382, 160, 25, 25);

  //pupil shine//
  fill(255);
  ellipse(267, 160, 20, 7);

  fill(255);
  ellipse(390, 160, 20, 7);

  //nostrils//
  fill(0);
  ellipse(344, 195, 20, 5);

  fill(0);
  ellipse(305, 195, 20, 5);

  //neck//
  fill(#c4ff10);
  ellipse(323, 270, 30, 50);

  //arms//
  fill(#c4ff10);
  ellipse(323, 340, 220, 150);

  //arm space//
  fill(0);
  ellipse(323, 340, 175, 150);



  fill(#aadf08);
  arc(369, 465, 60, 60, -PI, 0);



  //belly//
  fill(#c4ff10);
  ellipse(323, 340, 150, 150);

  fill(#e7ff9f);
  arc(323, 340, 133, 133, -PI, 0);
  
  //belt shadow on belly//
 fill(#000000, 40);
  rect(257, 335, 130, 25);
  rect(302, 327, 40, 40);
  

 //belt//
 fill(185,0,0);
  rect(257, 340, 130, 25);
//belt buckle shadow  
  fill(122,0,0);
  rect(294, 340, 56, 25);
//belt buckle
    fill(185,0,0);
  rect(302, 332, 40, 40);
  
  //Belt buckle two shapes
  fill(#000000, 65);
   rect(307, 337, 30, 12, 5);
   rect(307, 355, 30, 12, 5);

  //legs//
  fill(#c4ff10);
  ellipse(298, 420, 40, 75);


  fill(#c4ff10);
  ellipse(357, 420, 40, 75);

  //hands//
  fill(#8db908);
  arc(369, 403, 60, 60, -PI, 2);

  fill(#aadf08);
  arc(374, 400, 60, 60, -PI, 2);


  fill(#8db908);
  arc(283, 403, 60, 60, HALF_PI-QUARTER_PI, 6); 

  fill(#aadf08);
  arc(279, 400, 60, 60, HALF_PI-QUARTER_PI, 6); 


  //feet//
  fill(#aadf08);
  arc(287, 465, 60, 60, -PI, 0);

  fill(#aadf08);
  arc(369, 465, 60, 60, -PI, 0);

  //plant shadow//
  fill(#90510e);
  arc(329, 485, 200, 60, -PI, 0);

  fill(#cb7110);
  arc(329, 495, 250, 60, -PI, 0);
  
  //We're Here text 
   image(text, 5, 440, 638, 194);

  //fill (255);
  //text(mouseX + "," + mouseY, 20, 20);
}


