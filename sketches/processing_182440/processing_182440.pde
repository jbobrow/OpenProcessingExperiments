
/* @pjs preload="skull.png"; */

//rect(20*i, 20*j, 5, 5) ; 

PImage skull ;

void setup() {  
  skull= loadImage("skull.png") ;
  size(1000, 1000);
  noStroke(); 
}

void draw() {
  background(0);
  for (int i=1; i<1000; i=i+100) { 
  for (int j=1; j<1000; j=j+100) {    
   
    image(skull, i, j, 50, 50) ;
  }
}

  fill(#07902D);
  ellipse(500, 300, 130, 200);

  fill(#FFFFFF);
  ellipse(500, 240, 30, 30);
  
  fill(#080708);
  ellipse(505, 247, 15, 15);
  
  fill(#FFFFFF);
  ellipse(470, 280, 30, 30);
  
  fill(#FFFFFF);
  ellipse(530, 280, 30, 30);
  
  fill(#080708);
  rect(468, 265, 4, 30);
  
  fill(#080708);
  rect(528, 265, 4, 30);
  
  fill(#F51B38);
  ellipse(500, 350, 60, 100);
  
  fill(#FAF7F8);
  triangle(471, 333, 487, 337, 477, 317);
  
  fill(#FAF7F8);
  triangle(529, 333, 510, 337, 522, 317);
  
  fill(#9B6905);
  triangle(468, 217, 437, 170, 449, 241);

  fill(#9B6905);
  triangle(533, 217, 568, 170, 549, 241);
  
  fill(#FAF7F8);
  triangle(477, 382, 483, 381, 480, 389);
  
  fill(#FAF7F8);
  triangle(524, 382, 516, 381, 520, 389);
  
  fill(#36DE8E);
  ellipse(415, 300, 40, 40);
  
  fill(#36DE8E);
  ellipse(386, 325, 40, 40);
  
  fill(#36DE8E);
  ellipse(360, 350, 35, 35);
  
  fill(#36DE8E);
  ellipse(330, 367, 35, 35);
  
   fill(#36DE8E);
  ellipse(300, 360, 30, 30);
  
  fill(#36DE8E);
  ellipse(275, 349, 30, 30);
  
  fill(#36DE8E);
  ellipse(251, 340, 25, 25);
  
  fill(#36DE8E);
  ellipse(233, 330, 20, 20);
  
  fill(#36DE8E);
  ellipse(217, 320, 20, 20);
  
  fill(#36DE8E);
  ellipse(585, 300, 40, 40);
  
  fill(#36DE8E);
  ellipse(615, 325, 40, 40);
  
  fill(#36DE8E);
  ellipse(640, 350, 35, 35);
  
  fill(#36DE8E);
  ellipse(670, 367, 35, 35);
  
   fill(#36DE8E);
  ellipse(700, 360, 30, 30);
  
  fill(#36DE8E);
  ellipse(725, 349, 30, 30);
  
  fill(#36DE8E);
  ellipse(750, 340, 25, 25);
  
  fill(#36DE8E);
  ellipse(768, 330, 20, 20);
  
  fill(#36DE8E);
  ellipse(785, 320, 20, 20);
  
  fill(#36DE8E);
  ellipse(441, 386, 40, 40);
  
  fill(#36DE8E);
  ellipse(410, 405, 35, 35);
  
  fill(#36DE8E);
  ellipse(383, 425, 35, 35);
  
  fill(#36DE8E);
  ellipse(361, 447, 30, 30);
  
  fill(#36DE8E);
  ellipse(342, 465, 25, 25);
  
  fill(#36DE8E);
  ellipse(330, 485, 25, 25);
  
  fill(#36DE8E);
  ellipse(330, 505, 20, 20);
  
  fill(#36DE8E);
  ellipse(560, 386, 40, 40);
  
  fill(#36DE8E);
  ellipse(590, 405, 35, 35);
  
  fill(#36DE8E);
  ellipse(615, 425, 35, 35);
  
  fill(#36DE8E);
  ellipse(637, 447, 30, 30);
  
  fill(#36DE8E);
  ellipse(656, 465, 25, 25);
  
  fill(#36DE8E);
  ellipse(670, 485, 25, 25);
  
  fill(#36DE8E);
  ellipse(670, 505, 20, 20);
  
  fill(#36DE8E);
  ellipse(500, 419, 40, 40);
  
  fill(#36DE8E);
  ellipse(500, 455, 35, 35);
  
  fill(#36DE8E);
  ellipse(495, 489, 35, 35);
  
  fill(#36DE8E);
  ellipse(485, 519, 30, 30);
  
  fill(#36DE8E);
  ellipse(475, 543, 25, 25);
  
  fill(#36DE8E);
  ellipse(480, 565, 25, 25);
  
  fill(#36DE8E);
  ellipse(490, 583, 20, 20);
  
  
   //  fill(255) ;
      text(mouseX + ", " + mouseY, 150, 150) ;
  
}



